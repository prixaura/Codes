Python 3.4.0 (v3.4.0:04f714765c13, Mar 16 2014, 19:24:06) [MSC v.1600 32 bit (Intel)] on win32
Type "copyright", "credits" or "license()" for more information.
>>> a= 4==4
>>> a
True
>>> b=3>4
>>> b
False
>>> c=True or False
>>> c
True
>>> not not False
False
>>> def a():
	if 3==3:
		return True
	else:
		return False

	
>>> a()
True
>>> b=a
>>> b()
True
>>> def c()
SyntaxError: invalid syntax
>>> def c(a):
	if
	
SyntaxError: invalid syntax
>>> def c(d):
	if d>5:
		return "Greater"
	elif d<5:
		return "Less"
	else:
		return "Equal"

	
>>> c(5)
'Equal'
>>> c(4)
'Less'
>>> c(6)
'Greater'
>>> 
