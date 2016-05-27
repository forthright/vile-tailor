let _ = require("lodash")
let vile = require("@forthright/vile")

const EMPTY_TAILOR_JSON_RESPONSE = { files: [] }

let to_json = (string) =>
  _.attempt(JSON.parse.bind(null, string))

let tailor = (plugin_config) => {
  let custom_config_path = _.get(plugin_config, "config")
  let paths = _.get(plugin_config, "allow", [])
  let opts = {}

  opts.args = ["-f", "json"]

  if (custom_config_path) {
    opts.args = opts.args.concat("-c", custom_config_path)
  }

  if (_.isEmpty(paths)) {
    opts.args.push(".")
  } else {
    opts.args = _.concat(opts.args, paths)
  }

  return vile
    .spawn("tailor", opts)
    .then((stdout) => stdout ?
          to_json(stdout) : EMPTY_TAILOR_JSON_RESPONSE)
}

let signature = (violation) => {
  return `tailor::${_.get(violation, "rule")}`
}

let context = (violation) =>
  _.get(violation, "severity") == "warning" ?
      vile.MAIN : vile.ERR

let line_info = (violation) => {
  let line = _.get(violation, "location.line")
  let character = _.get(violation, "location.column")
  if (line) {
    return {
      start: {
        line: line,
        character: character
      }
    }
  }
}

let vile_issues = (file) =>
  _.get(file, "violations", []).map((violation) =>
    vile.issue({
      type: context(violation),
      path: file.path,
      message: violation.message,
      signature: signature(violation),
      where: line_info(violation)
    }))

let punish = (plugin_data) =>
  tailor(plugin_data)
    .then((cli_json) =>
      _.flatten(
        _.get(cli_json, "files", [])
          .map(vile_issues)))


module.exports = {
  punish: punish
}
