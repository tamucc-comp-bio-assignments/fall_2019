# Week03 UNIX III - Beyond the CSB Text Book

### [Assignment 2](https://github.com/tamucc-comp-bio/fall_2019/blob/master/assignments/assignment_2.md) is due at the beginning of this lecture

## Lecture 02 Slides
* There are no slides this week, I'll post a recording here after lecture.

## Computer Preparation
* Win10
  * Log into your Ubuntu terminal.  _We will not use `gitbash` unless you can't get Ubuntu running._ You are in your home directory. If the Ubuntu app is not installed, then follow [these instructions](https://github.com/cbirdlab/wlsUBUNTU_settings/blob/master/InstallLinuxOnWindows_Automated.pdf)
  * If you are using an Ubuntu terminal that hasn't been setup (you'll know because it will ask you to create a new user name and password) or you notice odd cursor behavior when editing text in the terminal, then run the following code:
    ```bash
    git clone https://github.com/cbirdlab/wlsUBUNTU_settings.git
    . ./wlsUBUNTU_settings/updateSettings.bash
    rm -rf wlsUBUNTU_settings
    ```
  * If the `CSB` directory does not exist in your home directory (check with `ls`), then run the following code to clone the `CSB` repository into your home directory:
    ```bash
    git clone https://github.com/CSB-book/CSB.git
    ```
