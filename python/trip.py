Python 3.4.0 (v3.4.0:04f714765c13, Mar 16 2014, 19:24:06) [MSC v.1600 32 bit (Intel)] on win32
Type "copyright", "credits" or "license()" for more information.
>>> "Trip"
'Trip'
>>> def hotel_cost(nights):
    return 140*nights

>>> hotel_cost(5)
700
>>> def plane_ride_cost(city):
	    if city=="Charlotte":
				return 183
	    elif city=="Tampa":
				return 220
	    elif city=="Pittsburgh":
				return 222
	    elif city=="Los Angeles":
				return 475
			
SyntaxError: inconsistent use of tabs and spaces in indentation
>>> def plane_ride_cost(city):
	    if city=="Charlotte":
		    return 183
		elif city=="Tampa":
			
SyntaxError: unindent does not match any outer indentation level
>>> def plane_ride_cost(city):
	if city=="Charlotte":
		return 183
	elif city=="Tampa":
		return 220
	elif city=="Pittsburgh":
		return 222
	elif city=="Los Angeles":
		return 475

	
>>> def rental_car_cost(days):
	if days>=7:
		return 40*days-50
	elif days>=3 and days<7:
		return 40*days-20
	else:
		return 40*days

	
>>> def trip_cost(city,days):
	return 
KeyboardInterrupt
>>> def trip_cost(city,days):
	return hotel_cost(days)+rental_car_cost(days)+plane_ride_cost(city)

>>> def trip_cost(city,days,spending_money):
	return hotel_cost(days)+rental_car_cost(days)+plane_ride_cost(city)+spending money
SyntaxError: invalid syntax
>>> def trip_cost(city,days,spending_money):
	return hotel_cost(days)+rental_car_cost(days)+plane_ride_cost(city)+spending_money

>>> trip_cost("Los Angeles",5,600)
1955
>>> 
