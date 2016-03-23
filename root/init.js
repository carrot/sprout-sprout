exports.configure = [
  {
    name: 'name',
    message: 'What is the name of your project?'
  }, {
    name: 'description',
    message: 'Describe your project'
  }, {
    name: 'github_username',
    message: 'What is your github username?'
  }
]

exports.before = function (utils) {
  // before hook
}

exports.beforeRender = function (utils, config) {
  // beforeRender hook
}

exports.after = function (utils, config) {
  // after hook
}
