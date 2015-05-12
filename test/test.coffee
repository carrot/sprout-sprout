rimraf = require 'rimraf'
path   = require 'path'
fs     = require 'fs'

test_template_path = path.resolve(_path, '../..')
test_path          = path.join(__dirname, 'tmp')
tpl = 'test-sprout-sprout'
opts =
  config: path.join(_path, 'locals.json')

before ->
  sprout.add(tpl, test_template_path)
  .then -> rimraf.sync(test_path)
  .then -> sprout.init(tpl, test_path, opts)

after ->
  sprout.remove(tpl)
  .then -> rimraf.sync(test_path)

describe 'init', ->
  it 'creates generates readme', (done) ->
    tgt = path.join(test_path, 'readme.md')
    fs.existsSync(tgt).should.be.ok
    contents = fs.readFileSync(tgt, 'utf8')
    contents.should.match /# project x/
    done()

  it 'removes .travis.yml when travis option is false', (done) ->
    tgt = path.join(test_path, '.travis.yml')
    fs.existsSync(tgt).should.be.false
    done()

  it 'creates a test.coffee', (done) ->
    tgt = path.join(test_path, 'test', 'test.coffee')
    fs.existsSync(tgt).should.be.ok
    contents = fs.readFileSync(tgt, 'utf8')
    contents.should.match /test-project-x/
    done()

  it 'generates a license', (done) ->
    d = new Date()
    tgt = path.join(test_path, 'license.md')
    fs.existsSync(tgt).should.be.ok
    contents = fs.readFileSync(tgt, 'utf8')
    contents.should.match(new RegExp(d.getFullYear()))
    done()
