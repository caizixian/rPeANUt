0x0100:
	jump whilebool

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

prepareDrawPixel:
	call readX1
	call drawPiont

readX1:
	push R0
	call getc
	pop R0
	store R0 x1
	jump convertX1

convertX1:
	load #97 R0
	load #48 R1
	load x1 R2
	sub R2 R0 R3
	jumpn R3 convert09X1

	sub R2 R0 R2
	load R2 #ascii R2
	load #16 R0
	mult R0 R2 R2
	store R2 x1
	jump readX2
	
convert09X1:
	sub R2 R1 R2
	load #16 R0
	mult R0 R2 R2
	store R2 x1
	jump readX2

readX2:
	push R0
	call getc
	pop R0
	store R0 x2
	jump convertX2

convertX2:
	load #97 R0
	load #48 R1
	load x2 R2
	sub R2 R0 R3
	jumpn R3 convert09X2

	sub R2 R0 R2
	load R2 #ascii R2
	store R2 x2
	jump readY1
	
convert09X2:
	sub R2 R1 R2
	store R2 x2
	jump readY1

readY1:
	push R0
	call getc
	pop R0
	store R0 y1
	jump convertY1

convertY1:
	load #97 R0
	load #48 R1
	load y1 R2
	sub R2 R0 R3
	jumpn R3 convert09Y1

	sub R2 R0 R2
	load R2 #ascii R2
	load #16 R0
	mult R0 R2 R2
	store R2 y1
	jump readY2
	
convert09Y1:
	sub R2 R1 R2
	load #16 R0
	mult R0 R2 R2
	store R2 y1
	jump readY2
	
readY2:
	push R0
	call getc
	pop R0
	store R0 y2
	jump convertY2

convertY2:
	load #97 R0
	load #48 R1
	load y2 R2
	sub R2 R0 R3
	jumpn R3 convert09Y2

	sub R2 R0 R2
	load R2 #ascii R2
	store R2 y2
	return
	
convert09Y2:
	sub R2 R1 R2
	store R2 y2
	return

drawPiont:
	load x1 R0
	load x2 R1
	add R0 R1 R0
	store R0 x
	load y1 R0
	load y2 R1
	add R0 R1 R0
	store R0 y

	pop R0
	load x1 R0
	load x2 R1
	add R0 R1 R0
	store R0 x

	load y1 R0
	load y2 R1
	add R0 R1 R0
	store R0 y
	load x R0 
	load y R1 
	
	load #32 R4
	mod R0 R4 R4
	rotate R4 ONE R4
	load #0x7C40 R2
	load #6 R3
	mult R1 R3 R1
	load #32 R3
	div R0 R3 R0
	add R0 R2 R2
	add R1 R2 R2

	load R2 R3
	or R3 R4 R4

	store R4 R2
	jump whilebool

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

fillscreen:
	load #960 R1
	load #0x7c40 R2
	rotate #0 ONE R3
	neg R3 R3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

whitescreen:
	store R3 R2
	add R2 ONE R2
	sub R1 ONE R1
	jumpnz R1 whitescreen
	jump 0x0100

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

clearscreen:
	load #960 R1
	load #0x7c40 R2
	rotate #0 ZERO R3
	neg R3 R3

blackscreen:
	store R3 R2
	add R2 ONE R2
	sub R1 ONE R1
	jumpnz R1 blackscreen
	jump 0x0100

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

readRX1:
	push R0
	call getc
	pop R0
	store R0 RX1
	jump convertRX1

convertRX1:
	load #97 R0
	load #48 R1
	load RX1 R2
	sub R2 R0 R3
	jumpn R3 convert09RX1

	sub R2 R0 R2
	load R2 #ascii R2
	load #16 R0
	mult R0 R2 R2
	store R2 RX1
	jump readRX2
	
convert09RX1:
	sub R2 R1 R2
	load #16 R0
	mult R0 R2 R2
	store R2 RX1
	jump readRX2

readRX2:
	push R0
	call getc
	pop R0
	store R0 RX2
	jump convertRX2

convertRX2:
	load #97 R0
	load #48 R1
	load RX2 R2
	sub R2 R0 R3
	jumpn R3 convert09RX2

	sub R2 R0 R2
	load R2 #ascii R2
	store R2 RX2
	jump readRY1
	
convert09RX2:
	sub R2 R1 R2
	store R2 RX2
	jump readRY1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

readRY1:
	push R0
	call getc
	pop R0
	store R0 RY1
	jump convertRY1

