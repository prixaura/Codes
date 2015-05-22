Python 3.4.0 (v3.4.0:04f714765c13, Mar 16 2014, 19:24:06) [MSC v.1600 32 bit (Intel)] on win32
Type "copyright", "credits" or "license()" for more information.
>>> one=0b1
>>> two=0b10
>>> 0b111+0b1
8
>>> 0b1010+0b1011
21
>>> bin(5)
'0b101'
>>> bin(10)
'0b1010'
>>> int("1101",2)
13
>>> int(bin(2),2)
2
>>> shift_left = 0b1
>>> shift_right = 0b1100
>>> shift_right=shift_right>>2
>>> shift_left=shift_left<<2
>>> bin(shift_right)
'0b11'
>>> bin(shift_left)
'0b100'
>>> bin(0b100 & 0b111)
'0b100'
>>> 0b1110 | 0b101
15
>>> bin(0b1110^0b101)
'0b1011'
>>> ~1
-2
>>> ~4   # adding 1 to the number and then making it negetive
-5
>>> def check_bit4(input):
	m=0b1000
	if (input & m)>0:
		return "on"
	else:
		return "off"

	
>>> check_bit4(0b1111)
'on'
>>> #& is used to check wether a bit is on
>>> #| is used to turn on
>>> a = 0b10111011
>>> bin(a|0b100)   # ensuring the third bit is on
'0b10111111'
>>> #^ is used for flipping the digits
>>> bin(a|0b11111111)    #flipping the digits
'0b11111111'
>>> bin(a^0b11111111)    #flipping the digits
'0b1000100'
>>> "to flip the nth digit from the right"
'to flip the nth digit from the right'
>>> def flip_bit(number,n):
	m=(0b1<<(n-1))
	return bin(number^m)

>>> flip_bit(13,3)
'0b1001'
>>> 
