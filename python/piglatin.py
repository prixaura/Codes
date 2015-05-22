a=""
def pig(a):
    ch=""
    for i in range(len(a)):
        ch=a[i].lower()
        if ch in ['a','e','i','o','u']:
            break;
            
    if a[0].lower()==a[0]:
        s="ay"
    else:
        s="AY"
            
    return a[i:len(a)]+a[:i]+s
    
a=raw_input("Enter a string that is all lower or all upper case: ");
    
print pig(a)
        