convertRY1:
	load #97 R0
	load #48 R1
	load RY1 R2
	sub R2 R0 R3
	jumpn R3 convert09RY1

	sub R2 R0 R2
	load R2 #ascii R2
	load #16 R0
	mult R0 R2 R2
	store R2 RY1	
	jump readRY2
	
convert09RY1:
	sub R2 R1 R2
	load #16 R0
	mult R0 R2 R2
	store R2 RY1
	jump readRY2


readRY2:
	push R0
	call getc
	pop R0
	store R0 RY2
	jump convertRY2

convertRY2:
	load #97 R0
	load #48 R1
	load RY2 R2
	sub R2 R0 R3
	jumpn R3 convert09RY2

	sub R2 R0 R2
	load R2 #ascii R2
	store R2 RY2
	jump readRW1
	
convert09RY2:
	sub R2 R1 R2
	store R2 RY2
	jump readRW1

readRW1:
	push R0
	call getc
	pop R0
	store R0 RW1
	jump convertRW1

convertRW1:
	load #97 R0
	load #48 R1
	load RW1 R2
	sub R2 R0 R3
	jumpn R3 convert09RW1

	sub R2 R0 R2
	load R2 #ascii R2
	load #16 R0
	mult R0 R2 R2
	store R2 RW1	
	jump readRW2
	
convert09RW1:
	sub R2 R1 R2
	load #16 R0
	mult R0 R2 R2
	store R2 RW1
	jump readRW2

readRW2:
	push R0
	call getc
	pop R0
	store R0 RW2
	jump convertRW2

convertRW2:
	load #97 R0
	load #48 R1
	load RW2 R2
	sub R2 R0 R3
	jumpn R3 convert09RW2

	sub R2 R0 R2
	load R2 #ascii R2
	store R2 RW2
	jump readRH1
	
convert09RW2:
	sub R2 R1 R2
	store R2 RW2
	jump readRH1

readRH1:
	push R0
	call getc
	pop R0
	store R0 RH1
	jump convertRH1

convertRH1:
	load #97 R0
	load #48 R1
	load RH1 R2
	sub R2 R0 R3
	jumpn R3 convert09RH1

	sub R2 R0 R2
	load R2 #ascii R2
	load #16 R0
	mult R0 R2 R2
	store R2 RH1	
	jump readRH2
	
convert09RH1:
	sub R2 R1 R2
	load #16 R0
	mult R0 R2 R2
	store R2 RH1
	jump readRH2

readRH2:
	push R0
	call getc
	pop R0
	store R0 RH2
	jump convertRH2

convertRH2:
	load #97 R0
	load #48 R1
	load RH2 R2
	sub R2 R0 R3
	jumpn R3 convert09RH2

	sub R2 R0 R2
	load R2 #ascii R2
	store R2 RH2
	jump rect
	
convert09RH2:
	sub R2 R1 R2
	store R2 RH2
	jump rect

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

rect:
	load RX1 R0
	load RX2 R1
	add R0 R1 R0
	store R0 x
	store R0 topleftX

	load RY1 R0
	load RY2 R1
	add R0 R1 R0
	store R0 y
	store R0 topleftY

	load RW1 R0
	load RW2 R1
	add R0 R1 R0
	store R0 width
	
	load RH1 R0
	load RH2 R1
	add R0 R1 R0
	store R0 height

	load y R0
	load height R1
	add R0 R1 R0
	store R0 bottomleftY
	
	jump drawRect

drawRect:
	load y R0
	load bottomleftY R1
	sub R1 R0 R0
	load width R7
	jumpnz R0 drawRectLine
	jump whilebool
	
drawRectLine:
	call drawPixel
	load x R0
	add R0 ONE R0
	store R0 x
	sub R7 ONE R7
	jumpnz R7 drawRectLine
	load y R0
	add R0 ONE R0
	store R0 y
	load topleftX R0
	store R0 x
	jump drawRect

drawPixel:
	load x R0
	load y R1
	
	load #32 R4
	mod R0 R4 R4
	rotate R4 ONE R4

	load #0x7C40 R2

	load #6 R3
	mult R1 R3 R1
	load #32 R3
	div R0 R3 R0
	
	add R0 R2 R2
	add R1 R2 R2
	
	load R2 R3
	or R3 R4 R4

	store R4 R2
	return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
lineX0a:
	push R0
	call getc
	pop R0
	store R0 tmp1
	jump lineConvertX0a

