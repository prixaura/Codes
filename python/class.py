Python 3.4.1 (v3.4.1:c0e311e010fc, May 18 2014, 10:45:13) [MSC v.1600 64 bit (AMD64)] on win32
Type "copyright", "credits" or "license()" for more information.
>>> class Animal(object):
	pass
#pass does nothing but can be written when python expects a code

>>> class Animal(other):
	def __init__(self):
		pass

	
Traceback (most recent call last):
  File "<pyshell#7>", line 1, in <module>
    class Animal(other):
NameError: name 'other' is not defined
>>> class Animal(object):
	def __init__(self):
		pass

	
>>> 
>>> class Animal(object):
	def __init__(self,name):
		self.name=name

		
>>> zebra=Animal("Jeffrey")
>>> zebra.name
'Jeffrey'
>>> class Animal(object):
	"""Makes cute animals."""
	# For initializing our instance objects
	def __init__(self, name, age, is_hungry):
		self.name = name
		self.age = age
		self.is_hungry=is_hungry

		
>>> zebra = Animal("Jeffrey", 2, True)
>>> panda = Animal("Chad", 7, True)
>>> print zebra.name, zebra.age, zebra.is_hungry
SyntaxError: invalid syntax
>>> zebra.name, zebra.age, zebra.is_hungry
('Jeffrey', 2, True)
>>> panda.name, panda.age, panda.is_hungry
('Chad', 7, True)
>>> 
>>> 
>>> class Animal(object):
	"""Makes cute animals."""
	is_alive = True
	def __init__(self, name, age):
		self.name = name
		self.age = age
		# Add your method here!
	def description(self):
		self.name
		self.age

		
>>> hippo=Animal("Monty",14)
>>> hippo.description()
>>> class Animal(object):
	"""Makes cute animals."""
	is_alive = True
	def __init__(self, name, age):
		self.name = name
		self.age = age
		# Add your method here!
	def description(self):
		print(self.name)
		print(self.age)

		
>>> hippo=Animal("Monty",14)
>>> hippo.description()
Monty
14
>>> 
>>> #instance variables
>>> class Animal(object):
	"""Makes cute animals."""
	is_alive = True
	health="good"     #instance variables
	def __init__(self, name, age):
		self.name = name
		self.age = age
	# Add your method here!
	def description(self):
		self.name
		self.age

		
>>> sloth=Animal("a",1)
>>> ocelot=Animal("b",2)
>>> # both of them have good healths until moified
>>> 
>>> 
>>> # Inheritance
>>> class Shape(object):
	"""Makes shapes!"""
	def __init__(self, number_of_sides):
		self.number_of_sides = number_of_sides

		
>>> class Triangle(Shape):
	def __init__(self,side1,side2,side3):
		self.side1=side1
		self.side2=side2
		self.side3=side3

		
>>> 
>>> #fn. overriding
>>> class Employee(object):
	"""Models real-life employees!"""
	def __init__(self, employee_name):
		self.employee_name = employee_name

	def calculate_wage(self, hours):
		self.hours = hours
		return hours * 20.00

	
>>> class PartTimeEmployee(Employee):
	def calculate_wage(self,hours):   # overridden fn.
		self.hours = hours
		return hours * 12.00

	
>>> a=PartTimeEmployee("Prakash")
>>> a.calculate_wage(2)
24.0
>>> b=Employee("Prakash")
>>> b.calculate_wage(2)
40.0
>>> 
>>> # use of super
>>> class Employee(object):
	"""Models real-life employees!"""
	def __init__(self, employee_name):
		self.employee_name = employee_name

	def calculate_wage(self, hours):
		self.hours = hours
		return hours * 20.00

	
>>> class PartTimeEmployee(Employee):
	def calculate_wage(self,hours):
		self.hours = hours
		return hours * 12.00
        
	def full_time_wage(self,hours):
		return super(PartTimeEmployee,self).calculate_wage(hours)

	
>>> milton=PartTimeEmployee("Prakash")
>>> milton.full_time_wage(10)
200.0
>>> 
