Python 3.4.0 (v3.4.0:04f714765c13, Mar 16 2014, 19:24:06) [MSC v.1600 32 bit (Intel)] on win32
Type "copyright", "credits" or "license()" for more information.
>>> n=[0,1,2]
>>> for i in range(0,len(n)):
	n[i]

	
0
1
2
>>> def double_list(x):
	for i in range(0, len(x)):
		x[i] = x[i] * 2
	return x

>>> double_list(n)
[0, 2, 4]
>>> range(6)
range(0, 6)
>>> for i in range(6)
SyntaxError: invalid syntax
>>> for i in range(6):
	i

	
0
1
2
3
4
5
>>> for i in range(1,4):
	i

	
1
2
3
>>> for i in range(0,10,2)
SyntaxError: invalid syntax
>>> for i in range(0,10,2):
	i

	
0
2
4
6
8
>>> double_list(range(6))
Traceback (most recent call last):
  File "<pyshell#19>", line 1, in <module>
    double_list(range(6))
  File "<pyshell#5>", line 3, in double_list
    x[i] = x[i] * 2
TypeError: 'range' object does not support item assignment
>>> 
>>> 
>>> 
>>> def total(numbers):
	result=0
	for i in range(len(numbers)):
		result+=numbers[i]
	return result

>>> total(n)
6
>>> m=[3,7,10]
>>> m+n
[3, 7, 10, 0, 2, 4]
>>> # concatenating works even with the strings
>>> #sorry lists
>>> 
