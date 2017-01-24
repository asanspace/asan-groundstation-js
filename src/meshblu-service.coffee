MeshbluSocketIO = require 'meshblu'

class MeshbluService
  constructor: (meshbluConfig) ->
    @meshblu = new MeshbluSocketIO meshbluConfig
    @connected = false
    @meshblu.on 'ready', @readyHandler

  readyHandler: () =>
    console.log 'Meshblu Ready'
    @connected = true

  sendMessage: (data) =>
    return if !@connected
    message =
      devices: "*"
      data: data
    @meshblu.message message

module.exports = MeshbluService