lineConvertX0a:
	load #97 R0
	load #48 R1
	load tmp1 R2
	sub R2 R0 R3
	jumpn R3 lineConvertX0a09

	sub R2 R0 R2
	load R2 #ascii R2
	load #16 R0
	mult R0 R2 R2
	store R2 tmp1
	jump lineX0b

lineConvertX0a09:
	sub R2 R1 R2
	load #16 R0
	mult R0 R2 R2
	store R2 tmp1
	jump lineX0b

lineX0b:
	push R0
	call getc
	pop R0
	store R0 tmp2
	jump lineConvertX0b

lineConvertX0b:
	load #97 R0
	load #48 R1
	load tmp2 R2
	sub R2 R0 R3
	jumpn R3 lineConvertX0b09

	sub R2 R0 R2
	load R2 #ascii R2
	store R2 tmp2
	jump lineY0a

lineConvertX0b09:
	sub R2 R1 R2
	store R2 tmp2
	jump lineY0a

lineY0a:
	load tmp1 R0
	load tmp2 R1
	add R0 R1 R0
	store R0 x0

	push R0
	call getc
	pop R0
	store R0 tmp1
	jump lineConvertY0a

lineConvertY0a:
	load #97 R0
	load #48 R1
	load tmp1 R2
	sub R2 R0 R3
	jumpn R3 lineConvertY0a09

	sub R2 R0 R2
	load R2 #ascii R2
	load #16 R0
	mult R0 R2 R2
	store R2 tmp1
	jump lineY0b

lineConvertY0a09:
	sub R2 R1 R2
	load #16 R0
	mult R0 R2 R2
	store R2 tmp1
	jump lineY0b

lineY0b:
	push R0
	call getc
	pop R0
	store R0 tmp2
	jump lineConvertY0b

lineConvertY0b:
	load #97 R0
	load #48 R1
	load tmp2 R2
	sub R2 R0 R3
	jumpn R3 lineConvertY0b09

	sub R2 R0 R2
	load R2 #ascii R2
	store R2 tmp2
	jump lineX1a

lineConvertY0b09:
	sub R2 R1 R2
	store R2 tmp2
	jump lineX1a

lineX1a:
	load tmp1 R0
	load tmp2 R1
	add R0 R1 R0
	store R0 y0

	push R0
	call getc
	pop R0
	store R0 tmp1
	jump lineConvertX1a

lineConvertX1a:
	load #97 R0
	load #48 R1
	load tmp1 R2
	sub R2 R0 R3
	jumpn R3 lineConvertX1a09

	sub R2 R0 R2
	load R2 #ascii R2
	load #16 R0
	mult R0 R2 R2
	store R2 tmp1
	jump lineX1b

lineConvertX1a09:
	sub R2 R1 R2
	load #16 R0
	mult R0 R2 R2
	store R2 tmp1
	jump lineX1b

lineX1b:
	push R0
	call getc
	pop R0
	store R0 tmp2
	jump lineConvertX1b

lineConvertX1b:
	load #97 R0
	load #48 R1
	load tmp2 R2
	sub R2 R0 R3
	jumpn R3 lineConvertX1b09

	sub R2 R0 R2
	load R2 #ascii R2
	store R2 tmp2
	jump lineY1a

lineConvertX1b09:
	sub R2 R1 R2
	store R2 tmp2
	jump lineY1a

lineY1a:
	load tmp1 R0
	load tmp2 R1
	add R0 R1 R0
	store R0 x1

	push R0
	call getc
	pop R0
	store R0 tmp1
	jump lineConvertY1a

lineConvertY1a:
	load #97 R0
	load #48 R1
	load tmp1 R2
	sub R2 R0 R3
	jumpn R3 lineConvertY1a09

	sub R2 R0 R2
	load R2 #ascii R2
	load #16 R0
	mult R0 R2 R2
	store R2 tmp1
	jump lineY1b

lineConvertY1a09:
	sub R2 R1 R2
	load #16 R0
	mult R0 R2 R2
	store R2 tmp1
	jump lineY1b

lineY1b:
	push R0
	call getc
	pop R0
	store R0 tmp2
	jump lineConvertY1b

lineConvertY1b:
	load #97 R0
	load #48 R1
	load tmp2 R2
	sub R2 R0 R3
	jumpn R3 lineConvertY1b09

	sub R2 R0 R2
	load R2 #ascii R2
	store R2 tmp2
	jump drawline

lineConvertY1b09:
	sub R2 R1 R2
	store R2 tmp2
	jump drawline

