SerialPort = require 'serialport'
_          = require 'lodash'

class LoraSerial
  constructor: () ->
    port = process.env.LORA_PORT || '/dev/ttyACM0'
    loraRadio = new SerialPort port, parser: SerialPort.parsers.readline '\r\n'
    @packetHandlers = []
    loraRadio.on 'open', (err) ->
      throw err if err?
      console.log 'Port open!'

    loraRadio.on 'data', @handlePacket

  onPacket: (fn) =>
    @packetHandlers.push fn

  handlePacket: (packet) =>
    try
      packet = JSON.parse packet
    catch error
      return console.log 'parse error'
    _.each @packetHandlers, (handler) => handler(packet)

module.exports = LoraSerial
