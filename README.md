# Parking assistant with HC-SR04 ultrasonic sensor, sound signaling using PWM, signaling by LED bargraph.

## Team members
* Jančošek Matúš
* Jančová Silvie
* Jánoš Vít
* Jarabý Šimon
 
Link to GitHub project folder: https://github.com/vitoo420/DE1_projekt

## Project objectives
Main objective of this projekt was to create funcional parking assistant using an Arty A7: Artix-7 FPGA Development board. To achive this goal we used HC-SR04 ultrasonic sensor as input for measuring the distance between two objekts. We used buzzer and LED bargraph as outputs for signaling measured distance to the user . We were also thinking about displaying the distance on 7-segment display for more accurate measuring. But more on that later. 


## Hardware description
Hardware used in this project:
* Arty A7-100T board 
* HC-SR04 ultrasonic sensor
* LED bargraph
* 4 Digit 7 segment module

### Arty A7: Artix-7 FPGA Development Board
The Arty boards are designed with versatility and flexibility in mind.

####  ![Arty A7 Board](Images/Board1.png)



#### Table with pinouts for used modules

##### Table for 7 seg 4 digits module 
| Pmod JB | Connection | Cathodes | Pmod JC | Connection | Anodes |
| :-----: | :--------: | :------: | :-----: | :--------: | :----: |
|  Pin 1  |    E15     |    CA    |  Pin 1  |    U12     |  AN0   |
|  Pin 2  |    E16     |    CB    |  Pin 2  |    V12     |  AN1   |
|  Pin 3  |    D15     |    CC    |  Pin 3  |    V10     |  AN2   |
|  Pin 4  |    C15     |    CD    |  Pin 4  |    V11     |  AN3   |
|  Pin 7  |    J17     |    CE    |  Pin 7  |    U14     |   -    |
|  Pin 8  |    J18     |    CF    |  Pin 8  |    V14     |   -    |
|  Pin 9  |    K15     |    CG    |  Pin 9  |    T13     |   -    |
| Pin 10  |    J15     |    DP    | Pin 10  |    U13     |   -    |





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
This section contains the specifications and why they are important to the sensor module. The sensor modules requirements are as follows. Cost, Weigh, Accuracy of object detection. Cost of modules is most important aspect for every new product. It is basic factor in designing the product. Next one is weight because we want out divice to be  simple, light and over all practical. For that we will also need precision and accuracy. 

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

The HC-SR04 has four pins VCC, GND, TRIG and ECHO. The VCC and GND pins are the simplest because they power the HC-SR04. These pins need to be attached to a +5 voltedge source and ground respectively. The TRIG pin is responsible for sending the ultrasonic burst. This pin should be set to HIGH for 10 μs, at which point the HC-SR04 will send out an eight cycle sonic burst at 40 kHZ. After a sonic burst has been sent the ECHO pin will go HIGH. The ECHO pin is the data pin it is used in taking distance measurements. After an ultrasonic burst is sent the pin will go HIGH, it will stay high until an ultrasonic burst is detected back, at which point it will go LOW. 

Taking Distance Measurements 
with HC-SR04 can be triggered to send out an ultrasonic burst by setting the TRIG pin to HIGH. Once the burst is sent the ECHO pin will automatically go HIGH. This pin will remain HIGH until the the burst hits the sensor again. You can calculate the distance to the object by keeping track of how long the ECHO pin stays HIGH. The time ECHO stays HIGH is the time the burst spent traveling.  Using this measurement in equation 1 along with the speed of sound will yield the distance travelled. A summary of this is listed below, along with a visual representation.

![Timing](Images/Timing.png)

To interpret the time reading into a distance you need to change the first equation. The clock on the device you are using will probably count in microseconds or smaller. To useequation 1 the speed of sound needs to determined,which is 343 meters per second atstandard temperature and pressure. To convert this into more useful form use equation 2to change from meters per second to microseconds per centimeter. Then equation 3 canbe used to easily compute the distance in centimeters.

![Timing](Images/rovnica.png)




### Buzzer

### LED bargraph
## Imagine of block structure design
![Modules](Images/Blok1.png)
## Imagine of all modules connected to Arty A7: Artix-7 FPGA Development Board
![Modules](Images/Blok1.png)

## VHDL modules description and simulations

Write your text here.


## TOP module description and simulations

Write your text here.


## Video

*////[![Project Video](http://img.youtube.com/vi/3xFRYkFs/0.jpg)](http://www.youtube.com/wa "Project Overview")///*


## References
https://cdn.sparkfun.com/datasheets/Sensors/Proximity/HCSR04.pdf

https://datasheetspdf.com/pdf-file/1380136/ETC/HC-SR04/1
