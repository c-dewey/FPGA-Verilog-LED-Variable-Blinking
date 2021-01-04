# FPGA-Verilog-LED-Variable-Blinking

Programmed in Xilinx Vivado using Verilog
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
By utilizing the 125 MHz internal clock on my PYNQ Z2 FPGA, I was able to design a circuit that blinks LED0 at a variable rate when a specific button is pushed.  

Using only button 0 and the two switches on the board, my circuit allows for 4 blink rates. I chose those rates to be 1 Hz, 5 Hz, 10 Hz, and 50 Hz. 

The circuit required me to design four counting processes, and connect them to a multiplexer alongside the switches that determine which variable rate the LED should
currently blink at. This project was significantly more technically complex compared to previous projects where I simply turned on LED's.

Relevant files and circuit diagram can be found in the main branch of the repository.

Video demonstration and explanation:
