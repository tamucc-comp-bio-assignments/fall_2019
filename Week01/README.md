# Week01 UNIX

### [Assignment 0](https://github.com/comp-bio-fall-2019/Week00/blob/master/assignment_0.md) is due at the beginning of this lecture

## [Lecture 01 Slides](https://github.com/comp-bio-fall-2019/Week01/blob/master/Lecture01_WelcomeToTheMatrix.pdf)

## Computer Preparation
* Win10
  * Log into your Ubuntu terminal.  _We will not use `gitbash` unless you can't get Ubuntu running._

  * If you are using an Ubuntu terminal that hasn't been setup (you'll know because it will ask you to create a new user name and password), then follow the instructions [here](https://github.com/cbirdlab/wlsUBUNTU_settings/blob/master/README.md) to set it up. Note that I have automated the process and you should be able to complete it in less than a minute.

* MacOS

  * Open a terminal window

  * Consider installing [homebrew](https://brew.sh/).  You will be able to use homebrew to install linux software, such as `tree`, which is used in the slide show.

## Text Book Vs. Lecture Slides
The [**Lecture_01 Slides**](https://github.com/comp-bio-fall-2019/Week01/blob/master/Lecture01_WelcomeToTheMatrix.pdf) closely follow the book but there is some additional information that is not provided in the book (and vice versa). In the lecture slides, the `code blocks` are represented by green text on a black background, mimicking the terminal.

* **Use _BodyMass.csv_ (slides) rather than _BodyM.csv_ (book)**

* Page 46, the script on the bottom half of the page is poor form. Making a bunch of tmp files is a bad idea.  Do this instead:
```
#!/bin/bash

# to run do this:
# ./ExtractBodyM.sh [infile] [outfile]

# isolate columns 2-6 of csv (first argument) using cut
# translate the ; to “ “ using tr
# remove the header row using tail
# sort by sixth column, descending order
# save to file (second argument)

# isolate columns 2-6 of csv (first argument) using cut
cut -d ";" -f 2-6 $1 | \
 # translate the ; to “ “ using tr
	tr ";" " " | \
 # remove the header row using tail
	tail -n+2 | \
 # sort by sixth column, descending order
 # save to file (second argument)
	sort -nrk6 > $2
```

## IN CLASS EXERCISES

* [CSB Mind Expander 01.01](https://forms.office.com/Pages/ResponsePage.aspx?id=8frLNKZngUepylFOslULZlFZdbyVx8RLiPt1GobhHnlUM1FFUUZLT01LR0ZGODU2WVNSV1c0NEpWMi4u)

* [CSB Mind Expander 01.02](https://forms.office.com/Pages/ResponsePage.aspx?id=8frLNKZngUepylFOslULZlFZdbyVx8RLiPt1GobhHnlUM0VSMlJZMFg2VzlNNjZVUTJINk9TRlBSOC4u)

* [CSB Mind Expander 01.03](https://forms.office.com/Pages/ResponsePage.aspx?id=8frLNKZngUepylFOslULZlFZdbyVx8RLiPt1GobhHnlUOThBNjZNVzlGQUtJUzhYREZVSE5UVVJMNS4u)

* [CSB Mind Expander 01.04](https://forms.office.com/Pages/ResponsePage.aspx?id=8frLNKZngUepylFOslULZlFZdbyVx8RLiPt1GobhHnlURVhQUzBWODVKR0VJTTE2WjlZN05ZTjhMRi4u)

## HOMEWORK
* [Assignment_1, Due 09/13](https://github.com/comp-bio-fall-2019/Week01/blob/master/assignment_1.md)
* [Graduate Student Course Project Ideas, Due 09/13](https://forms.office.com/Pages/ResponsePage.aspx?id=8frLNKZngUepylFOslULZlFZdbyVx8RLiPt1GobhHnlUOUo2UVRUMVgwTUlQMlpUQzUzOTIzME9LNi4u)


