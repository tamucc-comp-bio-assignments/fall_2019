# Week08 Python Boot Camp II: Writing Good Code II

###  Assignment7 is due at the beginning of this lecture


## Computer Preparation

* Log into your TAMUCC email account
* Win10
	* open ubuntu terminal and run the following to update your OS and software:
		```bash
		sudo apt-get update
		sudo apt-get upgrade
		```
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

## II. Lecture Activities 

### 4.5 Errors and Exceptions

If there is something wrong with your code, python will classify it as an *error* or and *exception*, and will provide useful feedback you can use to solve the problem.

*Errors*: something is wrong with the syntax or grammar of the code
* `SyntaxError`
	* usually punctuation or equalities are incorrect
* `IndentationError`
* `TypeError`
	* data type incorrect
* `NameError`
	* variable does not exist
* `IndexError`
	* element you tried to access (e.g., in a list) does not exist
* `KeyError`
	* key is not in dictionary
* `IOError`
	* tried to read file that doesn't exist
	* tried to write a file that is open for reading
* `AttributeError`
	* tried to use a method that does not exist

*Exceptions*: the syntax is correct, but a `Traceback` message is produced because the code cannot be executed


#### Handling Exceptions

Here we will demonstrate how to handle exceptions

Let's try to divide a number by zero in the python command line

```python
>>> y = 2.0
>>> x = 0
>>> y / x
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
ZeroDivisionError: float division by zero
>>>
```

Note that you are given the line of the error (1 if you are executuing code line by line in the python terminal) and a useful message that indicates that a value was divided by zero.

You can use `try:` and `except:` to handle exceptions and run alternative code if they occur.  While we printed a message, you could also change the value of x.

```python
>>> y = 16.0
>>> x = 0.0
>>> try:
...     print(y / x)
... except ZeroDivisionError:
...     print("cannot divide by 0")
...
cannot divide by 0
>>>
```

### 4.6 Debugging

If you are following the text book, this section will be smoother with Jupyter Notebook, but here I demonstrate with the python terminal for the bold. 

#### [`pdb`](https://docs.python.org/3/library/pdb.html)

Python debugger can be imported at the python command line

```python
>>> import pdb
```

We are going to import some other functions to demonstrate debugging

```python
>>> from numpy.random import normal
>>> from numpy.random import uniform
>>> from math import sqrt
```

Now we are going to introduce a block of code with a bug. Type the following function into your text editor, then copy and paste it into the python terminal

```python
def get_expected_sqrt_x(distribution = "uniform",
		par1 = 0,
		par2 = 1,
		sample_size = 10):
	""" Calculate the expectation of sqrt(|X|)
	where X is a random variable.
	X can be either uniform or normal,
	with parameters specified by the user;
	before taking the square root, we take the
	absolute value, to make sure it's positive.
	"""
	total = 0.0
	for i in range(sample_size):
		if distribution == "uniform":
			z = uniform(par1, par2, 1)
		elif distribution == "normal":
			z = normal(par1, par2, 1)
		else:
			print("Unknown distribution. Quitting...")
			return None
		total = total + sqrt(z)
	return total / sample_size

```

If you've done it correctly, it should not return anything:

```python
>>> def get_expected_sqrt_x(distribution = "uniform",
...             par1 = 0,
...             par2 = 1,
...             sample_size = 10):
...     """ Calculate the expectation of sqrt(|X|)
...     where X is a random variable.
...     X can be either uniform or normal,
...     with parameters specified by the user;
...     before taking the square root, we take the
...     absolute value, to make sure it's positive.
...     """
...     total = 0.0
...     for i in range(sample_size):
...             if distribution == "uniform":
...                     z = uniform(par1, par2, 1)
...             elif distribution == "normal":
...                     z = normal(par1, par2, 1)
...             else:
...                     print("Unknown distribution. Quitting...")
...                     return None
...             total = total + sqrt(z)
...     return total / sample_size
...
>>>
```

Now run the function

