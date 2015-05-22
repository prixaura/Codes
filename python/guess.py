def a(n):
    s=-12346892329
    if n==s:
        return 0
    elif n>s:
        return 1
    elif n<s:
        return -1
        
def create(lst):
    s=0
    for i in range(0,len(lst)):
        print "before: "+str(s)
        
        s+=(10**((len(lst)-1)-i))*lst[i]
        print "after: "+str(s)
    return s
    
def jumpAndBackpedal(isMyNumber):
    '''
    isMyNumber: Procedure that hides a secret number. 
     It takes as a parameter one number and returns:
     *  -1 if the number is less than the secret number
     *  0 if the number is equal to the secret number
     *  1 if the number is greater than the secret number
 
    returns: integer, the secret number
    ''' 
    d=0
    c=0
    number=0
    if isMyNumber(0)!=0:
        sn= -1 * isMyNumber(0)
    else:
        sn=1
        
    while True:
        if isMyNumber((10**d)*sn) == sn:
            d-=1
            break
        d+=1
    
      
    while True:
        for i in range(0,10,1):
            
            c=(10**d)*i*sn
    
            if isMyNumber(c+number) == sn:
                c=(10**d) * (i-1) * sn
                break
            
        number += c
        d -= 1
        c=0
        if d<0:
            return int(number)
            
    
print jumpAndBackpedal(a)