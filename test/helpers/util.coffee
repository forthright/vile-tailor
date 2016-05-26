Promise = require "bluebird"
tailor_json = require "./../fixtures/tailor-json"
vile_issues_json = require "./../fixtures/vile-issues-json"

setup = (vile) ->
  vile.spawn.returns new Promise (resolve) ->
    resolve(JSON.stringify tailor_json)

module.exports =
  issues: vile_issues_json
  setup: setup
