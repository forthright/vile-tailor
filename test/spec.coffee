mimus = require "mimus"
vile_tailor = mimus.require "./../lib", __dirname, []
chai = require "./helpers/sinon_chai"
util = require "./helpers/util"
vile = mimus.get vile_tailor, "vile"
expect = chai.expect

# TODO: write integration tests for spawn -> cli
# TODO: don't use setTimeout everywhere (for proper exception throwing)

describe "tailor", ->
  afterEach mimus.reset
  after mimus.restore
  beforeEach ->
    mimus.stub vile, "spawn"
    util.setup vile

  describe "#punish", ->
    it "converts tailor json to issues", ->
      vile_tailor
        .punish {}
        .should.eventually.eql util.issues

    it "handles an empty response", ->
      vile.spawn.reset()
      vile.spawn.returns new Promise (resolve) -> resolve ""

      vile_tailor
        .punish {}
        .should.eventually.eql []

    it "calls tailor as json, with no color", (done) ->
      vile_tailor
        .punish {}
        .should.be.fulfilled.notify ->
          setTimeout ->
            vile.spawn.should.have.been
              .calledWith "tailor", args: [
                              "-f"
                              "json"
                              "."
                            ]
            done()
      return

    describe "with a custom config path", ->
      it "passes the path as a tailor cli option", (done) ->
        config_path = ".custom-config.yml"

        vile_tailor
          .punish config: config_path
          .should.be.fulfilled.notify ->
            setTimeout ->
              vile.spawn.should.have.been
                .calledWith "tailor", args: [
                              "-f"
                              "json"
                              "-c"
                              config_path
                              "."
                            ]
              done()
        return

    describe "with an allow list", ->
      it "passes the file args to tailor", (done) ->
        vile_tailor
          .punish allow: ["foo", "bar"]
          .should.be.fulfilled.notify ->
            setTimeout ->
              vile.spawn.should.have.been
                .calledWith "tailor", args: [
                              "-f"
                              "json"
                              "foo"
                              "bar"
                            ]
              done()
        return
