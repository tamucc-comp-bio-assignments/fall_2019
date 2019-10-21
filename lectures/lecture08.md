# Week08 Python Boot Camp II: Writing Good Code II

### [Assignment5](https://github.com/tamucc-comp-bio/fall_2019/blob/master/assignments/assignment_5.md) is due at the beginning of this lecture


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

### 4.5 Writing Code for Science

*_FILL THIS IN_*

### 4.6 Debugging

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
def get_expected_sqrt_abs_x(distribution = "uniform",
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

If you've done it correctly, it should not return anything

```python
>>> def get_expected_sqrt_abs_x(distribution = "uniform",
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
...             total = total + sqrt(abs(z))
...     return total / sample_size
...
>>>
```


```python

```
```python

```
```python

```
```python

```
```python

```
```python

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

