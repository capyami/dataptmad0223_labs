"""
This is a dumb calculator that can add and subtract whole numbers from zero to five.
When you run the code, you are prompted to enter two numbers (in the form of English
word instead of number) and the operator sign (also in the form of English word).
The code will perform the calculation and give the result if your input is what it
expects.

The code is very long and messy. Refactor it according to what you have learned about
code simplicity and efficiency.
"""

print('Welcome to this calculator!')
print('It can add and subtract whole numbers from zero to five')

a = input('Please choose your first number (zero to five): ')
b = input('What do you want to do? plus or minus: ')
c = input('Please choose your second number (zero to five): ')

numbers = {'zero':0, 'one':1, 'two':2, 'three':3, 'four':4, 'five':5}

operation = {'plus': 1, 'minus':-1}

if a in numbers.keys():
    num1 = numbers[a]
else: 
    print("I am not able to answer this question. Check your input.")

if b in operation.keys():
    factor = operation[b]
else:
    print("I am not able to answer this question. Check your input.")

if c in numbers.keys():
    num2 = numbers[c] * factor
else:
    print("I am not able to answer this question. Check your input.")

result = sum([num1, num2])

dict_result = {0:'zero', 1:'one', 2:'two', 3:'three'}

if factor < 0:
    num_sign = 'negative '
else:
    num_sign = ''

num_result = dict_result[abs(result)]

print(f'{a} {b} {c} equals {num_sign}{num_result}')

print("Thanks for using this calculator, goodbye :)")