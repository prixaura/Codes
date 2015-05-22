Python 3.4.1 (v3.4.1:c0e311e010fc, May 18 2014, 10:45:13) [MSC v.1600 64 bit (AMD64)] on win32
Type "copyright", "credits" or "license()" for more information.
>>> class Car(object):
	condition="new"
	def __init__(self,model,color,mpg):
		self.model=model
		self.color=color
		self.mpg=mpg
	def display_car(self):
		return "This is a "+self.color+" "+self.model+" with "+str(self.mpg)+" MPG."
	def drive_car(self):
		self.condition="used"

		
>>> class ElectricCar(Car):
	def __init__(self,model,color,mpg,battery_type):
		self.model=model
		self.color=color
		self.mpg=mpg
		self.battery_type=battery_type
	def drive_car(self):
		self.condition="like new"

		
>>> a=Car("Fiat","red",77)
>>> a.display
Traceback (most recent call last):
  File "<pyshell#19>", line 1, in <module>
    a.display
AttributeError: 'Car' object has no attribute 'display'
>>> a.display_car()
'This is a red Fiat with 77 MPG.'
>>> a.drive_car()
>>> a.condition
'used'
>>> b=ElectricCar("Honda","blue",70,"molten salt")
>>> b.battery_type
'molten salt'
>>> b.condition
'new'
>>> b.drive_car()
>>> b.condition
'like new'
>>> 
>>> 
>>> 
>>> class Point3D(object):
	def __init__(self,x,y,z):
		self.x=x
		self.y=y
		self.z=z
	def __repr__(self):
		print("%d, %d, %d" %(self.x,self.y,self.z))

		
>>> my_point=Point3D(1,2,3)
>>> my_point
1, 2, 3
Traceback (most recent call last):
  File "<pyshell#40>", line 1, in <module>
    my_point
TypeError: __repr__ returned non-string (type NoneType)
>>> 
