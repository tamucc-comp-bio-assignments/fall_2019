# Week05 Python Boot Camp I: Basic Programming 

### [Exam 1](https://github.com/tamucc-comp-bio/fall_2019/blob/master/assignments/exam_1.md) is due at the beginning of this lecture

## Lecture 05 Slides
* There are no slides this week

___

## Computer Preparation

* Log into your TAMUCC email account
* Win10
  *`Anaconda` should be [installed](http://computingskillsforbiologists.com/setup/basic-programming/)
    * In Win10-Ubuntu terminal, installation is a bit more challenging here is how to make it work
    * Following `Anaconda` [download instructions](http://computingskillsforbiologists.com/setup/basic-programming/) with some modifications:
    
```bash
cd ~
mkdir downloads
cd downloads
wget https://repo.anaconda.com/archive/Anaconda3-2019.07-Linux-x86_64.sh
sudo bash Anaconda3-2019.07-Linux-x86_64.sh
exit
```

Restart ubunutu terminal

```bash
cd ~
sudo chmod -R 777 anaconda3
conda install jupyter
```

  * Jupyter Notebook  (DONT USE JUPYTER NOTEBOOK)
    * In Win10, goto start menu and select `Jupyter Notebook (Anaconda3)`
    * In Win10-Ubunutu Terminal
    
      ```bash
      #navigate to directory where you want to launch programming/
      jupyter notebook
      ```
      
    * In both, click `new` button in upper right corner, then `python3`
  
  * *Python*
    * open ubuntu terminal and type `python3`

  * If you are using an Ubuntu terminal that hasn't been setup (you'll know because it will ask you to create a new user name and password) or you notice odd cursor behavior when editing text in the terminal, then run the following code:
    ```bash
    git clone https://github.com/cbirdlab/wlsUBUNTU_settings.git
    ../wlsUBUNTU_settings/updateSettings.bash
    rm -rf wlsUBUNTU_settings
    ```
  * If the `CSB` directory does not exist in your home directory (check with `ls`), then run the following code to clone the `CSB` repository into your home directory:
    ```bash
    git clone https://github.com/CSB-book/CSB.git
    ```
* MacOS
  *`Anaconda` should be [installed](http://computingskillsforbiologists.com/setup/basic-programming/)
  * Launch jupyter notebook (DONT USE JUPYTER NOTEBOOK)
  * open terminal and type `python3`

* If the `CSB` directory does not exist in your home directory (check with `ls`), then run the following code to clone the `CSB` repository into your home directory:
  ```bash
  git clone https://github.com/CSB-book/CSB.git
  ```

___


## [I. Lecture Slides](https://github.com/tamucc-comp-bio/fall_2019/blob/master/lectures/Week05_files/Lecture05_BasicProgramming.pdf)

## II. Python Activities

### How to Get Help

  [docs.python.org](https://docs.python.org/3/)
  [stackoverflow.com](https://stackoverflow.com/)
  ```python
  help()
  help("My_COMMAND")  #pseudocode, replace My_COMMAND with the command you need help with
  ```
  Note: ctrl+d exits the help environment if you are using python (without jupyter notebook)

### Simple Calculations and Basic Data Types

Math is much easier to code in `python` than `bash`.  The following code gives examples of some of the `python` data types
  * Integers    round numbers
  * Floats    decimal numbers
  * Booleans    TRUE, FALSE
  * Strings    text
  
  ```python
  # Math
  >>> 2 + 2
  4
  >>> 2 - 1.5
  >>> 2 * 2
  >>> 3 / 2
  >>> 3 // 2    #integer division
  >>> 3 % 2    #modulo, or remainder of integer division
  
  # Equalities
  >>> 2 > 3
  >>> 3 > 2
  >>> 2 == 2
  >>> 2 != 2    "not equal"
  >>> 2 <= 2
  >>> 2 >= 2
  
  # Logical operations
  >>> 1 < 2 & 2 < 3    "and"
  >>> 1 < 2 | 2 > 3    "or"
  >>> 1 < 2 ! 2 > 3    "not"
  
  # Print text string
  >>> "my string"
  ```

When text strings have single and double quotes, encapsulate the string in 3 additional pairs of quotes
  ```python
  >>> """The tree's height is 6'2"."""
  'The tree\'s height is 6\'2".'                  #' ignore this comment
  ```

`python` code obeys the standard order of mathematical operations, but using parentheses makes code more readable
  *_P_*arentheses before
  *_E_*xponents before
  *_M_*ulitpy or 
  *_D_*ivide before
  *_A_*ddition or
  *_S_*ubtraction

  ```python
  >>> 2 * 3 ** 3
  54
  >>> 2 * (3 ** 3)
  54
  >>> (2 * 3) ** 3
  216
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

