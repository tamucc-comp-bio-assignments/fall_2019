# Week06 Python Boot Camp I: Basic Programming II

### [Assignment5](https://github.com/tamucc-comp-bio/fall_2019/blob/master/assignments/assignment_5.md) is due at the beginning of this lecture


## Computer Preparation

* Log into your TAMUCC email account
* Win10
	* open ubuntu terminal and type `python3`

	* If you are using an Ubuntu terminal that hasn't been setup (you'll know because it will ask you to create a new user name and password) or you notice odd cursor behavior when editing text in the terminal, then run the following code:
		```bash
		git clone https://github.com/cbirdlab/wlsUBUNTU_settings.git
		../wlsUBUNTU_settings/updateSettings.bash
		rm -rf wlsUBUNTU_settings
		```
* MacOS
	* open terminal and type `python3`
___


## I. Lecture Slides

No lecture slides this week

## II. Review of Python Activities for HW

### Common, General Functions

The following is an overview of some of the many useful functions built into `python`

* max and min; use on string, list, tuple; returns largest or smallest number or character with largest or smallest associated numerical value

	```python
	#make set a
	>>> a = [5, 6, 7, 7, 7, 8, 9, 9]
	>>> max(a)
	9
	>>> max(1.2, 3.71, 1.15)
	3.71
	>>> max("scientific computing")
	'u'
	>>> min("scientific computing")
	' '
	
	# check values of characters
	>>> ord('z')
	122
	>>> ord('a')
	97
	>>> ord('Z')
	90
	```
* sum; use on list or set; adds up values

	```python
	>>> sum(a)
	58
	>>> sum(set([1, 1, 2, 3, 5, 8]))
	19
	```

* in; use on strings, lists, tuples, dictionaries, and sets; tests for membership

	```python
	>>> "s" in "string"
	True
	>>> 36 not in [1, 2, 36]
	False
	>>> (1, 2) in [(1, 3), (1, 2), 1000, 'aaa']
	True
	>>> "z" in {"a": 1, "b": 2, "c": 3}
	False
	>>> "c" in {"a": 1, "b": 2, "c": 3}
	True
  ```

### Program Flow

#### If Then Statements

If then statements are used to conditionally run code (make decisions about which code should be run)
Note that the `...` are shown in your terminal and should not be typed.

```python
# pseudo code describing basic structure of if then statments, do not type
# the indentation and empty line after the if statement are both necessary syntax
if condition_is_true:
	execute_commands
elif other_condition_is_true:
	other_commands
else:
	commands_to_run_if_none_is_true

```

```python
>>> x = 4
... if x % 2 == 0:
...     print("Divisible by 2")
...
Divisible by 2
>>> x = 4
>>> if x % 2 == 0:
...     print("Divisible by 2")
... else:
...     print("Not divisible by 2")
...
Divisible by 2

>>> if x % 2 == 0:
...     print("Divisible by 2")
... elif x % 3 == 0:
...     print("Divisible by 3")
... elif x % 5 == 0:
...     print("Divisible by 5")
... elif x % 7 == 0:
...     print("Divisible by 7")
... else:
...     print("Not divisible by 2, 3, 5, 7")
...
Not divisible by 2, 3, 5, 7
```

#### While and For Loops

Loops are used to repeat a block of code several times, often with slight variations.

While loops continue to run until a condition is met.  Again, indentation and empty lines are necessary syntax features
```python
#set x equal to zero
>>> x = 0
#while x is less than 100 print the value of x 
>>> while x < 100:
...     print(x)
...     x = x + 1		# increase the value of x by 1, ensuring that the loop will end
...
0
1
2
.
99
```

While we are printing out the values of variables, this is for your edification.  We would usually replace the printing with some other code.
```python
>>> a = 1
>>> b = 1
>>> c = 0
>>> while c < 10000:
...     c = a + b
...     a = b
...     b = c
...     print(c)
...
2
3
5
8
13
21
34
55
89
144
233
377
610
987
1597
2584
4181
6765
10946
```

It is very possible to create an infinite loop, so before running you want to be sure that the loop will end.
Use ctrl+c to stop an infinite loop

```python
>>> a = True
>>> while a:
...     print("Infinite loop")
...
Infinite loop
```

