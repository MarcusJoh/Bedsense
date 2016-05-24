#include <SPI.h>
#include <Ethernet.h>
#include <HttpClient.h>
#include <Xively.h>

// MAC address for your Ethernet shield
byte mac[] = { 0x90, 0xA2, 0xDA, 0x0F, 0x4F, 0x0A };

// Your Xively key to let you upload data
char xivelyKey[] = "2KuPlMi4CgjuOLB4qJOECasRTQGmqDE9XAA2XKV7RYo1Ia6G";

// Analog pin which we're monitoring (0 and 1 are used by the Ethernet shield)
int sensorPin1 = 14; //analog pin 14
int sensorPin2 = 12; //analog pin 12
int sensorPin3 = 11; //analog pin 11
int sensorPin4 = 15; //analog pin 15
int sensorPin5 = 13; //analog pin 13

// Define the strings for our datastream IDs
char sensorId1[] = "sensor1";
char sensorId2[] = "sensor2";
char sensorId3[] = "sensor3";
char sensorId4[] = "sensor4";
char sensorId5[] = "sensor5";



XivelyDatastream datastreams[] = {
  XivelyDatastream(sensorId1, strlen(sensorId1), DATASTREAM_FLOAT),
  XivelyDatastream(sensorId2, strlen(sensorId2), DATASTREAM_FLOAT),
  XivelyDatastream(sensorId3, strlen(sensorId3), DATASTREAM_FLOAT),
  XivelyDatastream(sensorId4, strlen(sensorId4), DATASTREAM_FLOAT),
  XivelyDatastream(sensorId5, strlen(sensorId5), DATASTREAM_FLOAT)

};
// Finally, wrap the datastreams into a feed
XivelyFeed feed(1450731950, datastreams, 5 /* number of datastreams */);

EthernetClient client;
XivelyClient xivelyclient(client);

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);

  Serial.println("Starting multiple datastream upload to Xively...");
  Serial.println();

  while (Ethernet.begin(mac) != 1)
  {
    Serial.println("Error getting IP address via DHCP, trying again...");
    delay(15000);
  }
}

void loop() {
  int val1 = analogRead(sensorPin1);
  val1 = map(val1, 0, 680, 0, 255);
  datastreams[0].setFloat(val1);
  int val2 = analogRead(sensorPin2);
  val2 = map(val2, 0, 680, 0, 255);
  datastreams[1].setFloat(val2);
  int val3 = analogRead(sensorPin3);
  val3 = map(val3, 0, 680, 0, 255);
  datastreams[2].setFloat(val3);
  int val4 = analogRead(sensorPin4);
  val4 = map(val4, 0, 680, 0, 255);
  datastreams[3].setFloat(val4);
  int val5 = analogRead(sensorPin5);
  val5 = map(val5, 0, 680, 0, 255);
  datastreams[4].setFloat(val5);



  Serial.print("Read sensor value ");
  Serial.println(datastreams[0].getFloat());


  Serial.println("Uploading it to Xively");
  int ret = xivelyclient.put(feed, xivelyKey);
  Serial.print("xivelyclient.put returned ");
  Serial.println(ret);

  Serial.println();
  delay(1000);
}

