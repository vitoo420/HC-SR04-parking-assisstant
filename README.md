# Parking assistant with HC-SR04 ultrasonic sensor, sound signaling using PWM, signaling by LED bargraph.

## Team members
#### Jančošek Matúš
#### Jančová Silvie
#### Jánoš Vít
#### Jarabý Šimon
#### Link to GitHub project folder: https://github.com/vitoo420/DE1_projekt

## Project objectives

### 


## Hardware description
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
##### ● Working Voltage is DC 5 V
##### ● Working Current is 15mA
##### ● Working Frequency is 40Hz
##### ● Max/Min Range 400cm/2cm
##### ● MeasuringAngle is 15 degree
##### ● Trigger Input Signal 10uS TTL pulse
##### ● Echo Output Signal Input TTL lever signal and the range in proportion
##### ● Dimension of board are 45*20*15mm 

#### *HC-SR04 Timing Chart and Pin Explanations*


#### *HC-SR04 Application*
● Used to avoid and detect obstacles with robots like biped robot, obstacle avoider robot, path finding robot etc.
● Used to measure the distance within a wide range of 2cm to 400cm
● Can be used to map the objects surrounding the sensor by rotating it
● Depth of certain places like wells, pits etc can be measured since the waves can penetrate through wate




## VHDL modules description and simulations

Write your text here.


## TOP module description and simulations

Write your text here.


## Video

*Write your text here*


## References

   https://cdn.sparkfun.com/datasheets/Sensors/Proximity/HCSR04.pdf
   https://datasheetspdf.com/pdf-file/1380136/ETC/HC-SR04/1
