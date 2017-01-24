MeshbluService = require './meshblu-service'
LoraSerial = require './lora-serial'
lora = new LoraSerial
meshblu = new MeshbluService {
  uuid: "a9cc1da6-0592-4d11-a1b9-c4f6425d8d48"
  token: "7a0b13dc67076910b6916ff3439f93dc00dabeda"
  resolveSrv: true
}

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
  meshblu.sendMessage message
