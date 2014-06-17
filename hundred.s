0x0100:
	load var_count R0
	load var_count R0
	
while:
	jumpn R0 stop
	sub R0 ONE R0
	jump while
stop:
	halt


var_count : block #31