Python 3.4.0 (v3.4.0:04f714765c13, Mar 16 2014, 19:24:06) [MSC v.1600 32 bit (Intel)] on win32
Type "copyright", "credits" or "license()" for more information.
>>> prices={"banana":4, "apple":2,"orange":1.5,"pear":3}
>>> stock={"banana":6,"apple":0,"orange":32,"pear":15}
>>> for s in prices:
	s
	"price: %s" %prices[s]
	"stock: "+str(stock[s])   #another way of doing the same thing

	
'banana'
'price: 4'
'stock: 6'
'apple'
'price: 2'
'stock: 0'
'orange'
'price: 1.5'
'stock: 32'
'pear'
'price: 3'
'stock: 15'
>>> total=0
>>> for x in prices:
	total=total+prices[x]*stock[x]

	
>>> total
117.0
>>> shop_list = ["banana", "orange", "apple"]
>>> def bill(x):
	total=0
	for s in x:
		total+=prices[s]

		
>>> def bill(x):
	total=0
	for s in x:
		total+=prices[s]
	return total

>>> bill(shop_list)
7.5
>>> def compute_bill(x):
	total=0
	for s in x:
		if stock[s]>0:
		    total+=prices[s]
		    stock[s]-=1
	return total

>>> compute_bill(shop_list)
5.5
>>> 
