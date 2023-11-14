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




# Output
# Python is amazing
# y
# g
# gnizama si nohtyP
# 
# azi
# Python is amazing
# Python is amazing
# Python is amazingPython is amazing
# True
# False
# Python is my 1 st preference
# 17
# Python is amazing
# Python Is Amazing
# 1
# 7
# 7
# python is amazing
# python is amazing
# False
# False
# ('Python ', 'is', ' amazing')
# Python is amazing
# Python is fantastic
# ['Python is amazing']
# a and b are alphabets
