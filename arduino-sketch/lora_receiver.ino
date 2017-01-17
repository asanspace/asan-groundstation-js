#include <SPI.h>
#include <LoRa.h>

String message;

void setup() {
  Serial.begin(9600);
  while (!Serial);

  Serial.println("LoRa Receiver");

  if (!LoRa.begin(915E6)) {
    Serial.println("Starting LoRa failed!");
    while (1);
  }
}

void loop() {
  int packetSize = LoRa.parsePacket();
  if (packetSize) {
    while (LoRa.available()) {
      message = message + (char)LoRa.read();
    }
    Serial.print("{\"message\":" + message);
    Serial.print(",\"rssi\":");
    Serial.print(LoRa.packetRssi());
    Serial.println("}");
    message = "";
  }
}
