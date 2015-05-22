Python 3.4.0 (v3.4.0:04f714765c13, Mar 16 2014, 19:24:06) [MSC v.1600 32 bit (Intel)] on win32
Type "copyright", "credits" or "license()" for more information.
>>> "Pig Latin"
'Pig Latin'
>>> w=input("Enter the word:")
Enter the word:Prasanna
>>> if len(w)>0:
	print w
	
SyntaxError: invalid syntax
>>> if len(w)>0:
	print(w)
else:
	print("empty")

	
Prasanna
>>> w.isalpha()
True
>>> pyg="ay"
>>> p=w.lower()
>>> f=p[0]
>>> a=w[1:len(w)]+f+pyg
>>> a
'rasannapay'
>>> 
