
# GitHub Contributor Rankings

## Project Overview

This project is a **GitHub Contributor Ranking** system built using **Jekyll**. It displays the top contributors of any GitHub repository, ranking them based on their number of commits and lines of code contributed. Each contributor's profile includes details such as:
- **Avatar**
- **Name**
- **Bio**
- **Location**
- **Number of followers**
- **Commits**
- **Lines of code**

The top three contributors are highlighted in **Gold**, **Silver**, and **Bronze**, making the leaderboard visually appealing and rewarding to view.

### Project Goals:
1. Provide a ranking system for contributors to any GitHub repository.
2. Display important contributor meta information in a simple and responsive UI.
3. Use GitHub Actions to automate fetching contributor data daily, ensuring the rankings are always up to date.

## Setup Instructions

### 1. Clone the Project
To begin, clone the repository to your local machine:

```bash
git clone <repo-link>
cd <repo-directory>
```

### 2. Install Jekyll

Ensure that you have **Ruby** and **Bundler** installed. If you don't have them, install them using the following commands:
```bash
sudo apt-get install ruby-full
gem install bundler
```

Then, install **Jekyll**:
```bash
gem install jekyll bundler
```

### 3. Install Dependencies
Navigate to your project folder and install the required gems by running:
```bash
bundle install
```

### 4. Get Your GitHub Personal Access Token
This project requires a GitHub token to interact with the GitHub API. Here's how to generate one:
1. Visit [GitHub Settings](https://github.com/settings/tokens).
2. Click on **Generate new token**.
3. Give the token a name and enable the following scopes:
   - `repo`
   - `read:user`
4. Copy the generated token and store it securely.

### 5. Configure Your Environment

In your project, you'll need to set up the GitHub token in your environment. Create an `.env` file in the project directory:

```bash
touch .env
```

Inside the `.env` file, add your GitHub token like this:
```
GITHUB_TOKEN=<your-personal-access-token>
```

### 6. Update the Project Configuration

In the `_config.yml` file, you need to update the repository information:
```yaml
json:
  - name: contributors
    src: "https://api.github.com/repos/<user_name>/<repository_name>/contributors"
    headers:
      Authorization: "token {{ site.github_token }}"
```

Replace `<user_name>` and `<repository_name>` with the GitHub repository's owner and name.

### 7. Run the Fetch Script

To fetch contributor data, run the following command:
```bash
ruby fetch_contributor_data.rb
```

This will generate a `_data/contributors.json` file, which the Jekyll site will use to display contributor rankings.

### 8. Start the Jekyll Server

Now, you're ready to run the Jekyll site locally. Start the server using:
```bash
bundle exec jekyll serve
```

Visit `http://localhost:4000/` in your browser to see the contributor rankings.

## GitHub Actions Automation

This project uses **GitHub Actions** to automate the daily update of contributor data. The action defined in `update_contributions.yml` fetches new data every day at midnight UTC and commits the updated data to the repository.

To enable this:
1. Ensure the repository is pushed to GitHub.
2. In the GitHub repository, go to **Settings** > **Secrets** > **Actions** and add your **GITHUB_TOKEN** as a secret.

The action will run automatically according to the schedule set in the `update_contributions.yml` file.

## Summary

This GitHub Contributor Ranking project allows you to easily configure it for any GitHub repository. It highlights key contributor data and is fully responsive with a modern design. Automated updates ensure that the data is always fresh, making it a powerful tool for tracking and showcasing contributor efforts.
