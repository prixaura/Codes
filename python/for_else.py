Python 3.4.0 (v3.4.0:04f714765c13, Mar 16 2014, 19:24:06) [MSC v.1600 32 bit (Intel)] on win32
Type "copyright", "credits" or "license()" for more information.
>>> for x in range(1,5):
    if x!=4:
        print x
        
SyntaxError: invalid syntax
>>> for x in range(1,5):
    if x!=4:
        print x
        
SyntaxError: invalid syntax
>>> for x in range(1,5):
    if x!=4:
	    x
else:
	"4 is composite"

	
1
2
3
'4 is composite'
>>> 
