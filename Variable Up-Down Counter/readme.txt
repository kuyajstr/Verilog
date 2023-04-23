This Verilog code run a variable up-down counter 

It is initially set at one-second interval for counting.

For navigation, use the four pushbuttons to control the counter, specifically:
KEY0: decrease the speed of the counter,
KEY1: increase the speed of the counter,
KEY2: reset the counter to zero,
KEY3: push to toggle between counting up and down.

For output and testing, pushing KEY1 increased the speed, once it reached maximum speed it will decrease back to initial speed at 1s

Furthermore, the ten leds on the FPGA board indicate the current speed of the counter.
For example, the are on, with interval:
1s  :  LED0
900ms : LED0, LED1
800ms : LED0, LED1, LED2
700ms : LED0, LED1, LED2, LED3
600ms : LED0, LED1, LED2, LED3, LED4
500ms : LED0, LED1, LED2, LED3, LED4, LED5
...
100ms:  LED0, LED1, LED2, LED3, LED4, LED5, LED6, LED7, LED8, LED9