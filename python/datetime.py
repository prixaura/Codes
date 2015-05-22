Python 3.4.0 (v3.4.0:04f714765c13, Mar 16 2014, 19:24:06) [MSC v.1600 32 bit (Intel)] on win32
Type "copyright", "credits" or "license()" for more information.
>>> from datetime import datetime
>>> datetime.now()
datetime.datetime(2014, 8, 23, 2, 26, 39, 82396)
>>> now=datetime.now()
>>> now
datetime.datetime(2014, 8, 23, 2, 26, 58, 634515)
>>> now.year
2014
>>> now.month
8
>>> now.day
23
>>> print("%s/%s/%s" % (now.year, now.month, now.day))
2014/8/23
>>> print("%s:%s:%s" % (now.hour, now.minute, now.second))
2:26:58
>>> 
