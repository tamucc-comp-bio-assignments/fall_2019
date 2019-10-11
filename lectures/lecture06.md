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

## II. Python Activities

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


```python

```



#### Variable Assignment

Variable assignment works much like `bash`
  ```python
  >>> x = 5
  >>> x
  5
  >>> who   #show user-defined variables, jupyter notebook only
  x
  >>> vars()   #works in python, not jupyter. others: globals(), locals(), dir()
  {'__name__': '__main__', '__doc__': None, '__package__': None, '__loader__': <class '_frozen_importlib.BuiltinImporter'>, '__spec__': None, '__annotations__': {}, '__builtins__': <module 'builtins' (built-in)>, 'x': 5}
  ```

Math with variables

  ```python
  >>> x + 3
  8
  >>> y = 8
  >>> x + y
  13
  ```

Variables can also store text, but unlike bash, you must use quotes in python. further, mathematical operators can be used to paste text together, but variable data types must be the same

  ```python
  >>> x = "The cell grew"
  >>> x + " and is now larger"
  ```

You can not add a number and text together, unless the number is stored as a string or converted to a string

  ```python
  >>> x + y
  Traceback (most recent call last):
    File "<stdin>", line 1, in <module>
  NameError: name 'y' is not defined
  >>> y=" 8 nm"
  >>> x + y
  'The cell grew 8 nm'
  >>> y=8
  >>> x + " " + str(y) + " nm"
  'The cell grew 8 nm'
  ```

As you can see, str() changes the datatype to string.  Obviously, datatype is important in python

  ```python
  >>> z="88"
  >>> type(z)
  >>> y + int(z)    #change z datatype to integer
  96
  ```

#### Built-in Functions

In `python`, each buitin function name is following by parentheses that encapsulate the arguments passed to the function

  ```python
  >>> s = "a long string"
  >>> len(s)          #length, number of characters
  13
  >>> abs(-3.14)        #absolute value
  3.14
  >>> pow(3, 6)        #power, 3^6
  729
  >>> print(s)        #print variable to screen
  a long string
  >>> round(3.1415926535, 3)  #round to 3 decimals
  3.142
  >>> help(round)        #get help on round function
  ```

#### Strings

Python is has many useful functions for string manipulation.  We will start by making a string

  ```python
  >>> astring = "ATGCATG"
  >>> len(astring)
  7
  ```
  
Python is "*object-oriented*", which means that each *object*, such as a *string variable*, has a set a functions specific to that *object*, called *methods*.  

  ```python
  #Press tab after the period to list methods
  >>> astring.
  astring.capitalize(    astring.isdigit(       astring.rfind(
  astring.casefold(      astring.isidentifier(  astring.rindex(
  astring.center(        astring.islower(       astring.rjust(
  astring.count(         astring.isnumeric(     astring.rpartition(
  astring.encode(        astring.isprintable(   astring.rsplit(
  astring.endswith(      astring.isspace(       astring.rstrip(
  astring.expandtabs(    astring.istitle(       astring.split(
  astring.find(          astring.isupper(       astring.splitlines(
  astring.format(        astring.join(          astring.startswith(
  astring.format_map(    astring.ljust(         astring.strip(
  astring.index(         astring.lower(         astring.swapcase(
  astring.isalnum(       astring.lstrip(        astring.title(
  astring.isalpha(       astring.maketrans(     astring.translate(
  astring.isascii(       astring.partition(     astring.upper(
  astring.isdecimal(     astring.replace(       astring.zfill(
  ```
  
To learn more about a method, use `help`

  ```python
  >>> help(astring.find)
  ```

Here are some examples of the string-specific methods

  ```python
  >>> astring.replace("T", "U")
  'AUGCAUG'
  >>> astring.find("C")    #first position of C
  3
  >>> astring.count("G")
  2
  >>> newstring = " Mus musculus "
  # split string with , 
  >>> newstring.split()
  ['Mus', 'musculus']
  # replace value with ,    similar to the bash command: tr "u" ","
  >>> newstring.split("u")
  [' M', 's m', 'sc', 'l', 's ']
  # remove leading and trailig whitespace
  >>> newstring.strip()        
  'Mus musculus'
  ```

