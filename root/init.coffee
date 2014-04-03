exports.before = (sprout, done) ->
  console.log 'generating new sprout template'
  done()

exports.configure = [
  {
    type: 'input',
    name: 'name',
    message: 'What is the name of your project?'
  },
  {
    type: 'input',
    name: 'github_username',
    message: 'What is your github username?'
  },
  {
    type: 'input',
    name: 'description',
    message: 'Describe your project'
  }
]

exports.after = (sprout, done) ->
  # after hook
