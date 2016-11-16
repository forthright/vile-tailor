Promise = require "bluebird"
tailor_json = require "./../fixtures/tailor-json"
vile_issues_json = require "./../fixtures/vile-issues-json"

setup = (vile) ->
  vile.spawn.returns new Promise (resolve) ->
    resolve({
      code: 0
      stdout: JSON.stringify tailor_json
      stderr: ""
    })

module.exports =
  issues: vile_issues_json
  setup: setup
