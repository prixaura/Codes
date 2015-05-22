Python 3.4.0 (v3.4.0:04f714765c13, Mar 16 2014, 19:24:06) [MSC v.1600 32 bit (Intel)] on win32
Type "copyright", "credits" or "license()" for more information.
>>> names=["Adam","Alex","Mariah","Martine","Columbus"]
>>> for n in names
SyntaxError: invalid syntax
>>> for n in names:
	n

	
'Adam'
'Alex'
'Mariah'
'Martine'
'Columbus'
>>> webster = {
	"Aardvark" : "A star of a popular children's cartoon show.",
    "Baa" : "The sound a goat makes.",
    "Carpet": "Goes on the floor.",
    "Dab": "A small amount."
}
>>> for x in webster
SyntaxError: invalid syntax
>>> for x in webster:
	webster[x]

	
'The sound a goat makes.'
'A small amount.'
'Goes on the floor.'
"A star of a popular children's cartoon show."
>>> for x in webster:
	x

	
'Baa'
'Dab'
'Carpet'
'Aardvark'
>>> #prints the keys
>>> a = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
>>> for n in a:
	if n%2==0:
		n

		
0
2
4
6
8
10
12
>>> def fizz(x):   #x is a list
	count=0
	for s in x:
		if s=="fizz":
			count++
			
SyntaxError: invalid syntax
>>> def fizz(x):   #x is a list
	count=0
	for s in x:
		if s=="fizz":
			count=count+1
	return count

>>> fizz(["fizz","ape","fizz"])
2
>>> for c in "Prasanna":
	c

	
'P'
'r'
'a'
's'
'a'
'n'
'n'
'a'
>>> 
>>> for c in "Prasanna":
	if c=='a':
		c

		
'a'
'a'
'a'
>>> 
