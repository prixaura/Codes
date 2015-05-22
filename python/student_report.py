Python 3.4.0 (v3.4.0:04f714765c13, Mar 16 2014, 19:24:06) [MSC v.1600 32 bit (Intel)] on win32
Type "copyright", "credits" or "license()" for more information.
>>> llyod={"name":Llyod,"homework":[],"quizzes":[],"tests":[]}
Traceback (most recent call last):
  File "<pyshell#0>", line 1, in <module>
    llyod={"name":Llyod,"homework":[],"quizzes":[],"tests":[]}
NameError: name 'Llyod' is not defined
>>> llyod={"name":"Llyod","homework":[],"quizzes":[],"tests":[]}
>>> alice={"name":"Alice","homework":[],"quizzes":[],"tests":[]}
>>> tyler={"name":"Tyler","homework":[],"quizzes":[],"tests":[]}
>>> lloyd={"name":"Lloyd","homework":[],"quizzes":[],"tests":[]}
>>> lloyd = {
    "name": "Lloyd",
    "homework": [90.0,97.0,75.0,92.0],
    "quizzes": [88.0, 40.0, 94.0],
    "tests": [75.0, 90.0]
}
>>> alice = {
    "name": "Alice",
    "homework": [100.0, 92.0, 98.0, 100.0],
    "quizzes": [82.0, 83.0, 91.0],
    "tests": [89.0, 97.0]
}
>>> tyler = {
    "name": "Tyler",
    "homework": [0.0, 87.0, 75.0, 22.0],
    "quizzes": [0.0, 75.0, 78.0],
    "tests": [100.0, 100.0]
}
>>> students=[lloyd,alice,tyler]
>>> for n in students:     #very important
	    for x in n:
		    n[x]

		    
[75.0, 90.0]
[90.0, 97.0, 75.0, 92.0]
'Lloyd'
[88.0, 40.0, 94.0]
[89.0, 97.0]
[100.0, 92.0, 98.0, 100.0]
'Alice'
[82.0, 83.0, 91.0]
[100.0, 100.0]
[0.0, 87.0, 75.0, 22.0]
'Tyler'
[0.0, 75.0, 78.0]
>>> def average(numbers):
	total=sum(numbers)
	total=float(total)
	return total/len(numbers)

>>> def get_average(student):       #weighted average
	homework=average(student["homework"])
	quizzes=average(student["quizzes"])
	tests=average(student["tests"])
	return homework*0.1+quizzes*0.3+tests*0.6

>>> def get_letter_grade(score):
	if score>=90:
		return "A"
	elif score>=80:
		return "B"
	elif score>=70:
		return "C"
	elif score>=60:
		return "D"
	else:
		return "F"

	
>>> def get_class_average(students):
	results=[]
	for x in students:
		results.append(get_average(x))
        
	return average(results)

>>> get_class_average(students)
83.86666666666666
>>> get_letter_grade(_)
'B'
>>> 
