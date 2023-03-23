# EE316_Project5

EE 316 Computer Engineering Junior Lab
Design Project 5
Spring 2023


Specification:  	Digital system using Xilinx ZynQ processor
Due Date:      		Thursday, April 6
 			Friday, April 8 - written report due. 

Parts List:       
1.	Digilent Cora-Z7-07S 
2.	PMOD buttons and LEDs
3.	Arduino Starter Kit components:
o	Starter kit component
o	Photoresistors(s)  
o	Potentiometer 
o	Servo Motor (SG90) 
o	DC motor 
o	Passive buzzer 
o	LCD module 
o	3.3/5V Power Supply
This project is based on several Tutorials & projects from EE365.  One of the tutorials is based on the digilentinc’s tutorial https://reference.digilentinc.com/vivado/getting-started-with-ipi/start. 

All relevant tutorials are posted on EE316 section on Moodle. 

Develop a digital system that can sample 8-bit data from any of the available analog inputs on Digilent’s Cora Z7 on the Analog header. The system will then control the angular position of a servo motor, the intensity of PMOD LEDs, and the speed of a DC motor. The design will meet the following specifications:

•	Use Digilentinc's Cora-Z7 board, along with Xilinx's Vivado and SDK tools for design.
•	Utilize Xilinx's Zynq processor and other IPs to design the system, assign pins, generate the bitstream, and export it to Xilinx SDK.
•	A potentiometer will provide a voltage between 0 to 3.3V with a 3.3V power supply to control the servo and the PMOD LEDs. 
•	The servo will use a PWM signal with a period of 20ms and duty cycles ranging from 2.5% to 12.5%. The PWM signal will be generated using a custom PWM IP, which will control the duty cycle using XADC values. The servo will rotate from -90 degrees to +90 degrees, as controlled by the potentiometer.
•	The PMOD LEDs' light intensity will be controlled using the AXI Timer's PWM output.
•	A light-sensitive resistor will create a voltage divider with another resistor using the 3.3V power supply to provide another analog voltage source.. This photo-resistor circuit will control the DC motor and a buzzer.
•	The DC motor will be controlled using the AXI Timer's PWM output.
•	The passive buzzer will be controlled by the AXI Timer's PWM output.
•	The design will use onboard buttons using AXI_GPIO IP blocks. The button inputs must use interrupts.
•	Pressing button BTN0 will reset the system asynchronously.
•	Pressing button BTN1 will select between two of the analog sources.
•	Pressing button BTN2 will select between system-enable and disable.
•	The AXI Timer should provide periodic interrupts for all timing needs, such as one-second delays.
•	The LCD unit will display the status (Enable/Disable/Reset, etc.) on the first line and the analog source on the second line. The LCD unit will use the AXI_GPIO.
•	To debug the design, it is recommended to use a debug logic analyzer as a tool. To demonstrate the functionality, a simple data transaction should be carried out on a selected bus. However, it is important to note that it may not be possible to add all signals on the AXI4 bus, so only important signals should be selected to show data transactions.
Useful Links:
•	Microzed Chronicles: 
https://www.adiuvoengineering.com/microzed-chronicles-archive
•	Documentations, Tutorials, Example Projects for Cora Z7-10: Click here
•	Zynq TRM 
•	Zynq Architecture
•	AXI XADC
•	AXI Timer
•	AXI GPIO
Teams: 

Team 1	Team 2	Team 3	Team 4	  Team 5	Team 6	Writer
Kubicka	LaBlue	Morris	Skinner	  Ernesto	Mathew	 
Shawn	  Shawn	  Kaili	  Isabelle	Graham	Pamela	
Keith	  Ella	  Jacob	  Nelson	  Nathan	Zander	 
 	 	            Macy	 	 	 	 