```python
# the function probably won't throw an error with this input
>>> get_expected_sqrt_x(sample_size = 100)
0.6651831777616457

# sometimes the function is broken, depending upon the random number selected
>>> get_expected_sqrt_x(distribution = "normal", par1 = 1, par2 = 0.5, sample_size = 10)
0.9288381624098158
>>> get_expected_sqrt_x(distribution = "normal", par1 = 1, par2 = 0.5, sample_size = 10)
0.9458732114559268
>>> get_expected_sqrt_x(distribution = "normal", par1 = 1, par2 = 0.5, sample_size = 10)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "<stdin>", line 21, in get_expected_sqrt_x

# if we increase the sample size, the function is broken nearly every time
>>> get_expected_sqrt_x("normal", 1, 0.5, 1000)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "<stdin>", line 21, in get_expected_sqrt_x
ValueError: math domain error
```

The normal feedback tells you where the errors occurred.  Now let's employ pdb to help with debugging, using `pdb.pm()`. The `pm` stands for post mortem and will actually step you into the function you just ran, allowing you to evaluate what has happened by querying the variables.  Let's look at the value of each variable to see if we can figure out what's going wrong.

```python
>>> pdb.pm()
> <stdin>(21)get_expected_sqrt_x()
(Pdb) total
28.025994520402385
(Pdb) sample_size
1000
(Pdb) distribution
'normal'
(Pdb) z
array([-0.58195987])
(Pdb)
```

The debugger doesn't do everything for you.  You need to solve the mystery of why the code broke given the information that pdb helped you to retrieve.  Note that z is negative and we take the sqrt of it. That seems like it could cause an error...

```python
(Pdb) sqrt(z)
*** ValueError: math domain error
(Pdb) q
>>>
```

We've found the bug!  An error occurs when taking the sqrt of z on line 21. Note that we used q to exit `pdb`.

Now, let's crush that bug by taking the absolute value of z before applying sqrt.

```python
#note that I didn't change the name of the function, unlike in the book
def get_expected_sqrt_x(distribution = "uniform",
		par1 = 0,
		par2 = 1,
		sample_size = 10):
	""" Calculate the expectation of sqrt(|X|)
	where X is a random variable.
	X can be either uniform or normal,
	with parameters specified by the user;
	before taking the square root, we take the
	absolute value, to make sure it's positive.
	"""
	total = 0.0
	for i in range(sample_size):
		if distribution == "uniform":
			z = uniform(par1, par2, 1)
		elif distribution == "normal":
			z = normal(par1, par2, 1)
		else:
			print("Unknown distribution. Quitting...")
			return None
		total = total + sqrt(abs(z))
	return total / sample_size
	
```

Test the code again

```python
>>> get_expected_sqrt_x("normal", 1, 0.5, 1000)
0.9740756808415657
```