Loops can be combined with If Then logic statements and `break` will end a loop
Here we search for the first value above 15000 and below 19000 that is divisible by 19

```python
x = 15000
>>> while x < 19000:
...     if x % 19 == 0:
...             print(str(x) + " is divisible by 19")
...             break
...     x = x + 1
...
15010 is divisible by 19
```

`continue` skips the remaining code in 1 cycle of the loop
Here, we print out the first 100 even numbers, counting from 0.  Note that it really matters where the line `found = found + 1` is placed

```python
x = 0
>>> x = 0
>>> found = 0
>>> while found < 100:
...     x = x + 1
...     if x % 2 == 1:
...             continue
...     print(x)
...     found = found + 1
...
2
4
.
200
```

For loops work very similarly to those in `bash` but the syntax is slightly different.  Here we print all of the values in a list

```python
>>> z = [1, 5, "mystring", True]
>>> for x in z:
...     print(x)
...
1
5
mystring
True
```

When a string is presented to the For loop, it will iterate character by character

```python
>>> my_string = "a given string"
>>> for character in my_string:
...     print(character)
...
a

g
i
v
e
n

s
t
r
i
n
g
```

To print the key:value pairs in a dictionary, we can use the `dictionary.items()` method which returns a list of tuples in conjuction with a for loop to iterate through the list

```python
>>> z = {0: "a", 1: "b", 2: "c"}
# view the list of tuples that .items() returns
>>> z.items()
dict_items([(0, 'a'), (1, 'b'), (2, 'c')])
#note here that two variables (`key` and `val`) can be specified with a list of comma delimited tuples for input
>>> for (key, val) in z.items():
...     print(key, "->", val)
...
0 -> a
1 -> b
2 -> c
```

The `range` function is useful to create a list of numbers for a For loop.  Note the non-intuitive behavior with the final value in the range.

```python
>>> list(range(10))
[0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
>>> list(range(1, 5))
[1, 2, 3, 4]
>>> list(range(0, 10, 3))
[0, 3, 6, 9]

>>> for x in range(10):
...     print(x ** 2)
...
0
1
4
9
16
25
36
49
64
81
```

Recall that each element in a list has an index value.  `enumerate()` can be used to show the index and value associate with each element

```python
>>> list(enumerate(my_string))
[(0, 'a'), (1, ' '), (2, 'g'), (3, 'i'), (4, 'v'), (5, 'e'), (6, 'n'), (7, ' '), (8, 's'), (9, 't'), (10, 'r'), (11, 'i'), (12, 'n'), (13, 'g')]
>>> for k, x in enumerate(my_string):
...     print(k, x)
...
0 a
1
2 g
3 i
4 v
5 e
6 n
7
8 s
9 t
10 r
11 i
12 n
13 g
>>> z = [1, 5, "mystring", True]
>>> for element, value in enumerate(z):
...     print("element: " + str(element) + " value: " + str(value))
...
element: 0 value: 1
element: 1 value: 5
element: 2 value: mystring
element: 3 value: True
```

You can apply the same function to all elements of list using _list comprehension_ 

```python
>>> a = [1, 2, 5, 14, 42, 132]
# calculate the square of each value in a and save it to b
>>> b = [x ** 2 for x in a]
>>> print(b)
[1, 4, 25, 196, 1764, 17424]
```

___

#### Mind Expander (Intermezzo) 3.3

Hint: you can self check by modifying the for loops to calculate the number of loops

```python
for i in range(3, 17):
	print("hello")

x=0
for i in range(3, 17):
	x = x+1

print(x)
```

___


### Working with Files

Python is capable of opening, creating, and editing text files

```python
# open a file, if it does not exist, it is created
# below *f* is a variable called a *file handle*, any variable name can be used
# below the *w* stands for *writing*, open the file and allow it to be written
>>> f = open("mytextfile.txt", "w")

# explore some of the methods for file handles
>>> f.name
'mytextfile.txt'
>>> f.mode
'w'
>>> f.encoding
'UTF-8'

# Modify the file, recall that \n means "end of line" or Line Feed (LF)
>>> s="Some text"
>>> f.write(s + "\n")
10

# Modify the file using a list, this will print A on one line, B on the next, ...
>>> f.writelines(["A\n", "B\n", "C\n"])

# Close the file handle
>>> f.close()
```

