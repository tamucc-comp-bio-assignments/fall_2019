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

#### 4.2.1 Writing Functions

When dividing the complex task of making a program, it is important to avoid over and underdividing.

* Too many user-defined functions are hard to track
* Too few user-defined functions makes bloated code (too many lines)

My rule of thumb is to create functions for repetative tasks.  If you find yourself copying and pasting blocks of code multiple times within a script, you should make a function out of it.

We have been using built in functions, but we can also make our own.
* Define your custom function
* Use the function

Let us write a function that that calculates the GC content of a DNA sequence.  I want you to type the function into `notepad++` or `bbedit` then test it by copying and pasting it into a `python` terminal

```python
#this is the function to calc GC content, type this into your text editor
def GCcontent(dna):
	dna = dna.upper()
	numG = dna.count("G")
	numC = dna.count("C")
	numA = dna.count("A")
	numT = dna.count("T")
	return (numG + numC) / (numG + numC + numT + numA)

# copy and paste the above code into your python terminal.  It should look like this if it works:
>>> def GCcontent(dna):
...     dna = dna.upper()
...     numG = dna.count("G")
...     numC = dna.count("C")
...     numA = dna.count("A")
...     numT = dna.count("T")
...     return (numG + numC) / (numG + numC + numT + numA)
...
>>>
```

Anatomy of the `GCcontent()` function:
* Line 1: define the function with `def GCcontent(dna):`
	* `def` means define.  this has to be used
	* `GCcontent()` is the name of the function you are creating
	* `dna` is a variable that allows a dna sequence to be passed into the function for processing
* Lines 2-6: code to do calculate GC content
	* make all bases uppercase in sequence `dna = dna.upper()`
	* Count the number of G `numG = dna.count("G")`
	* Count C, A, and T also
* Line 7: define the output of the function `return (numG + numC) / (numG + numC + numT + numA)`
	* `return` tells the function to output, or return, the result of the following code
	* `numG + numC) / (numG + numC + numT + numA)` calculates the proportion of bases that are either G or C

```python
# show variables and functions in enviroment
>>> globals()
{'__name__': '__main__', '__doc__': None, '__package__': None, '__loader__': <class '_frozen_importlib.BuiltinImporter'>, '__spec__': None, '__annotations__': {}, '__builtins__': <module 'builtins' (built-in)>, 'GCcontent': <function GCcontent at 0x7fc203307bf8>}
>>> locals()
{'__name__': '__main__', '__doc__': None, '__package__': None, '__loader__': <class '_frozen_importlib.BuiltinImporter'>, '__spec__': None, '__annotations__': {}, '__builtins__': <module 'builtins' (built-in)>, 'GCcontent': <function GCcontent at 0x7fc203307bf8>}
```

Use the `GCcontent()` function in your terminal.  Note that the DNA sequence you specify is loaded into the `dna` variable

```python
>>> GCcontent("AATTTCCCGGGAAA")
0.42857142857142855
>>> GCcontent("ATGCATGCATGC")
0.5
```

Let us define more functions in your text editor, then copy and paste these new functions into your python3 terminal.  Fix any errors that occur in your text editor and try again.

```python
#print a dictionary
def print_dictionary(mydic):
	for k, v in mydic.items():
		print("key: ", k, " value: ", str(v))

#return a list with results
def squared(start = 1, end = 10):
	results = []
	for i in range(start, end):
		r = i ** 2
		results.append(r)
	return results

```

Now we can test the functions

```python
>>> print_dictionary({"a": 3.4, "b": [1, 2, 3, 4], "c": "astring"})
key:  a  value:  3.4
key:  b  value:  [1, 2, 3, 4]
key:  c  value:  astring

>>> squared(start = 3, end = 10)
[9, 16, 25, 36, 49, 64, 81]

>>> squared(5)
[25, 36, 49, 64, 81]

>>> squared(end = 3)
[1, 4]

>>> squared()
[1, 4, 9, 16, 25, 36, 49, 64, 81]
```

#### [Mind Expander 4.1](https://forms.office.com/Pages/ResponsePage.aspx?id=8frLNKZngUepylFOslULZlFZdbyVx8RLiPt1GobhHnlUMExGOVA0TUROVklLUlhKSUtaN0ZKS1UzNS4u)

