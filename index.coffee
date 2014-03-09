path = require 'path'

module.exports =
  initialize: (done) ->
    console.log "Hello"
    publicDir = path.join(__dirname, 'public')
    @stylusMiddleware = require("#{@app.path}/app/middleware/stylus")(publicDir)
    @staticMiddleware = @express.static(publicDir)
    done()

  themeMiddleware: (req, res, next) ->
    @stylusMiddleware req, res, (err) =>
      return next err if err
      @staticMiddleware req, res, next
