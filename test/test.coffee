rimraf = require 'rimraf'
path   = require 'path'
fs     = require 'fs'

test_template_path = path.resolve(_path, '../../')
test_path          = path.join(__dirname, 'tmp')

describe 'init', ->
  it 'creates new project from template', (done) ->
    tpl = 'test-sprout-sprout'

    sprout.add(tpl, test_template_path)
      .then ->
        sprout.init(tpl, test_path, {config: path.join(_path, 'locals.json')})
      .then ->
        tgt = path.join(test_path, 'readme.md')
        fs.existsSync(tgt).should.be.ok
        contents = fs.readFileSync(tgt, 'utf8')
        contents.should.match /# project x/
      .then ->
        tgt = path.join(test_path, 'test', 'test.coffee')
        fs.existsSync(tgt).should.be.ok
        contents = fs.readFileSync(tgt, 'utf8')
        contents.should.match /test-project-x/
      .then -> sprout.remove(tpl)
      .then -> rimraf.sync(test_path)
      .then -> done()
