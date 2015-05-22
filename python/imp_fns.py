Python 3.4.1 (v3.4.1:c0e311e010fc, May 18 2014, 10:45:13) [MSC v.1600 64 bit (AMD64)] on win32
Type "copyright", "credits" or "license()" for more information.
>>> def is_even(x):
	if x%2==0:
		return True
	else:
		return False

	
>>> import math
>>> e=(dir)math
SyntaxError: invalid syntax
>>> e=dir(mat)
Traceback (most recent call last):
  File "<pyshell#4>", line 1, in <module>
    e=dir(mat)
NameError: name 'mat' is not defined
>>> e=dir(math)
>>> e
['__doc__', '__loader__', '__name__', '__package__', '__spec__', 'acos', 'acosh', 'asin', 'asinh', 'atan', 'atan2', 'atanh', 'ceil', 'copysign', 'cos', 'cosh', 'degrees', 'e', 'erf', 'erfc', 'exp', 'expm1', 'fabs', 'factorial', 'floor', 'fmod', 'frexp', 'fsum', 'gamma', 'hypot', 'isfinite', 'isinf', 'isnan', 'ldexp', 'lgamma', 'log', 'log10', 'log1p', 'log2', 'modf', 'pi', 'pow', 'radians', 'sin', 'sinh', 'sqrt', 'tan', 'tanh', 'trunc']
>>> a=3.5
>>> a.round()
Traceback (most recent call last):
  File "<pyshell#8>", line 1, in <module>
    a.round()
AttributeError: 'float' object has no attribute 'round'
>>> round(a)
4
>>> # round off a ano. by using round() fn.
>>> def is_int(x):
	if round(x)-x==0:
		return True
	else:
		return False

	
>>> def digit_sum(n):
	s=0
	i=n
	while i!=0:
		r=i%10
		s+=r
		i=i/10
	return s

>>> math.factorial(4)
24
>>> def factorial(x):
	f=1
	for i in range(1,x+1):
		f*=i
	return f

>>> def is_prime(x):
	c=0
	for i in range(1,x+1)
	
SyntaxError: invalid syntax
>>> def is_prime(x):
	for i in range(2,x-1):
		if x%i==0:
			return False
	return True

>>> def is_prime(x):
	if x-abs(x)!=0 or (x==0 or x==1):
	    return False
	for i in range(2,x-1):
		if x%i==0:
			return False
	return True

>>> def reverse(text)
SyntaxError: invalid syntax
>>> def reverse(text):
	s=""
	c=""
	for i in text:
		c=i
		c+=s
		s=c
	return c

>>> "prakash"[::-1]
'hsakarp'
>>> reversed("prakash")
<reversed object at 0x00000000034D8080>
>>> 
>>> def anti_vowel(text)
SyntaxError: invalid syntax
>>> def anti_vowel(text):
	s=""
	for c in text:
		if c!='a' or c!='e' or c!='i' or c!='o' or c!='u' or c!='A' or c!='E' or c!='I' or c!='O' or c!='U':
			s+=c
	return s

>>> def anti_vowel(text):
	s=""
	for c in text:
		if c!='a' and c!='e' and c!='i' and c!='o' and c!='u' and c!='A' and c!='E' and c!='I' and c!='O' and c!='U':
			s+=c
	return s

>>> score = {"a": 1, "c": 3, "b": 3, "e": 1, "d": 2, "g": 2, 
         "f": 4, "i": 1, "h": 4, "k": 5, "j": 8, "m": 3, 
         "l": 1, "o": 1, "n": 1, "q": 10, "p": 3, "s": 1, 
         "r": 1, "u": 1, "t": 1, "w": 4, "v": 4, "y": 4, 
         "x": 8, "z": 10}
>>> 
>>> def scrabble_score(word):
	i=""
	s=0
	for c in word:
		i=c.lower()
		s+=score[i]
	return s

>>> "My name is prakash".split()
['My', 'name', 'is', 'prakash']
>>> def censor(text,word):
	a=text.split()
	for i in a:
		if i==word:
			i='*'*len(word)
	return " ".join(a)

>>> censor("My name is Prakash","Prakash")
'My name is Prakash'
>>> def censor(text,word):
	a=text.split()
	for i in range(0,len(a)):
		if a[i]==word:
			a[i]='*'*len(word)
	return " ".join(a)

>>> censor("My name is Prakash","Prakash")
'My name is *******'
>>> 
>>> 
>>> 
>>> 
>>> def count(sequence,item):
	c=0
	for i in sequence:
		if i==item:
			c+=1
	return c

>>> count([1,2,1,1],1)
3
>>> def purify(l):
	for i in range(0,len(l)):
		if l[i]%2==1:
			l.remove(l[i])
	return l

>>> purify([1,2,3])
Traceback (most recent call last):
  File "<pyshell#93>", line 1, in <module>
    purify([1,2,3])
  File "<pyshell#92>", line 3, in purify
    if l[i]%2==1:
IndexError: list index out of range
>>> def purify(l):
	for i in l:
		if l[i]%2==1:
			l.remove(i)
	return l

>>> purify([1,2,3])
[1, 3]
>>> def purify(l):
	for i in l:
		if l[i]%2!=1:
			l.remove(i)
	return l

>>> purify([1,2,3])
Traceback (most recent call last):
  File "<pyshell#99>", line 1, in <module>
    purify([1,2,3])
  File "<pyshell#98>", line 3, in purify
    if l[i]%2!=1:
IndexError: list index out of range
>>> def purify(a):
	b=[]
	for i in a:
		if i%2==0:
			b.append(i)
	return b

>>> purify([1,2,3])
[2]
>>> 
>>> 
>>> def product(a):
	p=1
	for i in a:
		p*=i
	return p

>>> product([4, 5, 5])
100
>>> def remove_duplicates(a):
	b=[]
	f=0
	for i in a:
		for j in b:
			if i==j:
				f=1
		if f==0:
			b.append(i)
	return b

>>> remove_duplicates([1,1,2,2])
[1]
>>> 
>>> def remove_duplicates(a):
	b=[]
	f=0
	for i in a:
		for j in b:
			if i==j:
				f=1
		if f==0:
			b.append(i)
		f=0
	return b

>>> remove_duplicates([1,1,2,2])
[1, 2]
>>> 
>>> 
>>> sorted([1,2,3,5,4,9,7])
[1, 2, 3, 4, 5, 7, 9]
>>> [1,2,3,5,4,9,7].sort()
>>> a=[1,2,3,5,4,9,7].sort()
>>> a
>>> a=[1,2,3,5,4,9,7]
>>> a.sort()
>>> 
>>> 
>>> def median(a):
	m=0
	x=len(a)/2
	b=sorted(a)
	if len(b)%2==0:
		m=(b[x-1]+b[x])/2.0
	else:
		m=b[x]
	return m

>>> median([1,1,2])
Traceback (most recent call last):
  File "<pyshell#150>", line 1, in <module>
    median([1,1,2])
  File "<pyshell#149>", line 8, in median
    m=b[x]
TypeError: list indices must be integers, not float
>>> def median(a):
	m=0
	x=int(len(a)/2)
	b=sorted(a)
	if len(b)%2==0:
		m=(b[x-1]+b[x])/2.0
	else:
		m=b[x]
	return m

>>> median([1,1,2])
1
>>> 
