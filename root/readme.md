# <%= name %>

<%= description %>

### Installation

- `npm install sprout -g`
- `sprout add <%= S(name).slugify().value() %> https://github.com/<%= github_username %>/<%= name %>.git`
- `sprout new <%= S(name).slugify().value() %> myproject `

### Options

- **name** (name of template)
- **description** (a short description of the template)
- **github_username** (name of github user)