```python
def foo1(x = 7):
	return x ** 0.5
```

```python
def foo2(x = 3, y = 5):
	if x > y:
		return x
	return y
```

```python
def foo3(x = 2, y = 0, z = 9):
	if x > y:
		tmp = y
		y = x
		x = tmp
	if y > z:
		tmp = z
		z = y
		y = tmp
	if x > y:
		tmp = y
		y = x
		x = tmp
	return [x, y, z]
```

```python
def foo4(x = 6):
	result = 1
	for i in range(1, x + 1):
		result = result * i
	return result
```

```python
def foo5(x = 1729):
	d = 2
	myfactors = []
	while x > 1:
		if x % d == 0:
			myfactors.append(d)
			x = x / d
		else:
			d = d + 1
	return myfactors
```

```python
def foo6(x = 25):
	if x == 1:
		return 1
	return x * foo6(x - 1)
```

```python
def foo7(x = 100):
	myp = [2]
	for i in range(3, x + 1):
		success = False
		for j in myp:
			if i % j == 0:
				success = True
				break
		if success == False:
			myp.append(i)
	return myp
```


#### 4.2.2 Importing Packages and Modules

*Modules* are single files that contain multiple functions.

*Packages* are collections of modules and can be imported into python to save you a lot of time. Last week we used the csv package.

There are 4 different ways to to load a module. Below we will use generic terms like themodule, thefunction 
	* `import themodule`
	* `from themodule import thefunction`
	* `import themodule as mm`
		* gives the module the name mm
	* `from themodule import *`

You should definitely create your own modules to save you time.


#### 4.2.3 Program Structure

When writing more complex programs, it is imperative to break them down into managable pieces that can be easily debugged, tested, and maintained.

We are going to simulate population of N monoecious, diploid, organisms.  We will focus on a gene with two alleles, A and a. 
* To initialize the population, each individual will be assigned an A with probability p and a with probability of 1-p. 
* At the end of each generation, individuals will randomly mate and die after reproducing.  
* The popualtion size will remain stable and there will be no mutations.

Once it is made, we can use the simulation to investigate genetic drift.

To make the simulation, we will create functions, then use a "master" program to call the functions and orchestrate the simulation.

The first step is not coding, it is strategizing and developing a plan of attack in plain English
* Need a function to initialize the population
	* inputs: popsize, prob of A
	* returns: a list containing each diploid indiviudal.  e.g, [AA,AA,Aa,aa]
* Need a function to compute genotypic frequencies 
	* Inputs: the population
	* Outputs: the count for each genotype
* Need a reproduction function that 
	* Inputs: current generation 
	* Outputs: the next generation

The second step is choosing data structures.
* Population: list of tuples [("A", "a"), ("A", "A")]

The third step is identifying modules that can be useful
* `SciPy`

We begin by building the population initialization function in our text editor, then test it in the python3 terminal

```python
# import scipy
import scipy

# make function to build population
def build_population(N, p):
	"""The population consists of N individuals.
		Each individual has two chromosomes, containing
		allele "A" or "a", with probability p or 1-p,
		respectively.
		The population is a list of tuples.
	"""
	population = []
	for i in range(N):
		allele1 = "A"
		if scipy.random.rand() > p:
			allele1 = "a"
		allele2 = "A"
		if scipy.random.rand() > p:
			allele2 = "a"
		population.append((allele1, allele2))
	return population

```

Test the function by copying it from text editor and pasting it into python3 terminal then running the following code

```python
>>> build_population(N = 10, p = 0.7)
[('A', 'A'), ('A', 'A'), ('a', 'A'), ('A', 'A'), ('A', 'a'), ('a', 'a'), ('a', 'a'), ('A', 'a'), ('A', 'a'), ('A', 'a')]
```

Next we build the function that computes genotype frequencies 

```python
def compute_frequencies(population):
	""" Count the genotypes.
		Returns a dictionary of genotypic frequencies.
	"""
	AA = population.count(("A", "A"))
	Aa = population.count(("A", "a"))
	aA = population.count(("a", "A"))
	aa = population.count(("a", "a"))
	return({"AA": AA,
		"aa": aa,
		"Aa": Aa,
		"aA": aA})

```

