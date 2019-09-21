# Assignment 3

## Due 09/27

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

## GitHub Preparation
* You must be a member of our class's github repository. If you are not a member (because you did not accept the initial invite) then please let me know and I'll reinvite you. 
* Make sure you are logged into github.

## Description of Assignment (Due 09/27/2019)
* Clone the repository for this assignment to your home dir in your terminal. 
* Ensure that the `admesh2tabdelimited.bash` script works by running it on the admesh.out data. This script converts the output of `admesh`, a unix command to extract information from 3D scans stored in `stl` files, into a "tidy" data file.
* Complete the requested updates to the `admesh2tabdelimited.bash` 
* I recommend troubleshooting after each change you make to the script
* You may work in groups but each student must submit their own work.

[Click on this Link to Initiate this Assignment](https://classroom.github.com/a/1id4ZoG_)


### To `push` your changes to your repository on GitHub, and thus submit the assigment, do the following

* change directories to the directory for this assignment
* type the following:
```
git add *
git commit -m "updating my assignment"
git push origin master
```

Note that 
* you can change the `commit` message to whatever you want (the part in quotations, but keep it brief
* you will have to provide your github username and password for the `push` to `origin master`