To avoid forgetting to close a file, `with` can be employed which both opens and closes the file

```
# show file contents
>>> with open("mytextfile.txt", "r") as f:
...     for my_line in f:
...             print(my_line)
...
Some text

A

B

C
```

With can also be used to make a copy of a file.

```python
>>> inputfile = "mytextfile.txt"
>>> outputfile = "test1.txt"
>>> with open(inputfile, "r") as fr:
...     with open(outputfile, "w") as fw:
...             for line in fr:
...                     fw.write(line)
...
10
2
2
2
```

Realize that when you read a file, it is done progressively, after you read a line, you are taken to the next line

```python
>>> f = open("mytextfile.txt", "r")
>>> f.readline()
'Some text\n'
>>> f.readline()
'A\n'
>>> f.readline()
'B\n'

# goto beginnning of file
>>> f.seek(0)
0
>>> f.readline()
'Some text\n'
>>> f.close
```

### Character-Delimited Files

We will goto the `~/CSB/python/sandbox` dir to demonstrate how to interface with tidy data files

```python
>>> import os
>>> os.chdir("CSB/python/sandbox")  # CSB must be in the pwd for this to work
```

You can also exit python, move to the `~/CSB/python/sandbox` dir in bash, then run python again

To view the first few lines of a file:

```python
>>> with open("../data/Dalziel2016_data.csv") as f:
...     for i, line in enumerate(f):
...             print(line.strip())
...             if i > 2:
...                     break
...
biweek,year,loc,cases,pop
1,1906,BALTIMORE,NA,526822.1365
2,1906,BALTIMORE,NA,526995.246
3,1906,BALTIMORE,NA,527170.1981
```

Python includes special modules for handling tidy data.  We need to _import_ the _csv_ module to do this. Then we can use the .DictReader() method to convert each line of the tidy file into a dictionary

```python
>>> import csv
# open the file
>>> with open("../data/Dalziel2016_data.csv") as f:
		# convert file to format where each line is a dictionary
...     reader = csv.DictReader(f)
		# read first 4 lines of convertd file
...     for i, row in enumerate(reader):
...             print(dict(row))
...             if i > 2:
...                     break
...
{'biweek': '1', 'year': '1906', 'loc': 'BALTIMORE', 'cases': 'NA', 'pop': '526822.1365'}
{'biweek': '2', 'year': '1906', 'loc': 'BALTIMORE', 'cases': 'NA', 'pop': '526995.246'}
{'biweek': '3', 'year': '1906', 'loc': 'BALTIMORE', 'cases': 'NA', 'pop': '527170.1981'}
{'biweek': '4', 'year': '1906', 'loc': 'BALTIMORE', 'cases': 'NA', 'pop': '527347.0136'}
```

As a demonstration of how the csv module can be used, we can write all entries for *WASHINGTON* to a new file

```python

>>> with open("../data/Dalziel2016_data.csv") as fr:
...     reader = csv.DictReader(fr)
		# save column header to variable
...     header = reader.fieldnames
...     with open("Dalziel2016_Washington.csv", "w") as fw:
...             writer = csv.DictWriter(fw, fieldnames = header, delimiter = ",")
...             for row in reader:
...                     if row["loc"] == "WASHINGTON":
...                             writer.writerow(row)

```

___

#### Mind Expander (Intermezzo) 3.4

___


### Running a `Python` Script in `Bash`

Last thing is how to run a python script from the bash terminal.

```bash
python3 script.py
```

You should figure out where your python executable is and add a shebang! to your file. Mine is in `/usr/local/bin`.  I tested this in bash by typing `ls /usr/local/bin/py` and hitting the tab key twice.
Thus, the shebang! is `/usr/local/bin/python3`


## [III.  Group Excercise](https://classroom.github.com/g/AjcPKTDS)

Submit work by 3:30 pm, today

---


## HOMEWORK
[Assignment 6  Due 10/18  Excercise 3.8.1](https://github.com/tamucc-comp-bio/fall_2019/blob/master/assignments/assignment_6.md)