Test the genotype function

```python
>>> my_pop = build_population(6, 0.5)
>>> my_pop
[('a', 'A'), ('A', 'A'), ('a', 'A'), ('a', 'a'), ('A', 'A'), ('A', 'a')]
>>> compute_frequencies(my_pop)
{'AA': 2, 'aa': 1, 'Aa': 1, 'aA': 2}
```

Build the reproduction fuction

```python
def reproduce_population(population):
	""" Create new generation through reproduction
		For each of N new offspring,
		- choose the parents at random;
		- the offspring receives a chromosome from
		each of the parents.
	"""
	new_generation = []
	N = len(population)
	for i in range(N):
		dad = scipy.random.randint(N)
		mom = scipy.random.randint(N)
		chr_mom = scipy.random.randint(2)
		offspring = (population[mom][chr_mom], population [dad][1 - chr_mom])
		new_generation.append(offspring)
	return(new_generation)
	
```

And test it

```python
>>> reproduce_population(my_pop)
[('A', 'A'), ('a', 'A'), ('A', 'A'), ('A', 'a'), ('A', 'A'), ('A', 'A')]
```

*Phew!!!  (out of breath)  *

Save your module (the file with the functions we just made) into a file called `drift.py`. There is also a copy of this file in `~/CSB/good_code/solutions`.  

Exit python and copy drift.py to your sandbox.

```bash
cd ~/CSB/good_code/sandbox
cp ../solutions/drift.py .
python3
```

In your text editor, open a new document for making the master program that uses the functions we just made to simulate the population.

Now we begin by importing our drift.py module

```python
import drift
```

and test that it worked

```python
>>> import drift
>>> help(drift)
```

Write the main code:

```python
import drift
def simulate_drift(N, p):
	my_pop = drift.build_population(N, p)
	fixation = False
	num_generations = 0
	while fixation == False:
		genotype_counts = drift.compute_frequencies (my_pop)
		if genotype_counts["AA"] == N or genotype_counts["aa"] == N:
			print("An allele reached fixation at generation",
			num_generations)
			print("The genotype counts are")
			print(genotype_counts)
			fixation == True
			break
		my_pop = drift.reproduce_population(my_pop)
		num_generations = num_generations + 1

```

test it

```python
>>> simulate_drift(100, 0.5)
An allele reached fixation at generation 713
The genotype counts are
{'AA': 0, 'aa': 100, 'Aa': 0, 'aA': 0}

>>> simulate_drift(100, 0.9)
An allele reached fixation at generation 45
The genotype counts are
{'AA': 100, 'aa': 0, 'Aa': 0, 'aA': 0}
```

### 4.3 Writing Style

Code is read more than it is written, and you should be thinking about the reader when writing your code (as well as your assignments for your courses and theses, and publications)

Read ch 4.3.  here is where I disagree:

* Use tabs for indenting (I know this is the opposite of the book), it will reduce variation in size of indents


### 4.4 Python from Command Line

Let us make our pop sim program executable. First save it to a file called simulate_drift.py in your sandbox.

Next modify it as follows

```python
#!/usr/bin/python3

import sys
import drift

def simulate_drift(N, p):
        my_pop = drift.build_population(N, p)
        fixation = False
        num_generations = 0
        while fixation == False:
                genotype_counts = drift.compute_frequencies (my_pop)
                if genotype_counts["AA"] == N or genotype_counts["aa"] == N:
                        print("An allele reached fixation at generation",
                        num_generations)
                        print("The genotype counts are")
                        print(genotype_counts)
                        fixation == True
                        break
                my_pop = drift.reproduce_population(my_pop)
                num_generations = num_generations + 1

if __name__ == "__main__":
        N = int(sys.argv[1])
        p = float(sys.argv[2])
        simulate_drift(N, p)
```

Make simulate_drift.py executable

```bash
chmod 700 simulate_drift.py
```

and then test it

```python
./simulate_drift.py 1000 0.1
python simulate_drift.py 1000 0.1
```

---


## HOMEWORK
Assignment 7  Due 10/25  Finish Ch 4 and intermezzos

