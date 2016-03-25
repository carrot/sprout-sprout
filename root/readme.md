# {{ name }}

{{ description }}

### Installation

- `npm install sprout-cli -g`
- `sprout add {{ S.slugify(name) }} git@github.com:{{ github_username }}/{{ S.slugify(name) }}.git`
- `sprout new {{ S.slugify(name) }} myproject `

### Options

- **name** (name of template)
- **description** (a short description of the template)
- **github_username** (name of github user)
