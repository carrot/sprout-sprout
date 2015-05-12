exports.configure = [
  {
    name: 'name'
    message: 'What is the name of your sprout template?'
  },
  {
    name: 'description'
    message: 'Describe your project'
  },
  {
    name: 'github_username'
    message: 'What is your github username?'
  },
  {
    type: 'confirm'
    name: 'travis'
    default: true
    message: 'Do you want travis-ci support?'
  }
]

exports.after = (utils, config) ->
  utils.target.remove('.travis.yml') unless config.travis