String methods can also be applied to strings that are not stored in variables

  ```python
  >>> "atgc".upper()
  'ATGC'
  >>> "TGCA".lower()
  'tgca'
  ```
  
Concatenate strings with + (slow) or `join` (fast)

  ```python
  >>> genus = "Rattus"
  >>> species = "norvegicus"
  >>> genus + " " + species
  'Rattus norvegicus'
  >>> human = ["Homo", "sapiens"]
  >>> " ".join(human)
  'Homo sapiens'
  >>> "->".join(["one", "leads", "2", "the", "other"])
  'one->leads->2->the->other'
  ```
  
Be careful not to confuse built-in *functions* with object-specific *methods*

  ```python
  >>> s = "ATGC"
  #call built in function print
  >>> print(s)
  ATGC
  #there is no print method, so if you try to call it, it fails
  >>> s.print()
  Traceback (most recent call last):
    File "<stdin>", line 1, in <module>
  AttributeError: 'str' object has no attribute 'print'
  ```

---

#### [Mind Expander 3.1](https://forms.office.com/Pages/ResponsePage.aspx?id=8frLNKZngUepylFOslULZlFZdbyVx8RLiPt1GobhHnlUNllCM0VQNk1ZVDVXWUwzVlVVWVQzSEIxNy4u)

---

### 3.4 Data Structures

Python provides built-in data structures which are special types of objects that store data that is organized in a particular manner. It is important to learn to choose the right data structure for a particular task. 
* Lists contain ordered sequences of values, termed *elements*
* Tuples are list where the elements cannot be changed or reordered
* Set are collections of distinct objects

Defining lists
  ```python
  # create an empty list 
  >>> new_list = []
  
  # create a list with elements, note that different data types can be used
  >>> my_list = [3, 2.44, "green", True]
  
  # the `list` function can be used to create a list
  >>> a = list("0123456789")
  >>> a
  ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']
  ```

