// Source: https://community.particle.io/t/photon-thermocouple-project/29031/6

// This #include statement was automatically added by the Particle IDE.
#include "Adafruit_MAX31855/Adafruit_MAX31855.h"

#include "math.h"

int thermoCLK = D2;
int thermoCS = D3;
int thermoDO = D4;

Adafruit_MAX31855 thermocouple(thermoCLK, thermoCS, thermoDO);

void setup() {
    while(!Serial);
    Serial.begin(9600);

    // wait for MAX chip to stabilize
    delay(500);
}

void loop() {
    // basic readout test, just print the current temp

    double temp = thermocouple.readCelsius();

    double int_temp = thermocouple.readInternal();

    // double c = thermocouple_0.readCelsius();

    // Serial.print("Internal Temp = ");
    // Serial.println(thermocouple.readInternal());
    // Serial.print("Internal Temp 0= ");
    // Serial.println(int_temp0);

    // Serial.print("Internal Temp 1= ");
    // Serial.println(int_temp1);

    Particle.publish("internaltemperature", String(int_temp), 1, PRIVATE);

    if (isnan(temp)) {
        // Serial.println("Something wrong with thermocouple 0!");
        Particle.publish("thermocouple0", "Something wrong with thermocouple!", 1, PRIVATE);
    } else {
        // Serial.print("C 0= "); 
        // Serial.println(temp0);
        Particle.publish("thermocouple0", String(temp), 1, PRIVATE);
   }
   // Serial.print("F = ");
   // Serial.println(thermocouple.readFarenheit());

   delay(2000);
}
