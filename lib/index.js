"use strict";

var _ = require("lodash");
var vile = require("@forthright/vile");

var EMPTY_TAILOR_JSON_RESPONSE = { files: [] };

var to_json = function to_json(string) {
  return _.attempt(JSON.parse.bind(null, string));
};

var tailor = function tailor(plugin_config) {
  var custom_config_path = _.get(plugin_config, "config");
  var paths = _.get(plugin_config, "allow", []);
  var opts = {};

  opts.args = ["-f", "json"];

  if (custom_config_path) {
    opts.args = opts.args.concat("-c", custom_config_path);
  }

  if (!_.isEmpty(paths)) opts.args = _.concat(opts.args, paths);

  return vile.spawn("tailor", opts).then(function (stdout) {
    return stdout ? to_json(stdout) : EMPTY_TAILOR_JSON_RESPONSE;
  });
};

var signature = function signature(violation) {
  return "tailor::" + _.get(violation, "rule");
};

var context = function context(violation) {
  return _.get(violation, "severity") == "warning" ? vile.MAIN : vile.ERR;
};

var line_info = function line_info(violation) {
  var line = _.get(violation, "location.line");
  var character = _.get(violation, "location.column");
  if (line) {
    return {
      start: {
        line: line,
        character: character
      }
    };
  }
};

var vile_issues = function vile_issues(file) {
  return _.get(file, "violations", []).map(function (violation) {
    return vile.issue({
      type: context(violation),
      path: file.path,
      message: violation.message,
      signature: signature(violation),
      where: line_info(violation)
    });
  });
};

var punish = function punish(plugin_data) {
  return tailor(plugin_data).then(function (cli_json) {
    return _.flatten(_.get(cli_json, "files", []).map(vile_issues));
  });
};

module.exports = {
  punish: punish
};