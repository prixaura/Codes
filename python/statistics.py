Python 3.4.1 (v3.4.1:c0e311e010fc, May 18 2014, 10:45:13) [MSC v.1600 64 bit (AMD64)] on win32
Type "copyright", "credits" or "license()" for more information.
>>> def print_grades(grades):
    for i in grades:
        print(i)

        
>>> grades = [100, 100, 90, 40, 80, 100, 85, 70, 90, 65, 90, 85, 50.5]
>>> print_grades(grades)
100
100
90
40
80
100
85
70
90
65
90
85
50.5
>>> def grade_sum(scores):
	s=0
	for i in scores:
		s+=i
	return s

>>> grades_sum(grades)
Traceback (most recent call last):
  File "<pyshell#10>", line 1, in <module>
    grades_sum(grades)
NameError: name 'grades_sum' is not defined
>>> grade_sum(grades)
1045.5
>>> 
>>> 
>>> def grades_average(grades):
	a=grades_sum(grades)
	b=a/(float(len(grades)))
	return b

>>> grades_average(grades)
Traceback (most recent call last):
  File "<pyshell#19>", line 1, in <module>
    grades_average(grades)
  File "<pyshell#18>", line 2, in grades_average
    a=grades_sum(grades)
NameError: name 'grades_sum' is not defined
>>> def grades_average(grades):
	a=grade_sum(grades)
	b=a/(float(len(grades)))
	return b

>>> grades_average(grades)
80.42307692307692
>>> 
>>> 
>>> def grade_variance(scores):
	average=grades_average(grades)
	variance=0
	for score in scores:
		variance+=(average-score)**2
	return float(variance)/len(scores)

>>> grades_variance(grades)
Traceback (most recent call last):
  File "<pyshell#32>", line 1, in <module>
    grades_variance(grades)
NameError: name 'grades_variance' is not defined
>>> grade_variance(grades)
334.0710059171598
>>> 
>>> 
>>> 
>>> def grade_variance(scores):
	average=grades_average(scores)
	variance=0
	for score in scores:
		variance+=(average-score)**2
	return float(variance)/len(scores)

>>> 
>>> 
>>> def grades_std_deviation(variance):
	return variance**0.5

>>> variance=grades_variance(grades)
Traceback (most recent call last):
  File "<pyshell#44>", line 1, in <module>
    variance=grades_variance(grades)
NameError: name 'grades_variance' is not defined
>>> variance=grade_variance(grades)
>>> grades_std_deviation(variance)
18.277609414722697
>>> 
