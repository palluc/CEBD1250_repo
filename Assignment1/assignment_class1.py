# ========================================================================================================================
# Program Name: assignment_class1.py
# Description:  Assignment #1
#               21-Jan-2019
#               9 program practices written in Python
# Course:       CEBD1250 Big Data Storage / Winter 2019
# By:           Luciana Palucci
# ========================================================================================================================



# Function to validate user input of type integer, float, or string.
def validate_input(value, type):
    valid = True
    try:
        if (type == 'float'):
            val = float(value)
        elif (type == 'int'):
            val = int(value)
        elif (type == 'str'):
            val = value
    except ValueError:
        valid = False

    return (valid)


# -------------------------------------------------------
# ========================================================================================================================
# Sample #1:
# Ask the user for a number. Depending on whether the number is even or odd, print out an appropriate message;
# ========================================================================================================================

print()
print('Sample #1: Even/odd number')

input_var = input("Enter a number")
print("Number is " + input_var + "!")


if (validate_input(input_var, 'int')):
    num = int(input_var)
    if (num % 2 == 0):
        print("This is an even number")
    else:
        print("This is an odd number")


# ========================================================================================================================
# Sample #2:
# Expanding the previous exercise, let’s say I give you a list saved in a variable:
# a = [1, 4, 9, 16, 25, 36, 49, 64, 81, 100].
# Write one line of Python that takes this list a and makes a new list that has only the even elements of this list in it.
# ========================================================================================================================
print()
print('Sample #2: New even list')

a = [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]

a = [item for item in a if item%2 == 0]
print("The even elements in the list are: " + str(a))

# filtered_list = list(filter(lambda x: (x*2 > 10), my_list))
# even_list = a % 2

# ===============================================================================================
# Sample #3:
# Create a function that takes a list of numbers. Return the largest number in the list.
# ===============================================================================================

# Function to get largest value in a list
def largest_num(aList):
    lstLen = len(aList)
    max = aList[0]

    for val in aList:
        if val > max:
            max = val
    return (max)

print()
print('Sample #3: Largest number in list')

myList = [39, 45, 567, 12, 0, 90.0, 15, 98, -299]
print("The largest number in the list: " + str(myList) + " is " + str(largest_num(myList)))

# ===============================================================================================
# Sample #4:
# Ask the user for a string and print out whether this string is a palindrome or not.
# (A palindrome is a string that reads the same forwards and backwards.)
# ===============================================================================================

# Function to reverse a string
def reverse_string(a_string):
    strLen = len(a_string)
    reverse_str = ''
    i = 1
    while i <= strLen:
        reverse_str += a_string[strLen - i]
        i += 1
    return reverse_str

print()
print('Sample #4: Palindrome')


input_str = input("Enter a string")

# Do a validation check on the entered input
if (validate_input(input_str, 'str')):
    in_str = input_str.replace(" ", "").lower()                   #put in lowercase and remove space in string
    inr_str = reverse_string(input_str).replace(" ", "").lower()  #put in lowercase and remove space in string
    # print(in_str)
    # print(inr_str)
    if (in_str == inr_str):
        print("The string is a palindrome")
    else:
        print("The string is not a palindrome")
else:
    print("This is not a valid string")

# ==================================================================================================
# Sample #5:
# Write a program that asks the user how many Fibonacci numbers to generate and then generates them.
# ==================================================================================================

def generate_fibonacci(fib_s, fib_num):
    fib_list = []
    i = 0
    fib_list.append(fib_s)
    fib_list.append(fib_list[i])
    i = 2
    #print(fib_list)
    #print(type(fib_num))
    while i <= fib_num:
        #print(fib_list[i - 1] + fib_list[i - 2])
        fib_list.append(fib_list[i - 1] + fib_list[i - 2] )
        i += 1
    return (fib_list)

print()
print('Sample #5: Fibonacci')

fib_start  = input("What number would you like start the Fibonacci sequence")
fib_len = input("how many Fibonacci numbers would you like generated")

if (validate_input(fib_start,'int')):
    fibstart_int = int(fib_start)
    fibstart_flag = True
else:
    print("Invalid number for start of Fibonacci")

if (validate_input(fib_len,'int')):
    fiblen_int = int(fib_len)
    fiblen_flag = True
else:
    print("Invalid number for iterations")

if (fibstart_flag and fiblen_flag):
    fiblist = generate_fibonacci (fibstart_int, fiblen_int)
    print ("The Fibonacci sequence is: " + str (fiblist))


# ===============================================================================================
# Sample #6:
# Write a program that takes a number and print its square.
# ===============================================================================================

print()
print('Sample #6: square value')

from decimal import Decimal

input_num = input("Enter a number")

if (validate_input(input_num, 'int')):
    num_int = int(input_num)
    sq_value = num_int** 2
elif (validate_input(input_num, 'float')):
    num_fl = Decimal(input_num)
    sq_value = num_fl ** 2
else:
    print("This is not a valid number")

print("The square of " + input_num + ' is equal to ' + str(sq_value))


# ===============================================================================================
# Sample #7:
# Given an list of positive integers with higher than 0 the answer should contain average values.
# ===============================================================================================
print()
print('Sample #7: Average value in list')

from decimal import Decimal

myList = [2, 6, 9, 90.7]
myList_len = len(myList)

avg = sum(Decimal(i) for i in myList) / myList_len

#print(myList_len)
print("The average of the numbers is: " + str(avg))


# ===============================================================================================
# Sample #8:
# Return the number of vowels per string.
# ===============================================================================================

# Function to count the vowels in a strings
def count_vowels(input_str):
    vowel_tuple = ('a','e', 'i','o','u')
    len_vowel = len(vowel_tuple)
    x=0
    for a in range(len_vowel):
        x += input_str.count(vowel_tuple[a])
    return(x)

print()
print('Sample #8: Count vowels')

sentence = input("Enter a string which you would like to count the vowels")

# do a validation check
if (validate_input(sentence,'str')):
    num = count_vowels(sentence)
    print("There are " + str(num) + " vowels in the string")
else:
    print("This is not a valid string")


# ===============================================================================================
# Sample #9:
# Write a program to convert degrees of Fahrenheit to Celsius.
# ===============================================================================================


# Function to convert Fahrenheit to Celsius
def FtoC(temp_f):
    temp_c = (temp_f - 32) / 1.8
    return (temp_c)

# Function to convert Fahrenheit to Celsius
def CtoF(temp_c):
    temp_f = 9.0 / 5.0 * temp_c + 32
    return (temp_f)

print()
print('Sample #9: Temperature FtoC')

#input_c = input("Enter the temperature in degree Celcius")

input_f = input("Enter the temperature in degree Fahrenheit")

# Check the validity of the entered number

if (validate_input(input_f,'float')):
    to_float = float(input_f)
    temp_c = FtoC(to_float)
    print("The temp in Celsius is: " + str(temp_c))
else:
    print("This is not a valid number")


