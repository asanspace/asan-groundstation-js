
SerialPort = require 'serialport'
port = new SerialPort '/dev/ttyACM0', parser: SerialPort.parsers.readline '\n'

port.on 'open', () ->
  console.log 'Port open!'

port.on 'data', (data) ->
  console.log { data }
