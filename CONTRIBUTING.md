# Contributing to GitHub Contributor Rankings

Thank you for considering contributing to this project! We welcome all kinds of contributions, including bug reports, feature suggestions, and code improvements. Please read this guide before making any changes to ensure the process is smooth and efficient.

## Getting Started

1. **Fork the Repository**: Fork the project to your own GitHub account by clicking the 'Fork' button at the top of the repository page.
2. **Clone Your Fork**: Clone your fork to your local machine using:
   ```bash
   git clone https://github.com/<your-username>/<repo-name>.git
   ```
3. **Create a Branch**: Create a new branch for your contribution. Use a descriptive branch name:
   ```bash
   git checkout -b feature/your-feature-name
   ```
4. **Install Dependencies**: Install the required dependencies using Bundler:
   ```bash
   bundle install
   ```

## Coding Standards

Please adhere to the following coding standards when contributing to this project:

### General Guidelines
- Follow **semantic versioning** for naming branches and releases.
- Keep code **clean and well-commented**.
- Ensure that **PR titles** are descriptive of the changes made.
- Aim for **readable** and **maintainable** code.
  
### Ruby Standards
- Follow **Ruby style guide** for any Ruby code changes:
  - Indentation: 2 spaces.
  - Use single quotes `'` unless string interpolation or special symbols are required.
  - Use descriptive method and variable names.
  - Add **comments** where necessary for clarity.
  
### HTML/CSS Standards
- **HTML**:
  - Follow proper **HTML5 structure**.
  - Ensure all tags are **closed** properly.
  - Indentation: 2 spaces.
- **CSS**:
  - Use **BEM naming conventions** (Block Element Modifier) where possible.
  - Keep CSS **modular** and reusable.
  - Use **flexbox** or **grid** for layout structures.
  - Avoid hardcoding widths or heights unless necessary.

## Pull Requests

Before submitting a pull request:
1. Ensure that your changes are **properly tested** and **working as expected**.
2. Update any relevant documentation if necessary.
3. Commit your changes with a descriptive commit message:
   ```bash
   git commit -m "Add feature: Detailed contributor info on cards"
   ```
4. Push to your branch:
   ```bash
   git push origin feature/your-feature-name
   ```
5. Open a **pull request** from your branch on GitHub and provide a clear description of the changes.

## Issue Reporting

If you encounter any bugs, issues, or have suggestions for improvements, please open a [GitHub issue](https://github.com/kartikmehta8/reputation-framework/issues) with:
- A clear **title** summarizing the issue.
- A **detailed description** of the problem.
- Any **relevant steps** to reproduce the issue.
- Possible **solution or suggestion** (if applicable).

## Coding Examples

### Ruby Example
When writing or modifying Ruby scripts, follow the structure below:

```ruby
require 'octokit'
require 'json'

client = Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'])

repo = 'owner/repository'
contributors = client.contributors(repo)

contributors.each do |contributor|
  puts contributor.login
end
```

### HTML Example
Ensure proper HTML structure and semantics:

```html
<div class="contributor-card">
  <img src="avatar_url" alt="Contributor Avatar">
  <h3>Contributor Name</h3>
  <p>Number of Commits: 50</p>
</div>
```

### CSS Example
Use BEM naming convention:

```css
.contributor-card {
  padding: 20px;
  background-color: #fff;
}

.contributor-card__header {
  display: flex;
  align-items: center;
}
```

## Thanks for Contributing!

We appreciate your time and effort in helping us improve the project. Feel free to reach out with any questions or suggestions.
