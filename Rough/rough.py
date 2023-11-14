a = 'Python is amazing'

print(a) #  Python is amazing
print(a[1]) # y
print(a[-1]) # g
print(a[::-1])  # Reverse a string || gnizama si nohtyP
print(a[-2:-5]) # Gives an empty string
print(a[-5:-2]) # azi
print(a[0:]) # Python is amazing
print(a[:17]) # Python is amazing

# del(a) || Deleting a string
print(a*2)
print('y' in a) # Checking if the character 'y' is in the string
print('o' not in a)

print('%s is my %d st preference' %("Python",1))

# Some String functions

print(len(a))
print(a.capitalize()) # Capitalize first letter
print(a.title())
print(a.count("is")) # Checking how many 'is' is available in the string
print(a.find("is")) 
print(a.index("is"))

# Lowercasing the string

print(a.casefold())
print(a.lower())

print(a.islower())

print(a.startswith("T"))
print(a.partition("is"))
print(a.strip("*"))
print(a.replace('amazing','fantastic'))
print(a.split(';',1))
print("{} and {} are alphabets".format("a","b"))



# String Traversal

var="hello"
for i in var:
    print(i)
    
    
print("\n")

    
var="RhythmusByte"
i=0
while(i < len(var)):
    letter=var[i]
    print(letter)
    i=i+1
    
    
print('\n')


# String Search

def searchstr(str,ch):
    index=0
    while index < len(str):
        if str[index]==ch:
            return index
        index=index+1          
    return -1
a=searchstr("hello","e")
print(a)