`pdb` had many functions, you can consult [it's documentation](https://docs.python.org/3/library/pdb.html).  One other common use of pdb is to set places in your code where the execution will stop, and you can take over control of running the code line by line. This allows you to query variables, as well as identify and troubleshoot problematic lines of code.  You can do this by adding `pdb.set_trace()` on any line of your code.  Copy and paste this into your terminal to update the function:

```python
def get_expected_sqrt_x(distribution = "uniform",
		par1 = 0,
		par2 = 1,
		sample_size = 10):
	pdb.set_trace()
	""" Calculate the expectation of sqrt(|X|)
	where X is a random variable.
	X can be either uniform or normal,
	with parameters specified by the user;
	before taking the square root, we take the
	absolute value, to make sure it's positive.
	"""
	total = 0.0
	for i in range(sample_size):
		if distribution == "uniform":
			z = uniform(par1, par2, 1)
		elif distribution == "normal":
			z = normal(par1, par2, 1)
		else:
			print("Unknown distribution. Quitting...")
			return None
		total = total + sqrt(abs(z))
	return total / sample_size

```

You should get no feedback.  Now run the function, and you will enter the pdb shell at the line where you called pdb.set_trace().

```python
>>> get_expected_sqrt_x("normal", 1, 0.5, 1000)
> <stdin>(13)get_expected_sqrt_x()
(Pdb)
```

Notice you are now in the pdb shell on line 13 of the `get_expected_sqrt_x()` function.  You can now execute the code line by line (I highly recommend viewing the function in its own file in notepad++ or bbedit so you can keep track of the line numbers). Here are some common pdb commands:
* w(here) – Print the stack trace
* d(own) – Move the current frame X number of levels down. Defaults to one.
* u(p) – Move the current frame X number of levels up. Defaults to one.
* b(reak) – With a *lineno* argument, set a break point at that line number in the current file / context
* s(tep) – Execute the current line and stop at the next possible line
* c(ontinue) – Continue execution

```python
# where am I?
(Pdb) w
  <stdin>(1)<module>()
> <stdin>(13)get_expected_sqrt_x()

# execute present line and step forward 1 line
(Pdb) s
> <stdin>(14)get_expected_sqrt_x()
(Pdb) s
> <stdin>(15)get_expected_sqrt_x()
(Pdb) s
> <stdin>(17)get_expected_sqrt_x()
(Pdb) s
> <stdin>(18)get_expected_sqrt_x()
(Pdb) s
> <stdin>(22)get_expected_sqrt_x()
(Pdb) s
> <stdin>(14)get_expected_sqrt_x()
(Pdb) s

# continue execution until done or error
(Pdb) c
0.9805129283609519
>>>
```

We could have also checked the variable values along the way, or if we hit an error after entering `c`, we could have used pdb.pm() to investigate what when wrong.  When making functions, a best practice is to:
* Write code
* Set breakpoint with pdb.set_traceback()
* Run new code line by line
* Try new code by copying and pasting it into the debugger environment
* Crush bugs

One last point on `pdb` is that you can run it on python scripts from the bash command line. See the [pdb manual page](https://docs.python.org/3/library/pdb.html).  Here's an example of how to do this: `python3 -m pdb myscript.py`


#### Debugging Errors that Don't Cause Error Messages

It is important to have a clear expectation of the result that your code should return.  This applies on the macro scale of an entire package, but also on the micro-scale of a particular line of code.  You can identify errors (generally these are human errors in logic) by knowing what the outcome should be, and testing that your code returns that value. Testing the extremes is always important when setting up tests.  Of course the way most of these types of errors creep in is when we assume that a particular line of code is too simple to need to test it.  In that case, test larger blocks of code.  Every line should be tested in one way or another.

Python allows you to use assertions to help with the testing process.  This is a way for you to trigger your own error messages if an assertion is violated.

Add the following function to your text editor, then run it in your terminal

```python
import scipy #for log and exp
import scipy.special #for binomial coefficient
def compute_likelihood_binomial(p, successes, trials):
	""" Compute the likelihood function for the binomial
	model where p is the probability of success;
	successes is the number of observed successes
	out of trials
	"""
	assert p >= 0, "Negative probability"
	assert p <= 1, "Probability > 1!"
	assert successes <= trials, "More successes than trials!"
	log_likelihood = successes * scipy.log(p) + (trials - successes) * scipy.log(1.0 - p)
	return scipy.exp(log_likelihood) * scipy.special.binom (trials, successes)
	
```

Now let's test it

```python
>>> compute_likelihood_binomial(0.5, 5, 10)
0.24609375
>>> compute_likelihood_binomial(-0.5, 5, 10)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "<stdin>", line 7, in compute_likelihood_binomial
AssertionError: Negative probability
>>>
```

### Mind Expander 4.2

Identify the bug in the `genetic_code.py` script in `~/CSB/good_code/data`. Note that the script assumes you are in the `sandbox` dir. 


## 4.7 Unit Testing

Unit testing is the formalized testing of functions.  In unit testing, you write code to test each function.  As you change the code, there are internal checks that there were no unintended consequences.

* Organize your functions.  If you have more than a few functions to run a program, then classify them (e.g., stats, input, simulations) into 1 module per classification.  Functions are where all the work is done.
* Your main program will import these functions, calling them as necessary,  and should be fairly clean and easy to read.
* Unit tests can be made for each module

Let's look at adding unit testing to a simple function.  Type the following code into a new script, first in your text editor, then in `nano` and name it `CGcont.py` in your sandbox.

```python
def CGcontent(DNA):
	""" Return proportion of CG in sequence.
	 Assumes that the DNA is uppercase containing
	 ONLY A T G C
	"""
	CG = DNA.count("C") + DNA.count("G")
	CG = CG / len(DNA)
	return CG
```

Now launch python and import the CGcont.py script as follows:

```bash
$ python3 -i CGcont.py
```

Run some tests where you can easily confirm that the answers are correct.

```python
>>> CGcontent("AAAAAA")
0.0
>>> CGcontent("AAATTT")
0.0
>>> CGcontent("AAATTTCCCC")
0.4
>>> CGcontent("AAATTTCCC")
0.3333333333333333
>>>
```

Now, modify your function with the results of the tests, as follows:

```python
def CGcontent(DNA):
	""" Return proportion of CG in sequence.
	 Assumes that the DNA is uppercase containing
	 ONLY A T G C
	=================================
	Unit testing with docstrings
	=================================
	Run the command in python3, (e.g., python3 -i CGcont.py) and copy the
	 output below:
	>>> CGcontent("AAAAAA")
	0.0
	>>> CGcontent("AAATTT")
	0.0
	>>> CGcontent("AAATTTCCCC")
	0.4
	>>> CGcontent("AAATTTCCC")
	0.333...
	"""
	CG = DNA.count("C") + DNA.count("G")
	CG = CG / len(DNA)
	return CG
```

And finally, you can run the unit testing from the bash shell like this:

```bash
$ python3 -m doctest -v CGcont.py
Trying:
    CGcontent("AAAAAA")
Expecting:
    0.0
ok
Trying:
    CGcontent("AAATTT")
Expecting:
    0.0
ok
Trying:
    CGcontent("AAATTTCCCC")
Expecting:
    0.4
ok
Trying:
    CGcontent("AAATTTCCC")
Expecting:
    0.333...
**********************************************************************
File "/home/cbird/CSB/good_code/sandbox/CGcont2.py", line 16, in CGcont2.CGcontent
Failed example:
    CGcontent("AAATTTCCC")
Expected:
    0.333...
Got:
    0.3333333333333333
1 items had no tests:
    CGcont2
**********************************************************************
1 items had failures:
   1 of   4 in CGcont2.CGcontent
4 tests in 2 items.
3 passed and 1 failed.
***Test Failed*** 1 failures.
```

Finally, you can make the unit testing automatic by adding the following lines of code to the end of the script (in `nano`).  

```python
if __name__ == "__main__":
	import doctest
	doctest.testmod()
```

Then, every time the script is run with a -v, the unit testing occurs.

```bash
$ python3 CGcont.py -v
```

#### 4.7.3 More Complex Tests

Since a dictionary is unordered and python randomly returns the keys of a dictionary, we are unlikely to pass the unit testing for functions that return dictionaries.  There is, however, a solution: save the dictionary to a variable, then test the variable:

```python
# since we haven't defined myfunction, this code is just an example
>>> tmp = myfunction(x)
>>> tmp == {'a': 1, 'b': 2, 'c': 3}
True
```

Output that is governed by random numbers can be handled by setting the randome number seed so that the same result is obtained.

```python
import scipy
def get_sample_mean(n):
	""" For testing, we want to make sure we
		set the seed of the random number generator:
		>>> scipy.random.seed(1)
		>>> get_sample_mean(10)
		-0.0971...
	"""
	my_sample = scipy.random.normal(size = n)
	return scipy.mean(my_sample)
```

### 4.9 Beyond Basics

#### 4.9.1 Arithmetic of Data Structures

Adding lists

```python
>>> a = [1, 2, 3]
>>> b = [4, 5]
>>> a + b
[1, 2, 3, 4, 5]
```

Adding tuples

```python
>>> a = (1, 2)
>>> b = (4, 6)
>>> a + b
(1, 2, 4, 6)
```

But you can't add dictionaries with +

```python
>>> z1 = {1: "AAA", 2: "BBB"}
>>> z2 = {3: "CCC", 4: "DDD"}
>>> z1 + z2
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: unsupported operand type(s) for +: 'dict' and 'dict'
```

Multiply strings, tuples, and lists

```python
>>> "a" * 3
'aaa'
>>> (1, 2, 4) * 2
(1, 2, 4, 1, 2, 4)
>>> [1, 3, 5] * 4
[1, 3, 5, 1, 3, 5, 1, 3, 5, 1, 3, 5]
```

#### 4.9.2 Mutable and Immutable Types

Lists are mutable

```python
>>> a = [1, 2, 3]
>>> a[0] = 1000
>>> a
[1000, 2, 3]
```

Dictionaries are mutable

```python
>>> dd = {"a": 1}
>>> dd.update({"b": 2})
>>> dd
{'a': 1, 'b': 2}
>>> dd["a"] = dd.get("a", 0) + 1
>>> dd
{'a': 2, 'b': 2}
```

With mutable data types, like lists, changes happen in place

```python
>>> a
[1000, 2, 3]
>>> a.sort()
>>> a
[2, 3, 1000]
>>> b = a.pop()
>>> a
[2, 3]
>>> b
1000
```

With immutable objects, such as tuples and strings, the whole object is replaced.  It is not modified.

```python
>>> tt = (1, 2, 3)
>>> tt + (4, 5)
(1, 2, 3, 4, 5)
>>> tt
(1, 2, 3)
>>> ss = "a string"
>>> ss.upper()
'A STRING'
>>> ss
'a string'
```

#### 4.9.3 Copying Objects

Here, `b` retains its autonomy after `b = a` when `a` is a single value

```python
>>> a = 15
>>> b = a
>>> a = 32
>>> a
32
>>> b
15
```

If `a` is a list, however, `b` changes as `a` changes after `b = a`

```python
>>> a = [1, 2, 3]
>>> b = a
>>> a.append(4)
>>> a
[1, 2, 3, 4]
>>> b
[1, 2, 3, 4]
```

The `.copy()` method allows `b` to remain autonomous when `a` is a list

```python
>>> a = [1, 2, 3]
>>> b = a.copy()
>>> a.append(4)
>>> a
[1, 2, 3, 4]
>>> b
[1, 2, 3]
```

If there are lists nested within lists, then `copy` will not be enough.  You'll need `deepcopy` to make an independent copy.

```python
>>> a = [[1, 2], [3, 4]]
>>> b = a.copy()
>>> a[0][1] = 10
>>> a
[[1, 10], [3, 4]]
>>> b
[[1, 10], [3, 4]]
>>>
>>> import copy
>>> a = [[1, 2], [3, 4]]
>>> b = copy.deepcopy(a)
>>> a[0][1] = 10
>>> a
[[1, 10], [3, 4]]
>>> b
[[1, 2], [3, 4]]
```

#### 4.9.4 Variable Scope

Variable scope describes where in the code a variable can be accessed.

Variables can have either *global* or *local* scope.  Copy and paste this code into your python terminal.  There are two different variables named `a`.  A global `a` outside of the function and a local `a` inside of the function. 

```python

def changea(x):
	a = x
	print("New value for a:", a)

a = 51
print("Current value of a:", a)
changea(22)
print("After calling the function:", a)

```

We can, however access the global `a` inside of a function.  It is global, afterall.  

```python
>>> def changea(x):
...     global a
...     a = x
...     print("New value for a:", a)
...
>>> a = 51
>>> print("Current value of a:", a)
Current value of a: 51
>>> changea(22)
New value for a: 22
>>> print("After calling the function:", a)
After calling the function: 22
>>>
```

### Chapter 6 Scientific Computing

While we will not cover this chapter in detail, you may want to review it for your project or research.  It reviews numpy, scipy, pandas, and biopython.  

* NumPy: adds vector and matrix data structures
* SciPy: adds algebra, integration, differential equations, stats, and simulations
* Pandas: manipulation, analysis, and visualization of data sets
* Biopython: bioinformatics, connection to biological databases

The are installation details in `~/CSB/scientific/installation`.  You can also consult the official [python package installation tutorial](https://packaging.python.org/tutorials/installing-packages/)

I did the following in the bash shell to install biopython, given that we should all have anaconda:

```bash
cd ~
# list inatalled packages
conda list
# I have numpy, scipy, and pandas
# install biopython
conda install biopython
```

Confirm installation of biopython in python3 terminal

```python
>>> from Bio import Entrez
>>>
```

You will have to install at least some of the packages.

---


## HOMEWORK
[Assignment 8](https://github.com/tamucc-comp-bio/fall_2019/blob/master/assignments/assignment_8.md)

