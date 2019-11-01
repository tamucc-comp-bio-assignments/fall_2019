# Lecture 9: Scientific Computing, Ch 6

########################
Copy and paste blurb from end of lecture 8 here.
###########################

## 6.2 Programming with `NumPy` & `SciPy`

These packages are typically used in concert and imported together.  Here we will start by importing `NumPy` and name it `np`

```python
>>> import numpy as np
>>>```

`NumPy` provides an `array` data structure.  An array can be one or more dimensions

* 1d: vector
* 2d: matrix
* 3d or more: tensor

`np.arrange()` can be used to create a 1d array that is similar to a list

```python
>>> a = np.arange(9)
>>> a
array([0, 1, 2, 3, 4, 5, 6, 7, 8])
```

While arrays look superficially similar to lists, they behave very differently when used in arithmetic expressions:

```python
# list
>>> al = list(range(9))
>>> al
[0, 1, 2, 3, 4, 5, 6, 7, 8]
>>> al * 2
[0, 1, 2, 3, 4, 5, 6, 7, 8, 0, 1, 2, 3, 4, 5, 6, 7, 8]

#array
>>> 2 + a
array([ 2,  3,  4,  5,  6,  7,  8,  9, 10])

# you cannot add 2 to a list
>>> 2 + al
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: unsupported operand type(s) for +: 'int' and 'list'
```

Arrays have many attributes and functions.  Here are some:

```python
# length along each dimension
>>> a.shape
(9,)

# number of dimensions
>>> a.ndim
1

# data type of content
>>> a.dtype.name
'int64'

# number of elements
>>> a.size
9
>>>
```

Here are some examples of arithmetic and statistical methods associated with arrays

```python
>>> a.sum()
36
>>> a.mean()
4.0
>>> a.std()
2.581988897471611
>>> a.min()
0
>>> a.max()
8
>>>
```

Here are some examples of arithmetic and statistical NumPy methods that can be applied to arrays

```python
# sqrt each number in array
>>> np.sqrt(a)
array([0.        , 1.        , 1.41421356, 1.73205081, 2.        ,
       2.23606798, 2.44948974, 2.64575131, 2.82842712])

# e^ each number in an array, where e is the constant 2.718...
>>> np.exp(a)
array([1.00000000e+00, 2.71828183e+00, 7.38905610e+00, 2.00855369e+01,
       5.45981500e+01, 1.48413159e+02, 4.03428793e+02, 1.09663316e+03,
       2.98095799e+03])
>>>
```



```python
# convert list to one-dimensional array (aka a vector)
>>> a1 = np.array([1, 2, 3, 4])
>>> print(a1)
[1 2 3 4]
>>> a1.dtype.name
'int64'

>>> a1 = np.array([1.0, 2.0, 3.0, 4.0])
>>> print(a1)
[1. 2. 3. 4.]
>>> a1.dtype.name
'float64'

# convert a list of lists into a 2d array (aka a matrix)
>>> m = np.array([[1, 2], [3, 4]])
>>> m
array([[1, 2],
       [3, 4]])

# specify the data type in the 2d array
>>> m = np.array([[1, 2], [3, 4]], dtype = float)
>>> print(m)
[[1. 2.]
 [3. 4.]]
>>>
```

Arrays can be created, or initialized with set properties

```python
# create 3x2 array filled with 0.0 (floating-point)
>>> m.dtype.name
'float64'
>>> m = np.zeros((3, 2), dtype = float)
>>> m
array([[0., 0.],
       [0., 0.],
       [0., 0.]])
>>>

# create 2x3 array filled with 1+0i (complex numbers)
>>> m = np.ones((2, 3), dtype = complex)
>>> m
array([[1.+0.j, 1.+0.j, 1.+0.j],
       [1.+0.j, 1.+0.j, 1.+0.j]])
>>>

# create an array containing the integers from 0 to 8 and arrange it in a 3x3 array
>>> a = np.arange(9)
>>> a.reshape((3,3))
array([[0, 1, 2],
       [3, 4, 5],
       [6, 7, 8]])
>>>

# create an array with random values drawn from uniform distribution U[0,1]
>>> np.random.random((2, 3))
array([[0.75076835, 0.91614084, 0.81553323],
       [0.34772304, 0.8271986 , 0.46484672]])
>>>
```

