Python 3.4.0 (v3.4.0:04f714765c13, Mar 16 2014, 19:24:06) [MSC v.1600 32 bit (Intel)] on win32
Type "copyright", "credits" or "license()" for more information.
>>> def square(a):
	s=a**2
	print("%d squared is %d" %(a,s))

	
>>> a(10)
Traceback (most recent call last):
  File "<pyshell#4>", line 1, in <module>
    a(10)
NameError: name 'a' is not defined
>>> def square(a):
	s=a**2
	print("%d squared is %d" %(a,s))
	return s

>>> a(10)
Traceback (most recent call last):
  File "<pyshell#10>", line 1, in <module>
    a(10)
NameError: name 'a' is not defined
>>> square(10)
10 squared is 100
100
>>> 
>>> def cube(n):
	return n**3

>>> def three(n):
	if n%3==0:
		return cube(n)
	else:
		return False

	
>>> three(6)
216
>>> import math
>>> math.sqrt(25)
5.0
>>> from math import sqrt #to import just the sqrt function
>>> from math import *  #to importr all the functions
>>> import math
>>> e=dir(math)
>>> e
['__doc__', '__loader__', '__name__', '__package__', '__spec__', 'acos', 'acosh', 'asin', 'asinh', 'atan', 'atan2', 'atanh', 'ceil', 'copysign', 'cos', 'cosh', 'degrees', 'e', 'erf', 'erfc', 'exp', 'expm1', 'fabs', 'factorial', 'floor', 'fmod', 'frexp', 'fsum', 'gamma', 'hypot', 'isfinite', 'isinf', 'isnan', 'ldexp', 'lgamma', 'log', 'log10', 'log1p', 'log2', 'modf', 'pi', 'pow', 'radians', 'sin', 'sinh', 'sqrt', 'tan', 'tanh', 'trunc']
>>> def larger(*args)
SyntaxError: invalid syntax
>>> def larger(*args):
	return max(args)

>>> larger(3,4,5,6,1,2)
6
>>> fabs(-3)
3.0
>>> type(7)
<class 'int'>
>>> type("ppp")
<class 'str'>
>>> 
>>> def distance_from_zero(a):
	if type(a)==int or type(a)==float
	
SyntaxError: invalid syntax
>>> def distance_from_zero(a):
	if type(a)==int or type(a)==float:
		return fabs(a)
	else:
		return "Nope"

	
>>> b=distance_from_zero
>>> b(-4.53)
4.53
>>> b("prakash")
'Nope'
>>> 
