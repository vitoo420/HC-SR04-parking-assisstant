# Parking assistant with HC-SR04 ultrasonic sensor, sound signaling using PWM, signaling by LED bargraph.

## Team members
* Jančošek Matúš
* Jančová Silvie
* Jánoš Vít
* Jarabý Šimon
 
Link to GitHub project folder: https://github.com/vitoo420/DE1_projekt

## Project objectives

### 


## Hardware description
Hardware used in this project:
* Arty A7-100T board 
* HC-SR04 ultrasonic sensor
* LED bargraph
* Custom 4 Digit 7 segment module

### Arty A7: Artix-7 FPGA Development Board
The Arty boards are designed with versatility and flexibility in mind.
####  ![Arty A7 Board](Images/Board1.png)






### HC-SR04 ultrasonic sensor
#### *Description of HC-SR04 ultrasonic sensor*

![HC-SR04](Images/Sensor3.png)

First of all we have to understand how the ultrasonic sensors works. Ultrasonic sensors use sound to determine the distance between the sensor and theclosest object in its path. 
Ultrasonic sensors are essentially sound sensors, but they operate at a frequency above human hearing. The sensor sends out a sound wave at a specific frequency (Original signal). 
It then listens for that specificsound wave to bounce off of an object and come back (Reflected signal).

![HC-SR04](Images/Sensor4.png)

The sensor keeps trackof the time between sending the sound wave and the sound wave returning. 
If you knowhow fast something is going and how long it is traveling you can find the distancetraveled with equation d=v*t

#### *HC-SR04 Specifications for this projekt*
This section contains the specifications and why they are important to the sensor module. Thesensor modules requirements are as follows. Cost, Weigh, Accuracy of object detection. 

#### *HC-SR04 Electric Parameter*
* Working Voltage is DC 5 V
* Working Current is 15mA
* Working Frequency is 40Hz
* Max/Min Range 400cm/2cm
* MeasuringAngle is 15 degree
* Trigger Input Signal 10uS TTL pulse
* Echo Output Signal Input TTL lever signal and the range in proportion
* Dimension of board are 45*20*15mm 

#### *HC-SR04 Timing Chart and Pin Explanations*

The HC­SR04 has four pins, VCC, GND, TRIG and ECHO; these pins all have different functions. The VCC and GND pins are the simplest ­­ they power the HC­SR04. These pins need to be attached to a +5 volt source and ground respectively. There is a single control pin: the TRIG pin. The TRIG pin is responsible for sending the ultrasonic burst. This pin should be set to HIGH for 10 μs, at which point the HC­SR04 will send out an eight cycle sonic burst at 40 kHZ. After a sonic burst has been sent the ECHO pin will go HIGH. The ECHO pin is the data pin ­­ it is used in taking distance measurements. After an ultrasonic burst is sent the pin will go HIGH, it will stay high until an ultrasonic burst is detected back, at which point it will go LOW. Taking Distance Measurements The HC­SR04 can be triggered to send out an ultrasonic burst by setting the TRIG pin to HIGH. Once the burst is sent the ECHO pin will automatically go HIGH. This pin will remain HIGH until the the burst hits the sensor again. You can calculate the distance to the object by keeping track of how long the ECHO pin stays HIGH. The time ECHO stays HIGH is the time the burst spent traveling.  Using this measurement in equation 1 along with the speed of sound will yield the distance travelled. A summary of this is listed below, along with a visual representation in Figure 2.

#### *HC-SR04 Application*
* Used to avoid and detect obstacles with robots like biped robot, obstacle avoider robot, path finding robot etc.
* Used to measure the distance within a wide range of 2cm to 400cm
* Can be used to map the objects surrounding the sensor by rotating it
* Depth of certain places like wells, pits etc can be measured since the waves can penetrate through wate

## Imagine of all modules connected to Arty A7: Artix-7 FPGA Development Board
![Modules](Images/Blok1.png)

## VHDL modules description and simulations

Write your text here.


## TOP module description and simulations

Write your text here.


## Video

[![Project Video](http://img.youtube.com/vi/3xFRkxmYkFs/0.jpg)](http://www.youtube.com/wa "Project Overview")


## References

   https://cdn.sparkfun.com/datasheets/Sensors/Proximity/HCSR04.pdf
   https://datasheetspdf.com/pdf-file/1380136/ETC/HC-SR04/1
