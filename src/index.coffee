SX127x = require('sx127x')
sx127x = new SX127x({
    frequency: 915e6
    resetPin: 414
    dio0Pin: 413
  })

sx127x.open (err) =>
  console.log 'open', if err then err else 'success'
  throw err if err?

  sx127x.on 'data', (data, rssi) =>
    console.log 'data:', '\'' + data.toString() + '\'', rssi

  sx127x.receive (err) =>
    console.log 'receive', if err then err else 'success'

process.on 'SIGINT', =>
  sx127x.close (err) =>
    console.log 'close', if err then err else 'success'
    process.exit()
