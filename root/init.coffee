exports.before = (sprout, done) ->
  # before hook
  
exports.configure = [
  {
    type: 'input',
    name: 'name',
    message: 'What is the name of your project?'
  },
  {
    type: 'input',
    name: 'description',
    message: 'Describe your project'
  },
  {
    type: 'input',
    name: 'github_username',
    message: 'What is your github username?'
  }
]

exports.before_render = (sprout, done) ->
  # before_render hook

exports.after = (sprout, done) ->
  # after hook
