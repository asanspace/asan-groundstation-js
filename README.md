# GroundStation

Parts:

1. Adafruit LoRa RFM9x (we use 900mhz)
1. Arduino Micro (or any arduino really)
1. PocketCHIP (you can use anything with a serialport really..)

## Wiring

### LoRa

| Semtech SX1276/77/78/79 | Arduino |
| :---------------------: | :------:|
| VCC | 3.3V |
| GND | GND |
| SCK | SCK |
| MISO | MISO |
| MOSI | MOSI |
| NSS | 10 |
| NRESET | 9 |
| DIO0 | 2 |

## Running

You can pass the port to use

```
LORA_PORT=/dev/tty.usbmodem14111 npm start
```
Or just run npm start if you're on a pocketCHIP
