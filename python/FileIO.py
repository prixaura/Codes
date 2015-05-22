Python 3.4.1 (v3.4.1:c0e311e010fc, May 18 2014, 10:45:13) [MSC v.1600 64 bit (AMD64)] on win32
Type "copyright", "credits" or "license()" for more information.
>>> my_list = [i**2 for i in range(1,11)]
>>> my_file = open("output.txt", "r+")
Traceback (most recent call last):
  File "<pyshell#1>", line 1, in <module>
    my_file = open("output.txt", "r+")
FileNotFoundError: [Errno 2] No such file or directory: 'output.txt'
>>> my_file = open("output.txt", "r+")
>>> for i in my_list:
	my_file.write(str(i)+"\n")

	
2
2
2
3
3
3
3
3
3
4
>>> my_file.close()
>>> my_file=open("output.txt","r")
>>> my_file.read()
'1\n4\n9\n16\n25\n36\n49\n64\n81\n100\n'
>>> my_file.readLine()
Traceback (most recent call last):
  File "<pyshell#9>", line 1, in <module>
    my_file.readLine()
AttributeError: '_io.TextIOWrapper' object has no attribute 'readLine'
>>> my_file.readline()
''
>>> 
>>> my_file.readline()
''
>>> my_file.readline()
''
>>> # implicitly close the file
>>> with open("text.txt","w") as a:
	a.write("Success!")

	
8
>>> a.closed
True
>>> 