* MacOS
  * Open a terminal window
  * Consider installing [homebrew](https://brew.sh/).  You will be able to use homebrew to install linux software, such as `tree`, which is used in the slide show.
  * If the `CSB` directory does not exist in your home directory (check with `ls`), then run the following code to clone the `CSB` repository into your home directory:
    ```bash
    git clone https://github.com/CSB-book/CSB.git
    ```


## In Class Activities

### [Quiz (Time limit: 5 min)](https://forms.office.com/Pages/ResponsePage.aspx?id=8frLNKZngUepylFOslULZlFZdbyVx8RLiPt1GobhHnlUNEpSWTVNREU0N1IxUDNLU0tPMVYyUkpSRC4u)

### Review of What We Have Learned (Time Limit 15 minutes)

1. There are several commands for navigating and manipulating a computer file directory 
  * `cd`    change directories
  * `pwd`   where am I?
  * `ls`    show contents of `pwd`
  * `cp`    copy files and directories from one location to another, could also rename copied file
  * `mv`    move files and directories from one location to another, rename file or directories
  * `rm`    delete file or dir, be careful, there is no undo
  * `mkdir` make new directory, will not overwrite existing dir
  * `less`  view a file without opening all of it, good for large files
  * `nano`  word processor, edit text files
  * `chmod` change file and dir permissions

2. Each command has *options* and accepts *arguments* to modify functionality and which can be viewed in the manual
  * `man`   show manual for command
  * command` -h` if man does not work, this could show manual for command
  * command` --help` another way to display manual
  * command   another way to display manual
  * use web browser to search on *bash command man*
  * example of argument: `ls data` will return the file and contents of directory in pwd that are named *data* if they exist
  * example of option:  `ls -ltrh` will return all files in `pwd` with details, in reverse chronological order with human-readable file sizes

3. Locations of files and dirs can be specified using absolute or relative paths and these paths are used by the majority of commands because most commands manipulate files and dirs
  * `/`     root dir, top dir in directory tree
  * `~`     home dir
  * `-`     last directory your were in before the `pwd`
  * `../`   parent directory, one directory up the tree from `pwd`
  * `../../` 2 directories up the tree from `pwd`
  * `./`    present working directory

4. Wildcards can be used to specify several files with one word or paths
  * `*` can be any character
  * example: `ls *.txt` will list all files ending in `.txt` 

5. There are several commands in the text book that are important for manipulating biological data.
  * `echo`  prints text or convertes text into a text stream
  * `head`  returns only first few lines of a file, or remove last lines (rows)
  * `tail`  returns only last few lines of a file, or remove first lines (rows)
  * `cut`   returns specified columns
  * `cat`   combines files together by line (row)
  * `uniq`  removes duplicates
  * `sort`  changes the order of rows by column
  * `grep`  returns lines (rows) that match a pattern
  * `tr`    replaces one character with another, usually column delimiters
  * `wc`    count words, characters, lines, etc

6. Unix commands are designed to pipe `|` and redirect `>` text streams to construct pipelines that link commands and create new files
  * `|`     takes standard output (*stdout*) from one command and pipes it to another command as *stdin*
  * `>`     redirects *stdout* into a file of your naming, will overwrite existing file
  * `>>`    redirects *stdout* into a file of your naming, will append existing file

7. The escape character `\ ` changes the meaning of the character that follows, including end of lines
  * at the end of a line, it means do not end line and continue on next line
  * `\t`   is a tab, but not all commands recognize this
  * `\n`   is a line feed (*LF*), the unix end of line character (usually invisible)
  * `\r`   is a carriage return (*CR*), in windows every line concludes with CRLF, and causes compatibility issues with unix/linux/mac 
  * there are MANY more uses of `\ `

8. We can assign values to variables
  ```bash
  VARIABLE=1375
  ```

9. We have learned how to use unix commands within a line of code to return a value with `$()` 

  ```bash
  VARIABLE=$(echo 1375)
  cat $(ls *)
  FILES=$(ls *)
  ```

10. Repetative tasks can be automated using `for` loops

  ```bash
  for i in $VARIABLE; do
  	echo $i
  done
  ```

11. Many lines of commands can be stored in file (script) and executed sequentially
  ```
  bash script.sh
  ```

12. Values can be passed into a script by listing them as argumnents which are stored sequentially into variables: `$1`, `$2`, `$3`, etc
  ```
  bash script.sh ../data.txt
  ```

### Exercise 1.10.3 (Time limit: 40 min)
We will review and complete this exercise together

### Additional Important Unix Commands and Intro to Regular Expressions for Pattern Matching (30 min)

#### Paste is used for combining files by columns or converting a file with one column into a file with several columns
  ```bash
  
  ```

#### Sed is used to find a pattern and replace it with text or a specified pattern
  ```bash
  
  ```

#### Regular Expressions (regex) are sequences of characters that define search patterns.  
There are different regex languages (POSIX, PERL, etc) that have slight differences in the meanings of different characters.  Regex is critical for `grep`, `sed`, and even `ls` and we will learn more regex later in the course.
  * `^`     Beginning of line
  * `$`     End of line
  * `[]`    any of of the characters inside the square brackets are a match
  * `.`     any character
  * `*`     any number of repeats of the previous character
  * `\ `     Escape character, 
  
  ```bash
  
  ```

#### Basic addition and subtraction
  ```bash
  # addition
  X=$((1+1))
  echo $X
  
  # subtraction
  Y=$((10-5))
  echo $Y
  ```
  
#### Decision logic with if-then-else statements
  ```bash
  $ if [ 1 == 2 ]; then
	  echo 1 does equal 2
    else
      echo 1 does not equal 2 
    fi
  1 does not equal 2
  ```
  
  ```bash
  $ A="YES"
    B=100
    if [ "$A" != "$B" ]; then
	  echo $A does not equal $B
    else
      echo $A does equal $B 
    fi  
  YES does not equal 100
  ```

#### A function allows you to define a new customized command composed of several existing commands
  A function is a lot like a script, except you can define and use it within a script itself. You should make a function when you find yourself repeatedly using the same code over and over. 
  Let us build upon the if-then-else logic in the last section to create a function that decides whether the two arguments passed to it are equal.
  ```bash
  $ DECIDER(){
      A=$1
	  B=$2
      if [ "$A" != "$B" ]; then
	    echo $A does not equal $B
      else
        echo $A does equal $B 
      fi 
    }
  ```

  After you complete the function, nothing will happen, but it has been stored into memory and can now be used.
  ```bash
  $ DECIDER 1 2
  1 does not equal 2
  ```

### Real World Application of Skills Learned: Fisheries-Induced Evolution (60 min)

![alt text](https://github.com/tamucc-comp-bio/fall_2019/blob/master/lectures/Week03_files/3Dscan_limpetShell.PNG) ![alt text](https://github.com/tamucc-comp-bio/fall_2019/blob/master/lectures/Week03_files/3Dscan_limpetShell_left.PNG) ![alt text](https://github.com/tamucc-comp-bio/fall_2019/blob/master/lectures/Week03_files/3Dscan_limpetShell_right.PNG) ![alt text](https://github.com/tamucc-comp-bio/fall_2019/blob/master/lectures/Week03_files/3Dscan_limpetShell_top.PNG) ![alt text](https://github.com/tamucc-comp-bio/fall_2019/blob/master/lectures/Week03_files/3Dscan_limpetShell_bottom.PNG)



## HOMEWORK
Complete the exercise(s) by answering the question(s) in the online form and submitting.  You must be logged into your TAMUCC email account to have your identity attached to your answers. 

You may work in groups, but each person must fill out the online answer form.

The exercises in the online forms closely follow those in the book.  I do make minor modifications and provide tips in the online form.  To ensure that your work is saved, **_I highly recommend that you first record your answers in a text document in either Notepad++ or BBedit and save them to your computer_**.  For an excellently formatted example, see the solutions provided by the book in `CSB/unix/solutions`. 

* [Exercise 1.10.2 Hormone Levels in Baboons](https://forms.office.com/Pages/ResponsePage.aspx?id=8frLNKZngUepylFOslULZlFZdbyVx8RLiPt1GobhHnlUQldJQTVHMTlYMFVYTkhZSDBZR1A0Q1E2Ny4u)

* [Exercise 1.10.3 Plant-Pollinator Networks](https://forms.office.com/Pages/ResponsePage.aspx?id=8frLNKZngUepylFOslULZlFZdbyVx8RLiPt1GobhHnlUMlpVSUQ0U1hTSFZERDE1WUdZWjRYUlhaWi4u)

## HOMEWORK
* [Assignment_2, Due 09/20](https://github.com/tamucc-comp-bio/fall_2019/blob/master/assignments/assignment_2.md)

