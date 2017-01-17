LoraSerial = require './lora-serial'
lora = new LoraSerial

lora.onPacket (packet) =>
  { message, rssi } = packet

  message = {
    lat: message[0]
    lon: message[1]
    altitude: message[2]
    speed: message[3]
    time: message[4]
    rssi
  }

  console.log message
