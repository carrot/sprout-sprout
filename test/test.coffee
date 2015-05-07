rimraf = require 'rimraf'
path   = require 'path'
fs     = require 'fs'

test_template_path = path.resolve(_path, '../..')
test_path          = path.join(__dirname, 'tmp')
tpl = 'test-sprout-sprout'
opts =
  config: path.join(_path, 'locals.json')

before ->
  sprout.add(tpl, test_template_path, {verbose: true})
  .then -> rimraf.sync(test_path)
  .then -> sprout.init(tpl, test_path, opts)
after ->
  sprout.remove(tpl)
  .then -> rimraf.sync(test_path)

describe 'sprout.init', ->
  it 'properly creates new project from locals', (done) ->
    tgt = path.join(test_path, 'readme.md')
    fs.existsSync(tgt).should.be.true

    contents = fs.readFileSync(tgt, 'utf8')
    contents.should.match /# project x/
    done()

  it 'removes .travis.yml when travis option is false', (done) ->
    tgt = path.join(test_path, '.travis.yml')
    fs.existsSync(tgt).should.be.false
    done()