Each element in a list is indexed, [starting at 0](http://python-history.blogspot.com/2013/10/why-python-uses-0-based-indexing.html), and elements can be retrieved by their index.
  ```python
  # retrieve second value in `my_list`
  >>> my_list[1]
  2.44
  
  # retrieve first value in `my_list`
  >>> my_list[0]
  3
  
  # you will trigger an error if there is no element at the specified index
  >>> my_list[4]
  Traceback (most recent call last):
    File "<stdin>", line 1, in <module>
  IndexError: list index out of range
  ```

You can also set values of particular elements using the index
  ```python
  # change first element of `my_list` to "blue"
  >>> my_list[0] = "blue"
  >>> my_list
  ['blue', 2.44, 'green', True]
  
  # retrieve elements 0 to 1, not including 1
  >>> my_list[0:1]
  ['blue']
  
  # retrieve elements 1 to 3, not including 3
  >>> my_list[1:3]
  [2.44, 'green']
  
  # retrieve all elements
  >>> my_list[:]
  ['blue', 2.44, 'green', True]
  
  # retrieve all elements before 3
  >>> my_list[:3]
  ['blue', 2.44, 'green']
  
  # retrieve all elements from three to the end of the list
  >>> my_list[3:]
  [True]
  
  # retrieve the 2nd to last element
  >>> my_list[-2]
  'green'
  ```

The most useful methods for lists are:
```python
  #`append` an element to the end of a list
  >>> my_list.append(25)
  >>> my_list
  ['blue', 2.44, 'green', True, 25]

  #`copy` the list to a new list
  >>> new_list = my_list.copy()
  >>> new_list
  ['blue', 2.44, 'green', True, 25]

  # `clear` all elements from a list
  >>> my_list.clear()
  >>> my_list
  []

  #`count` occurences of a specified element in the list
  >>> seq = list("TKAAVVNFT")
  >>> seq.count("V")
  2

  #`index`, return the index of the first matching element
  >>> seq.index("V")
  4

  #`pop` remove last element of a list an return it
  >>> seq2 = seq.pop()
  >>> seq
  ['T', 'K', 'A', 'A', 'V', 'V', 'N', 'F']
  >>> seq2
  'T'

  #`sort` the elements in the list, best for numbers or characters
  >>> a = [1, 5, 2, 42, 14, 132]
  >>> a.sort()
  >>> a
  [1, 2, 5, 14, 42, 132]

  #`reverse` the order of the elements in the list
  >>> a.reverse()
  >>> a
  [132, 42, 14, 5, 2, 1]

  #`del` an element or series of elements
  >>> del(a[2:3])
  >>> a
  [132, 42, 5, 2, 1]
  ```

#### Dictionaries

In an English dictionary, *definitions* are indexed by *words*.
In a  Python  dictionary, *elements*    are indexed by *keys*.
Syntax: `key:value, key2:value, key3:value ...`
  ```python
  # Make an empty dictionary
  >>> my_dict = {}

  # like lists, dictionaries can contain several datatypes, not just 1
  >>> my_dict = {"a": "test", "b": 3.14, "c": [1, 2, 3, 4]}
  >>> my_dict
  {'a': 'test', 'b': 3.14, 'c': [1, 2, 3, 4]}

  # the order of the key:values do not matter in dictionaries
  >>> GenomeSize = {"Homo sapiens": 3200.0, "Escherichia coli": 4.6, "Arabidopsis thaliana": 157.0}
  >>> GenomeSize
  {'Homo sapiens': 3200.0, 'Escherichia coli': 4.6, 'Arabidopsis thaliana': 157.0}

  # call a specific key
  >>> GenomeSize["Arabidopsis thaliana"]
  157.0

  # add a new value using a novel key
  >>> GenomeSize["Saccharomyces cerevisiae"] = 12.1
  >>> GenomeSize
  {'Homo sapiens': 3200.0, 'Escherichia coli': 4.6, 'Arabidopsis thaliana': 157.0, 'Saccharomyces cerevisiae': 12.1}

  # nothing happens if the key:value exists
  >>> GenomeSize["Escherichia coli"] = 4.6
  >>> GenomeSize
  {'Homo sapiens': 3200.0, 'Escherichia coli': 4.6, 'Arabidopsis thaliana': 157.0, 'Saccharomyces cerevisiae': 12.1}

  # the value is replaced if the key exists by the value is different
  >>> GenomeSize["Homo sapiens"] = 3201.1
  >>> GenomeSize
  {'Homo sapiens': 3201.1, 'Escherichia coli': 4.6, 'Arabidopsis thaliana': 157.0, 'Saccharomyces cerevisiae': 12.1}
  ```

Useful dictionary methods
  ```python
  # `copy` the dictionary
  >>> GS = GenomeSize.copy()
  >>> GS
  {'Homo sapiens': 3201.1, 'Escherichia coli': 4.6, 'Arabidopsis thaliana': 157.0, 'Saccharomyces cerevisiae': 12.1}

  # `clear` all elements 
  >>> GenomeSize.clear()
  >>> GenomeSize
  {}

  # `get` a value from a key, if the key doesn't exist then return a default value
  >>> GS.get("Mus musculus", -10)
  -10

  # `keys`, create a list containing the keys in a dictionary
  # useful to initialize a dictionary or return a special value when a key is not present
  >>> GS.keys()
  dict_keys(['Homo sapiens', 'Escherichia coli', 'Arabidopsis thaliana', 'Saccharomyces cerevisiae'])

  # `values`, create a list containing the values in a dictionary
  >>> GS.values()
  dict_values([3201.1, 4.6, 157.0, 12.1])

  #`pop`, remove the specified key from dictionary and return value
  >>> GS.pop("Homo sapiens")
  3201.1
  >>> GS
  {'Escherichia coli': 4.6, 'Arabidopsis thaliana': 157.0, 'Saccharomyces cerevisiae': 12.1}

  # `update`, simplest way to join 2 dictionaries, order matters, keys in common will be overwritten. ' 
  >>> D1 = {"a": 1, "b": 2, "c": 3}
  >>> D2 = {"a": 2, "d": 4, "e": 5}
  >>> D1.update(D2)
  >>> D1
  {'a': 2, 'b': 2, 'c': 3, 'd': 4, 'e': 5}
  ```

#### Tuples 

Tuples are like lists, but can not be changed (write protection) and are faster.
  ```python
  # define a tuple
  >>> my_tuple = (1, "two", 3)

  # return elements by indexing or slicing
  >>> my_tuple[0]
  1

  # tuples cannot be changed
  >>> my_tuple[0] = 33
  Traceback (most recent call last):
    File "<stdin>", line 1, in <module>
  TypeError: 'tuple' object does not support item assignment
  ```

There are only 2 methods for tuples
  ```python
  # `count` elements in tuple
  >>> tt = (1, 1, 1, 1, 2, 2, 4)
  >>> tt.count(1)
  4

  # `index`, return first index of element
  >>> tt.index(2)
  4
  ```

Tuples can also be used as keys in a dictionary
  ```python
  >>> D3 = {("trial", 62): 4829}
  >>> D3
  {('trial', 62): 4829}
  ```

#### Sets

Sets are lists without diplicated entries and have special operators.
* Union - values in set 1 *or* set 2
* Intersection - values in set 1 *and* set 2
* Difference - values unshared between set 1 and 2

  ```python
  # create a list
  >>> a = [5, 6, 7, 7, 7, 8, 9, 9]
  
  # make a set from the list
  >>> b = set(a)
  >>> b
  {5, 6, 7, 8, 9}

  # intersection 
  >>> c = {3, 4, 5, 6}
  >>> b & c
  {5, 6}

  # union
  >>> b | c
  {3, 4, 5, 6, 7, 8, 9}

  # difference
  >>> b ^ c
  {3, 4, 7, 8, 9}
  ```

The union, intersection, and difference operators also exist as *methods*. You can also test whether a set is a *subset* or a *superset*. 
  ```python
  # create sets using {}
  >>> s1 = {1, 2, 3, 4}
  >>> s2 = {4, 5, 6}
  
  # intersection
  >>> s1.intersection(s2)
  {4}
  
  # union
  >>> s1.union(s2)
  {1, 2, 3, 4, 5, 6}
  
  # symmetric difference
  >>> s1.symmetric_difference(s2)
  {1, 2, 3, 5, 6}
  
  # difference
  >>> s1.difference(s2)
  {1, 2, 3}
  
  #subset
  >>> s1.issubset(s2)
  False
  
  #superset
  >>> s1.issuperset(s2)
  False
  
  >>> s1.issubset(s1.union(s2))
  True
  ```

Note that calling `a = {}` creates and empty dictionary, not an empty set. `a = ([])` initializes an empty set.

#### Summary of Data Structures

  ```python
  # round brackets -> tuple
  >>> type((1, 2))
  <class 'tuple'>

  # square brackets -> list
  >>> type([1, 2])
  <class 'list'>

  # curly brackets, seq of vals -> set
  >>> type({1, 2})
  <class 'set'>

  # curly brackets, key:value pairs -> dictionary
  >>> type({1: "a", 2: "b"})
  <class 'dict'>
  >>> one = (1, 2, "tuple")
  >>> two = [3, 4, "list"]
  >>> three = {5: ["value1"], 6: ["value2"]}   # a dictionary
  ```

The next level: Lists can also contain other lists, tuples, dictionaries.  If you think about it, a table is a list of lists.
  ```python
  # create a list containing a tuple, list, and dictionary
  >>> container = [one, two, three]
  >>> container
  [(1, 2, 'tuple'), [3, 4, 'list'], {5: ['value1'], 6: ['value2']}]

  # add a value to the list within the dictionary within the list
  >>> container[2][5].append("value3")
  >>> container
  [(1, 2, 'tuple'), [3, 4, 'list'], {5: ['value1', 'value3'], 6: ['value2']}]
  ```

### [Mind Expander 3.2](https://forms.office.com/Pages/ResponsePage.aspx?id=8frLNKZngUepylFOslULZlFZdbyVx8RLiPt1GobhHnlUMzdVVkQwTlRQMENSVTQ5S0dUT0c1NFgwRi4u)

---


## HOMEWORK
Assignment 5  Due 10/04  