The elements of arrays are indexed, just like lists, allowing you to interact with specific values in the array

```python
>>> a
array([0, 1, 2, 3, 4, 5, 6, 7, 8])
>>> a[1]
1
>>> a[:4]
array([0, 1, 2, 3])
>>> a[-3:]
array([6, 7, 8])
>>>
```

Here is an example with a 2d array

```python
#create 2d array
>>> m = np.arange(16).reshape((4, 4))
>>> m
array([[ 0,  1,  2,  3],
       [ 4,  5,  6,  7],
       [ 8,  9, 10, 11],
       [12, 13, 14, 15]])

# extract submatrix
>>> m[0:3, 1:4]
array([[ 1,  2,  3],
       [ 5,  6,  7],
       [ 9, 10, 11]])

# this is the second row
>>> m[1]
array([4, 5, 6, 7])

# this is the second column
>>> m[:, 1]
array([ 1,  5,  9, 13])
>>>
```

With 2d arrays arithmetic functions can be applied by row or column

```python
# sum whole matrix
>>> m.sum()
120

# sum by column
>>> m.sum(axis = 0)
array([24, 28, 32, 36])

# sum by row
>>> m.sum(axis = 1)
array([ 6, 22, 38, 54])
>>>
```

The `NumPy` function `loadtxt` can be used to read in data from a file, such as a csv

```python
# this is pseudocode, do not type it in
m = np.loadtxt("my_matrix_file.csv", delimiter = ",")

# as always, you can use the help function to learn more about other functions, such as `loadtxt`
>>> help(np.loadtxt)
Help on function loadtxt in module numpy:

loadtxt(fname, dtype=<class 'float'>, comments='#', delimiter=None, converters=None, skiprows=0, usecols=None, unpack=False, ndmin=0, encoding='bytes', max_rows=None)
    Load data from a text file.

    Each row in the text file must have the same number of values.

    Parameters
    ----------
    fname : file, str, or pathlib.Path
        File, filename, or generator to read.  If the filename extension is
        ``.gz`` or ``.bz2``, the file is first decompressed. Note that
        generators should return byte strings for Python 3k.
    dtype : data-type, optional
        Data-type of the resulting array; default: float.  If this is a
        structured data-type, the resulting array will be 1-dimensional, and
        each row will be interpreted as an element of the array.  In this
        case, the number of columns used must match the number of fields in
        the data-type.
    comments : str or sequence of str, optional
        The characters or list of characters used to indicate the start of a
        comment. None implies no comments. For backwards compatibility, byte
        strings will be decoded as 'latin1'. The default is '#'.
```

### Example: Image processing with NumPy

[Kacsoh et al. (2013)](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3760715/) investigated a behavioral immune response
in Drosophila melanogaster. Female flies lay their eggs in alcohol-laden food when confronted with parasitic wasps so that their offspring are protected from infection by the wasps. This change in oviposition behavior is mediated by neuropeptide F (NPF) and its receptor (NPFRl) in fly brains. Coupled to a reporter gene, NPF and NPFRl can be visualized by confocal microscopy.

![alt text](
https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3760715/figure/F1/?report=objectonly "figure 1")


Here we use `NumPy` for image processing.  An image is typically stored as a 3d numerical array:  

* height (y)
* width (x)
* color (z)

The color dimension can be composed of Red, Green, and Blue (RGB) with each channel containing an integer between 0 and 255, where 0 is the absence of color and 255 is the fully saturated color.

We will use functions from `NumPy`, 2 image analysis functions from the `scikit-image` library, aka `skimage`
* `io.imread` - reads an image into an array
* `io.imshow` - visualize an image
, and the matplotlib to visualize the images.  

Before we start, you should navigate to the sandbox for this chapter.

```bash
$ cd ~/CSB/scientific/sandbox
```

Now let us start working in python:

