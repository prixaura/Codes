Python 3.4.0 (v3.4.0:04f714765c13, Mar 16 2014, 19:24:06) [MSC v.1600 32 bit (Intel)] on win32
Type "copyright", "credits" or "license()" for more information.
>>> names=["ankit","lala","uncle","nathu"]
>>> "the third name is "+names[2]
'the third name is uncle'
>>> a=[1,2,3,4]
>>> a[1]+a[2]
5
>>> names[3]="abhishek"
>>> names.append("jhaji")
>>> names.append("haddi")
>>> "There are %d items in names" %(len(names))
'There are 6 items in names'
>>> names
['ankit', 'lala', 'uncle', 'abhishek', 'jhaji', 'haddi']
>>> first=names[0:2]
>>> second=names[2:4]   #3rd and 4th element
>>> third=names[4:6]
>>> first
['ankit', 'lala']
>>> animals = "catdogfrog"
>>> cat  = animals[:3]
>>> dog  = animals[3:6]
>>> frog = animals[6:]
>>> cat
'cat'
>>> dog
'dog'
>>> frog
'frog'
>>> #similar can be done with lists
>>> names.index("abhishek")
3
>>> b=_
>>> names.insert(b,"nathu")
>>> names
['ankit', 'lala', 'uncle', 'nathu', 'abhishek', 'jhaji', 'haddi']
>>> for n in names:
	n

	
'ankit'
'lala'
'uncle'
'nathu'
'abhishek'
'jhaji'
'haddi'
>>> c=[]
>>> for n in a:
	c.append(n**2)

	
>>> c.sort()
>>> c
[1, 4, 9, 16]
>>> 
>>> 
>>> 
>>> r={'a':1,'b':2,'c':3,'d':4}
>>> r['a']
1
>>> m={}
>>> m['a']=1
>>> m['b']=2
>>> len(m)
2
>>> m
{'b': 2, 'a': 1}
>>> del m['a']
>>> m['b']=3
>>> m
{'b': 3}
>>> 
>>> 
>>> # del to remove from dictionary and remove to remove from list
>>> names.remove("haddi")
>>> names
['ankit', 'lala', 'uncle', 'nathu', 'abhishek', 'jhaji']
>>> i={'a':[1,2,3,4],'b':['aaa','bbb'],'c'=15}
SyntaxError: invalid syntax
>>> i={'a':[1,2,3,4],'b':['aaa','bbb'],'c':15}
>>> i['d']=['111','222','333']
>>> len(i)
4
>>> i['a'].remove(3)   #removes the number not the index
>>> i['a']
[1, 2, 4]
>>> i['b'][1]
'bbb'
>>> 
