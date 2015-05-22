Python 3.4.0 (v3.4.0:04f714765c13, Mar 16 2014, 19:24:06) [MSC v.1600 32 bit (Intel)] on win32
Type "copyright", "credits" or "license()" for more information.
>>> c="prasanna"
>>> d="prakash"
>>> c+d
'prasannaprakash'
>>> 'I\'m a boy'   #use of backslash
"I'm a boy"
>>> "prakash"[5]
's'
>>> d[5]
's'
>>> len(c)
8
>>> d.upper()
'PRAKASH'
>>> d.lower()
'prakash'
>>> p=4
>>> p
4
>>> str(p)
'4'
>>> 
>>> '''len and str can work with other data types that is why the value is written in parenthesis and rst of the functions only works with strings'''
'len and str can work with other data types that is why the value is written in parenthesis and rst of the functions only works with strings'
>>> "the value of pi is"+3.14
Traceback (most recent call last):
  File "<pyshell#14>", line 1, in <module>
    "the value of pi is"+3.14
TypeError: Can't convert 'float' object to str implicitly
>>> "the value of PI is"+ str(3.14)
'the value of PI is3.14'
>>> 
>>> print("My name is %s" \
      "%s" %(c,d))
My name is prasannaprakash
>>> a=raw_input("What is your name?")
Traceback (most recent call last):
  File "<pyshell#19>", line 1, in <module>
    a=raw_input("What is your name?")
NameError: name 'raw_input' is not defined
>>> 