```python
>>> import numpy as np
>>> import skimage.io as io
>>> import matplotlib as mpl

# read in image, and note that it is an array
>>> image = io.imread("../data/Kacsoh2013_Drosobrain.png")
>>> type(image)
<class 'imageio.core.util.Array'>

# for windows-unbuntu folks, turn on the windows app, `Xming` for the next lines of code to work.  Recall that we installed this in lecture 0

# load image, this will cause quite a bit of error output
>>> io.imshow(image)
QStandardPaths: XDG_RUNTIME_DIR not set, defaulting to '/tmp/runtime-cbird'
failed to get the current screen resources
<matplotlib.image.AxesImage object at 0x7f103b7a6080>
>>> QXcbConnection: XCB error: 170 (Unknown), sequence: 170, resource id: 90, major code: 146 (Unknown), minor code: 20

# hit enter key to move forward
# visualize the image
>>> mpl.pyplot.show()
```

![alt text](https://github.com/tamucc-comp-bio/fall_2019/tree/master/lectures/Week09_files/Capture.PNG "image 1")


```python
#note the dimensions of the image, the first two numbers represent the height and width, in pixels, respectively
>>> image.shape
(1024, 1024, 4)

# view characteristics of Red color channel
>>> image[:,:,0]
Array([[ 9,  4,  6, ..., 24,  9,  4],
       [21, 10, 10, ..., 16, 20,  6],
       [ 7, 13, 13, ...,  8,  5, 26],
       ...,
       [ 5,  7,  6, ..., 12,  4, 14],
       [ 3, 24,  4, ...,  5, 10,  3],
       [ 9,  8,  8, ..., 11,  9,  6]], dtype=uint8)
>>> red = image[:,:,0]
>>> red.mean()
23.1810245513916
>>> red.std()
30.44674082199301
>>> red.min()
0
>>> red.max()
255
>>>

# green color channel
>>> green = image[:,:,1]
>>> green.mean()
0.0

```

The images only contain red coloration because of the filters on the confocal microscope.

We can count the number of red pixels, ie those exhibiting NPF and NPFR1 expression. While there are sophisticated methods to determine the background of an image, here we take the simplest approach and choose an arbitrary threshold of 100 (i.e., intensities below 100 are considered noise, all pixels with a value above this threshold are considered "red" or "expressed"). We can visually inspect how this threshold compares to the rest of the image by setting a part of our picture to 100:

```python
# create a copy of the image
>>> img_copy = image.copy()
# use Python slicing to change color values of part of the red channel in the image
>>> img_copy[:, 480:500, 0] = 100
>>> io.imshow(img_copy)
<matplotlib.image.AxesImage object at 0x7f103b7a6d30>
>>> mpl.pyplot.show()
```

![alt text](https://github.com/tamucc-comp-bio/fall_2019/tree/master/lectures/Week09_files/Capture2.PNG "image 2")

We now create a new array where we select only pixels that exceed the threshold, and then count their number:

```python
>>> threshold = 100
>>> mask = red > threshold
>>> mask.sum()
37037
>>> io.imshow(mask)
<matplotlib.image.AxesImage object at 0x7f103b7c31d0>
>>> mpl.pyplot.show()
```

There are 37,037 pixels above the threshold and that the expression of NPF and NPFR1 is spatially localized
![alt text](https://github.com/tamucc-comp-bio/fall_2019/tree/master/lectures/Week09_files/Capture3.PNG "image 3")

Using the mask (i.e., setting every pixel to either 0 or 1), we lost the information on the intensity of individual pixels (i.e., strength of expression signal). However, we can show the pixels above the threshold along with their intensity by calling

```python
>>> mask2 = red * (red > threshold)
>>> mask2.sum()
4855070
>>> io.imshow(mask2)
<matplotlib.image.AxesImage object at 0x7f103b7a6630>
>>> mpl.pyplot.show()
```

![alt text](https://github.com/tamucc-comp-bio/fall_2019/tree/master/lectures/Week09_files/Capture3.PNG "image 3")

We have developed a quantitative measure of NPF/NPFR1 expression from confocal images and this can now be easily automated and applied to many images.  This could be used to compare expression in different treatments.

### 6.2.2 Random Numbers and Distributions

```python
>>> import numpy as np
>>> np.random.random(2)
array([0.38602011, 0.87405868])
>>> np.random.random_integers(5, size = 10)
__main__:1: DeprecationWarning: This function is deprecated. Please call randint(1, 5 + 1) instead
array([5, 3, 2, 3, 5, 2, 2, 4, 3, 2])
```

Here is an unplanned, teachable moment.  When a function is depricated, it means that it has been replaced and is no longer supported.  Here, we get some information, but not an exact solution.  It is up to us to figure out how to implement `randint()`.  If you have trouble, and quick internet search should work.  Here I used quick trial and error to figure out that this is the new implementation of the line of code from the book:

```python
>>> np.random.randint(5, size =10)
array([1, 0, 0, 2, 1, 2, 0, 2, 0, 0])

>>> np.random.randint(-5, -3, size = 4)
array([-4, -4, -4, -5])
>>> a = np.arange(4)
>>> a
array([0, 1, 2, 3])

>>> np.random.shuffle(a)
>>> a
array([1, 0, 2, 3])
>>>

np.random.beta(1/2, 1/2, 4)
np.random.standard_normal(size = 3)
np.random.normal(10, 0.1, 4)
mus = [1, 3]
cov = [[1, 0.3], [0.4, 2]]
np.random.multivariate_normal(mus, cov, 3)

print(np.random.random(1))
print(np.random.random(1))
np.random.seed(10)
print(np.random.random(1))
print(np.random.random(1))
np.random.seed(10)
print(np.random.random(1))
print(np.random.random(1))
```

6.2.3 Linear Algebra

```python
import numpy as np
import scipy
import scipy.linalg
M = scipy.random.random((3, 3))
M
scipy.linalg.eigvals(M)
scipy.linalg.det(M)
scipy.linalg.inv(M)
np.dot(M, scipy.linalg.inv(M))
```

6.2.4 Integration and Dierential Equations

```python
import numpy as np
import scipy.integrate
def integrand(x):
return ((x ** 2 - x) ** 4) / (1 + x ** 2)
my_integral = scipy.integrate.quad(integrand, 0, 1)
my_integral
22 / 7 - my_integral[0]
```



```python
import numpy as np
import scipy
import scipy.integrate
def Gompertz(x, t, alpha, K):
dxdt = x * alpha * np.log(K / x)
return dxdt
x0 = 0.1
alpha = 1 / 2
K = 5
ts = np.arange(0, 10, 0.05)
y = scipy.integrate.odeint(Gompertz, x0, ts, args = (alpha, K))
import matplotlib.pyplot as plt
plt.plot(ts, y[:,0])
plt.xlabel("Time")
plt.ylabel("x(t)")
plt.show()
%matplotlib inline
import matplotlib.pyplot as plt
plt.plot(t, x[:, 0], label = "x1")
plt.plot(t, x[:, 1], label = "x2")
plt.plot(t, x[:, 2], label = "x3")
plt.legend(loc = "best")
plt.xlabel("t")
plt.grid()
plt.show()
```

6.2.5 Optimization

```python
import numpy as np
import scipy.optimize
def my_eq(Sinf, a, r):
return np.exp(-Sinf / (a / r)) - Sinf

my_eq(0.6, 0.16, 1/13)
my_eq(0.7, 0.16, 1/13)
my_eq(0.71, 0.16, 1/13)
scipy.optimize.root(my_eq, 0.01, args=(0.16, 1 / 13))

```


## 6.3 Working with `pandas`

`pandas` is the Python Data Analysis Library, introducing a data structure simi-11lar to the data. frame in R. `pandas` provides two main data structures: 
* Series, meant to store a one-dimensional array, and 
* DataFrame, which contains data organized in rows and columns, as in a spreadsheet. 
The data stored in a Series are all of the same type; in a Data Frame, each column can be of a different type. `pandas` provides useful functions to manipulate data sets, calculate statistics, and plot results.

For our testing, we are going to import a . csv file containing a "plumage score" for male and female birds of several species. The method and the data are from Dale et al. (2015). Using pandas, we are going to import the file (start Jupyter from your `~CSB/scientific/sandbox` directory):

```python
>>> import pandas
>>> import numpy as np
>>> data = pandas.read_csv("../data/Dale2015_data.csv")
```

This function creates a DataFrame object, made of rows and columns.
You can specify the delimiter ( e.g., sep = ";" for semicolon), change the text encoding (e.g., encoding = "latin1"), etc. The function `pandas.read_excel` allows you to import Excel files directly into Python. 

Use the attribute shape to determine the numbers of rows and columns of the Data Frame:

```python
>>> data.shape
(5831, 5)
```

To see the first few rows in your data set, use the method head. Equivalently, tail returns the last few lines. To access the names of the columns, type:

```python
>>> data.columns
Index(['Scientific_name', 'English_name', 'TipLabel', 'Female_plumage_score',
       'Male_plumage_score'],
      dtype='object')
>>>
```

which returns an Index object with the column labels. You can combine columns to create new columns:

```python
>>> data["Sum_scores"] = data["Female_plumage_score"] + data["Male_plumage_score"]
>>> data.head()
            Scientific_name              English_name  ... Male_plumage_score  Sum_scores
0    Abroscopus albogularis      Rufous-faced Warbler  ...          51.944444   97.777778
1    Abroscopus schisticeps       Black-faced Warbler  ...          47.777778   96.666667
2  Abroscopus superciliaris    Yellow-bellied Warbler  ...          43.611111   86.805556
3  Acanthagenys rufogularis  Spiny-cheeked Honeyeater  ...          39.166667   78.472222
4       Acanthidops bairdii          Peg-billed Finch  ...          54.166667   94.722222

[5 rows x 6 columns]
>>>
```

You can also create a new column with a single operation:

```python
# add a column with a constant
>>> data["Study"] = 1
>>> data.head()
            Scientific_name              English_name  ... Sum_scores  Study
0    Abroscopus albogularis      Rufous-faced Warbler  ...  97.777778      1
1    Abroscopus schisticeps       Black-faced Warbler  ...  96.666667      1
2  Abroscopus superciliaris    Yellow-bellied Warbler  ...  86.805556      1
3  Acanthagenys rufogularis  Spiny-cheeked Honeyeater  ...  78.472222      1
4       Acanthidops bairdii          Peg-billed Finch  ...  94.722222      1

[5 rows x 7 columns]

# use NumPy function to add a column of random numbers
# shape[0] provides the number of rows
>>> data["Rnd"] = np.random.random(data.shape[0])
>>> data.head()
            Scientific_name              English_name  ... Study       Rnd
0    Abroscopus albogularis      Rufous-faced Warbler  ...     1  0.277765
1    Abroscopus schisticeps       Black-faced Warbler  ...     1  0.178028
2  Abroscopus superciliaris    Yellow-bellied Warbler  ...     1  0.558369
3  Acanthagenys rufogularis  Spiny-cheeked Honeyeater  ...     1  0.871557
4       Acanthidops bairdii          Peg-billed Finch  ...     1  0.326340

[5 rows x 8 columns]
```

To remove columns from the data, use del or drop:

```python
# remove a single column
>>> del(data["Sum_scores"])
>>> data.head()

# remove multiple columns
>>> data.drop(["Rnd", "Study"], axis = 1, inplace = True)
>>> data.head()
```

A method with option axis = 1 will act along columns, while axis = 0 acts along rows. The argument inplace = True means that the columns are removed directly and irrevocably from the data.
There are several ways of accessing data in a DataF rame: by column label, row index number, or specific x,y locations:

```python
# select data by column label
# select first three rows of output
# remember: noninclusive, 0-based indexing;
# row "3" is not included!
>>> data["Scientific_name"][:3]
0      Abroscopus albogularis
1      Abroscopus schisticeps
2    Abroscopus superciliaris
Name: Scientific_name, dtype: object

# column names can be specified using a dot
>>> data.Scientific_name[:3]
0      Abroscopus albogularis
1      Abroscopus schisticeps
2    Abroscopus superciliaris
Name: Scientific_name, dtype: object
```

The DataFrame methods loc and iloc select specific rows and columns without chaining multiple selections ( e.g., data[ column] [row] as seen above). While loc uses row and column labels for selection, iloc expects integers that correspond to the positions of rows and columns:

```python
# select rows by index label
# the row named "3" is included!
# select columns by their label
# (multiple labels within list)
>>> data.loc[:3, ["Scientific_name", "English_name"]]
            Scientific_name              English_name
0    Abroscopus albogularis      Rufous-faced Warbler
1    Abroscopus schisticeps       Black-faced Warbler
2  Abroscopus superciliaris    Yellow-bellied Warbler
3  Acanthagenys rufogularis  Spiny-cheeked Honeyeater


# select rows with Scientific_name Zosterops mouroniensis
>>> data.loc[data.Scientific_name == "Zosterops mouroniensis"]
             Scientific_name  ... Male_plumage_score
5801  Zosterops mouroniensis  ...               47.5

[1 rows x 5 columns]


# select subset by x,y position (zero-based!)
# select third row, second column
>>> data.iloc[2, 1]
'Yellow-bellied Warbler'
```

We can even select rows based on only part of the cell content:

```python
# select the column Scientific_name of all rows that
# contain "Bowerbird" in column English_name;
# show first three rows of output
>>> data[data.English_name.str.contains("Bowerbird")]["Scientific_name"][:3]
188      Amblyornis flavifrons
189        Amblyornis inornata
190    Amblyornis macgregoriae
Name: Scientific_name, dtype: object
```

Having shown how to select particular columns, we show how to filter rows based on their content:

```python
# select rows with Male_plumage_score larger than 65
>>> high_male_score = data[data["Male_plumage_score"] > 65]
```

You can also concatenate multiple conditions with Boolean operators; for example, we extract highly sexually dimorphic species by finding those in which males have a high plumage score, and females have a low score:

```python
>>> highly_dimorphic = data[(data.Male_plumage_score > 70) & (data.Female_plumage_score < 40)]
```

One important feature of pandas is that many commands return a view, as opposed to a copy of the data. A simple example:

```python
>>> high_male_score["Qualitative_score"] = "High"
__main__:1: SettingWithCopyWarning:
A value is trying to be set on a copy of a slice from a DataFrame.
Try using .loc[row_indexer,col_indexer] = value instead

See the caveats in the documentation: http://pandas.pydata.org/pandas-docs/stable/indexing.html#indexing-view-versus-copy
```

pandas raises a warning because high_male_score is not a new Data Frame, independent of data; rather, it is a view of a "slice" of the original data. While the behavior of this command is what you would expect (the column Qualitative_score is added to high_male_score, but not to data), this is not the correct way to proceed. When you want to take a subset of the data, and separate it from the original data, you need to copy it:

```python
>>> high_male_score = data[data["Male_plumage_score"] > 65].copy()
>>> high_male_score["Qualitative_score"] = "High"
```

The reason behind this behavior is that pandas can be used to analyze large data sets. In most cases, you want to take a subset to perform some operations that do not alter the data-in which case copying the data by default would be costly in terms of memory. Unsurprisingly, the idea of views is taken from databases (covered in chapter 10), where it arises for the exact same reason.

Once you have selected your data, it is easy to calculate summary
statistics:

```python
>>> data.Male_plumage_score.mean()
51.00918939004283
>>> data.Male_plumage_score.median()
49.72222222
>>> data.Male_plumage_score.std()
8.200662934673714
```

A useful feature is that you can produce nice plots for exploratory analysis. If you have not done it already, load the Matplotlib library and type

```python
>>> import matplotlib as mpl
>>> data.Male_plumage_score.hist()
<matplotlib.axes._subplots.AxesSubplot object at 0x7f9a3f2ecbe0>
>>> mpl.pyplot.show()
```

Hopefully, you see this:
![alt text](https://github.com/tamucc-comp-bio/fall_2019/tree/master/lectures/Week09_files/Capture5.PNG "image 5")

Similarly, to produce a scatter plot, use

```python
>>> data.plot.scatter(x = "Male_plumage_score", y = "Female_plumage_score")
<matplotlib.axes._subplots.AxesSubplot object at 0x7f9a3f3a6588>
>>> mpl.pyplot.show()
```

![alt text](https://github.com/tamucc-comp-bio/fall_2019/tree/master/lectures/Week09_files/Capture6.PNG "image 6")

To draw a box plot displaying the distributions of plumage scores for males and females, type

```python
data[["Male_plumage_score", "Female_plumage_score"]].plot.box()
```


## 6.4 Biopython

### 6.4.1 Retrieving Sequences from NCBI

```python
from Bio import Entrez
Entrez.email = "me@bigu.edu"
handle = Entrez.esearch(
db = "nuccore",
term = ("Uropsilus investigator[Organism]"))
record = Entrez.read(handle)
handle.close()
record.keys()
dict_keys(['Count', 'RetMax', 'RetStart', 'IdList', 'TranslationSet', '
TranslationStack', 'QueryTranslation'])
record["Count"]
id_list = record["IdList"]
print(id_list)
Entrez.email = "me@bigu.edu"
handle = Entrez.efetch(db = "nuccore",
rettype = "fasta",
retmode = "text",
id = id_list[:10])
out_handle = open("Uropsilus_seq.fasta", "w")
for line in handle:
out_handle.write(line)
out_handle.close()
handle.close()
```

### 6.4.2 Input and Output of Sequence Data Using SeqIO

```python
from Bio import SeqIO
handle = open("Uropsilus_seq.fasta", "r")
for record in SeqIO.parse(handle, "fasta"):
print(record.description)
print(len(record))
handle.close()
import re
output_handle = open("Uropsilus_BMI1.fasta", "w")
for record in SeqIO.parse("Uropsilus_seq.fasta", "fasta"):
if re.search("BMI1", record.description):
print(record.id)
short_seq = record[:100]
SeqIO.write(short_seq, output_handle, "fasta")
output_handle.close()
```

### 6.4.3 Programmatic BLAST Search

```python
from Bio.Blast import NCBIWWW
handle = open("Uropsilus_BMI1.fasta", "r")
records = list(SeqIO.parse(handle, "fasta"))
print(records[3].id, " ", records[3].seq)
Entrez.email = "me@bigu.edu"
result_handle = NCBIWWW.qblast("blastn", "nt", records[3].seq)
save_file = open("my_blast.xml", "w")
save_file.write(result_handle.read())
save_file.close()
result_handle.close()
```



```python
from Bio.Blast import NCBIXML
result_handle = open("my_blast.xml")
blast_records = NCBIXML.read(result_handle)
E_VALUE_THRESH = 0.04
for alignment in blast_records.alignments:
for hsp in alignment.hsps:
if hsp.expect < E_VALUE_THRESH and alignment.length > 3000:
print("****Alignment****")
print("sequence:", alignment.title)
print("length:", alignment.length)
print("E value:", hsp.expect)
print(hsp.query[0:75] + "...")
print(hsp.match[0:75] + "...")
print(hsp.sbjct[0:75] + "...")
```


### 6.4.4 Querying PubMed for Scientific Literature Information

```python
Entrez.email = "me@bigu.edu"
handle = Entrez.esearch(
db = "pubmed",
term = ("spaetzle[Title/Abstract] AND Drosophila[ALL]"),
usehistory = "y")
record = Entrez.read(handle)
handle.close()
record["Count"]
'13'
webenv = record["WebEnv"]
query_key = record["QueryKey"]
```



```python
Entrez.email = "me@bigu.edu"
handle = Entrez.efetch(db = "pubmed",
rettype = "medline",
retmode = "text",
webenv = webenv,
query_key = query_key)
out_handle = open("Spaetzle_abstracts.txt", "w")
data = handle.read()
handle.close()
out_handle.write(data)
out_handle.close()
import re
with open("Spaetzle_abstracts.txt") as datafile:
pubmed_input = datafile.read()
pubmed_input = re.sub(r"\n\s{6}", " ", pubmed_input)
for line in pubmed_input.split("\n"):
if re.match("PMID", line):
PMID = re.search(r"\d+", line).group()
if re.match("AB", line):
spaetzle = re.findall(r"([^.]*?Spaetzle[^.]*\.)", line)
if spaetzle:
print("PubMedID: ", PMID, " ", spaetzle)
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



```python

```



```python

```



```python

```


