require 'octokit'
require 'json'

client = Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'])

repo = '' # GitHub Repo Owner / Repo Name, example - 'kartikmehta8/ComfortConnect'
exclude_users = [] # Usernames of excluded users.

contributors_data = {}

contributors = client.contributors(repo)

contributors.each do |contributor|
  next if exclude_users.include?(contributor.login)

  user_details = client.user(contributor.login)

  contributors_data[contributor.login] = {
    commit_count: 0,
    lines_of_code: 0,
    avatar_url: contributor.avatar_url,
    name: user_details.name || contributor.login,
    bio: user_details.bio || "No bio available",
    location: user_details.location || "Unknown location",
    followers: user_details.followers,
    username: contributor.login
  }

  commits = client.commits(repo, author: contributor.login)

  commits.each do |commit|
    contributors_data[contributor.login][:commit_count] += 1

    diff = client.commit(repo, commit.sha).files.map(&:patch).join("\n")
    # Count lines added. (lines starting with '+')
    contributors_data[contributor.login][:lines_of_code] += diff.scan(/^\+/).count
  end
end

sorted_contributors = contributors_data.sort_by { |_, data| [-data[:commit_count], -data[:lines_of_code]] }.to_h

File.open('_data/contributors.json', 'w') do |f|
  f.write(JSON.pretty_generate(sorted_contributors))
end

puts "Contributor data saved to _data/contributors.json"
