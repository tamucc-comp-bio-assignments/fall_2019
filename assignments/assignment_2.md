# Assignment 2 

## Due 09/20

## Computer Preparation
* Win10
  * Log into your Ubuntu terminal.  _We will not use `gitbash` unless you can't get Ubuntu running._ You are in your home directory.

  * If the Ubuntu app is not installed or you are using an Ubuntu terminal that hasn't been setup (you'll know because it will ask you to create a new user name and password), then follow the instructions [here](https://github.com/cbirdlab/wlsUBUNTU_settings/blob/master/README.md) to set it up. Note that I have automated the process and you should be able to complete it in less than a minute.
  
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

## Description of Assignment
Complete Exercise 1.10.4 Data Explorer (data from Buzzard *et al.*, 2016), and submit script ____________. You may work in groups but each student must submit their own work.

Hints:

* **_I highly recommend that you create your script in a text document in either Notepad++ or BBedit_**.  

* Start by copying and pasting pseudo code into your script
  * "Comment" the pseudo code using `#`
* Add a shebang!
* Use your terminal to play in your sandbox and construct/troubleshoot code
* Copy and paste working code into your script in your text editor
* I have noticed that the Win10-Ubuntu terminal does not like when you copy properly formatted code with leading tabs and spaces from your script in the text editor and paste it at the command line
  * You can, however, copy and paste the lines without the leading tabs and spaces
  * You can also create the script in the terminal using `nano` and paste in your properly formatted code to then run the script
    * Win10 only, it is critical that you do not modify files in your Ubuntu directory structure with Win10
	  * You can, however, move to your Win10 directory structure from the Win10-Ubunutu terminal and manipulate files as you wish `cd $winhome`

Pseudo code:

* You can select a given column from a `csv` file using the command `cut`. Then,
   - The column name is going to be in the first line (*header*); access it with `head`
   - The number of distinct values can be found by counting the number of lines when you have sorted them and removed duplicates (using a combination of `tail`, `sort` and `uniq`)
   - The minimum and maximum values can be found by combining `sort` and `head` (or `tail`)
   - To write the script, use the generic placeholders `$1` and `$2` for the file name and column number, respectively

