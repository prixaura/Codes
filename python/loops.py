Python 3.4.0 (v3.4.0:04f714765c13, Mar 16 2014, 19:24:06) [MSC v.1600 32 bit (Intel)] on win32
Type "copyright", "credits" or "license()" for more information.
>>> c=0
>>> while c<10:
	c
	C+=1

	
0
Traceback (most recent call last):
  File "<pyshell#4>", line 3, in <module>
    C+=1
NameError: name 'C' is not defined
>>> while c<10:
	c
	c+=1

	
0
1
2
3
4
5
6
7
8
9
>>> while True:
	c+=1
	if c>19:
		break

	
>>> while True:
	c+=1
	c
	if c>29:
		break

	
21
22
23
24
25
26
27
28
29
30
>>> import random
>>> "Lucky Numbers! 3 numbers will be generated. If one of them is a '5', you lose!"
"Lucky Numbers! 3 numbers will be generated. If one of them is a '5', you lose!"
>>> count=0
>>> while count<3:
	n=random.randint(0,9)
	c+=1
	if n==5:
		"You lose"
		break
else:
	"you win"

	
'You lose'
>>> while count<3:
	n=random.randint(0,9)
	n
	c+=1
	if n==5:
		"You lose"
		break
else:
	"you win"

	
0
6
2
5
'You lose'
>>> while count<3:
	n=random.randint(0,9)
	n
	if n==5:
		"You lose"
		break
	c+=1
else:
	"you win"

	
1
6
9
8
9
5
'You lose'
>>> from random import randint
>>> r=randint(0,9)
>>> g=3
>>> while g>0:
	guess=int(input("Guess:"))
	if guess==r:
		"Win"
		break
	g-=1

Guess:2
Guess:5
Guess:7
>>> while g>0:
	guess=int(input("Guess:"))
	if guess==r:
		"Win"
		break
	g-=1

	
>>> while g>0:
	guess=int(input("Guess:"))
	if guess==r:
		"Win"
		break
	g-=1
else:
	"Lose"

	
'Lose'
>>> g=3
>>> while g>0:
	guess=int(input("Guess:"))
	if guess==r:
		"Win"
		break
	g-=1
else:
	"Lose"

	
Guess:4
Guess:6
Guess:8
'Lose'
>>> n=[]
>>> for i in range(5)
SyntaxError: invalid syntax
>>> for i in range(5):
	num=input("Enter:")
	n.append(num)

	
Enter:4
Enter:5
Enter:6
Enter:7
Enter:8
>>> n
['4', '5', '6', '7', '8']
>>> "Prasanna",
('Prasanna',)
>>> "Prakash"
'Prakash'
>>> c = ['pizza', 'pasta', 'salad', 'nachos']
>>> for i, item in enumerate(c):
	i+1,c[i]

	
(1, 'pizza')
(2, 'pasta')
(3, 'salad')
(4, 'nachos')
>>> #zip is used to compare two lists....thew loop stops at the shorter list
>>> x=[1,2,3,4]
>>> y=[5,6,7,8,9]
>>> for a,b in zip(x,y):
	if a>b:
		a
	else:
		b

		
5
6
7
8
>>> 