drawline:
	load tmp1 R0
	load tmp2 R1
	add R0 R1 R0
	store R0 y1
	
	; dx := abs(x1 - x0)
	load x1 R1
	load x0 R2
	push R0
	push R1
	push R2
	call abs
	pop R0
	pop R0
	pop R0
	store R0 dx

	; dy := abs(y1 - y0)
	load y1 R1
	load y0 R2
	push R0
	push R1
	push R2
	call abs
	pop R0
	pop R0
	pop R0
	store R0 dy

	;if x0 < x1
ifx0<x1:
	load x0 R0
	load x1 R1
	sub R0 R1 R2
	jumpn R2 sxOne
	store MONE sx

ify0<y1:
	load y0 R0
	load y1 R1
	sub R0 R1 R2
	jumpn R2 syOne
	store MONE sy

storeErr:
	load dx R0
	load dy R1
	sub R0 R1 R2
	store R2 err

lineloop:
	call setPixel
	;if x0 = x1 and y0 = y1 exit loop
	load x0 R0
	load x1 R1
	sub R0 R1 R2
	jumpz R2 andBool

2err:
	load err R0
	load #2 R1
	mult R0 R1 R0
	store R0 e2
	
	;if e2 > -dy
	load e2 R0
	load dy R1
	sub ZERO R1 R1
	sub R1 R0 R2
	jumpn R2 e2dy

ife2<dx:
	load e2 R0
	load dx R1
	sub R0 R1 R2
	jumpn R2 errdx
	jump lineloop

errdx:
	load err R0
	load dx R1
	add R0 R1 R0
	store R0 err
	load y0 R0
	load sy R1
	add R0 R1 R0
	store R0 y0
	jump lineloop

e2dy:
	load err R0
	load dy R1
	sub R0 R1 R0
	store R0 err
	load x0 R0
	load sx R1
	add R0 R1 R0
	store R0 x0
	jump ife2<dx

andBool:
	load y0 R0
	load y1 R1
	sub R0 R1 R2
	jumpz R2 exitLoop
	jump 2err

exitLoop:
	jump whilebool

sxOne:
	store ONE sx
	jump ify0<y1

syOne:
	store ONE sy
	jump storeErr

setPixel:
	load x0 R0
	load y0 R1
	
	load #32 R4
	mod R0 R4 R4
	rotate R4 ONE R4

	load #0x7C40 R2

	load #6 R3
	mult R1 R3 R1
	load #32 R3
	div R0 R3 R0
	
	add R0 R2 R2
	add R1 R2 R2
	
	load R2 R3
	or R3 R4 R4

	store R4 R2
	return

abs:
	load SP #-2 R0
	load SP #-1 R1
	sub R0 R1 R2
	jumpn R2 subReverse
	store R2 #-3 SP
	return

subReverse:
	sub R1 R0 R2
	store R2 #-3 SP
	return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
whilebool:
	push R0
	call getc
	pop R0

	load #'h' R1
	sub R0 R1 R2
	jumpz R2 done

	load #'f' R1
	sub R0 R1 R2
	jumpz R2 fillscreen

	load #'c' R1
	sub R0 R1 R2
	jumpz R2 clearscreen

	load #'p' R1
	sub R0 R1 R2
	jumpz R2 prepareDrawPixel

	load #'r' R1
	sub R0 R1 R2
	jumpz R2 readRX1

	load #'l' R1
	sub R0 R1 R2
	jumpz R2 lineX0a
	
	jump whilebool

done:
	halt

getc:
	load 0xFFF1 R2
	jumpz R2 getc
	load 0xFFF0 R2
	store R2 #-1 SP
	return

tmp1:
	block 1

tmp2:
	block 1
	
x0:
	block 1

y0:
	block 1

x1:
	block 1

x2:
	block 1

y1:
	block 1

y2:
	block 1

x:
	block 1

y:
	block 1

RX1:
	block 1

RX2:
	block 1

RY1:
	block 1

RY2:
	block 1

RW1:
	block 1

RW2:
	block 1

RH1:
	block 1

RH2:
	block 1

width:
	block 1

height:
	block 1

topleftX:
	block 1

topleftY:
	block 1

bottomleftY:
	block 1

dx:
	block 1

dy:
	block 1

sx:
	block 1

sy:
	block 1

err:
	block 1

e2:
	block 1

ascii:
	block #10
	block #11
	block #12
	block #13
	block #14
	block #15