# Week04 Version Control 

### [Assignment 3](https://github.com/tamucc-comp-bio/fall_2019/blob/master/assignments/assignment_3.md) is due at the beginning of this lecture

## Lecture 04 Slides
* There are no slides this week

___

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

___

## In Class Activities

### I. Quiz(!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!)

### II. Version Control

#### What is version control?

* A tool to record changes to your files and directory structure
  * additions, deletions, changes, etc

#### Why use version control?

* Organize project, especially with multiple people
  * e.g., student, advisor, committee members, collaborators
  * efficient
* Recover old versions of work (undo)
* No need for 10 versions of each of your files

#### Getting Started with Git

Git is a version control tool and GitHub is a website that uses git.  Git is popular, free, open source, and GitHub is a paid service that is free for educational use.

![alt text](https://github.com/tamucc-comp-bio/fall_2019/blob/master/lectures/Week04_files/gitlogo.jpg) git logo
![alt text](https://github.com/tamucc-comp-bio/fall_2019/blob/master/lectures/Week04_files/githublogo.jpg) github logo

Git is *distributed*, with a full copy of the project history resides on every instance of the *repository*
![alt text](https://github.com/tamucc-comp-bio/fall_2019/blob/master/lectures/Week04_files/distributedvcs.png)

#### Configuring Git

Viewing your current git settings:

```bash
$ git config --list

user.name=Chris Bird
user.email=cbird808@gmail.com
core.repositoryformatversion=0
core.filemode=true
core.bare=false
core.logallrefupdates=true
```

Updating your user.name, email, etc...

```bash
$ git config --global user.name "Chris Bird"
$ git config --global user.email cbird808@gmail.com
$ git config --global color.ui true
```

#### Getting Help with Git

```bash
$ git help
$ man git
```

#### Every Day Git: Local Repository

1. Initializing a repository only needs to be done once.  Any directory (dir) can become a git repository (repo)  Lets make the `~/CSB/git/sandbox/originspecies` directory a git repository:
```bash
$ cd ~/CSB/git/sandbox
$ mkdir originspecies
$ cd originspecies
$ git init

  Initialized empty Git repository in /home/cbird/CSB/git/sandbox/originspecies/.git/
```

2. Checking the status of a repo:

```bash
$ git status

On branch master

Initial commit

nothing to commit (create/copy files and use "git add" to track)
```

3. Create a file called `origin.txt` in your repo as follows:
```bash
$ echo "An Abstract of an Essay on the Origin of Species and Varieties Through Natural Selection" > origin.txt
```

4. View file contents:
```bash
$ cat origin.txt

An Abstract of an Essay on the Origin of Species and Varieties Through Natural Selection
```

  So far, git has not tracked anything we did.  We need to tell it to record the changes. Git will only track the files you tell it to track.

5. Set `origin.txt` for git tracking then check the repo status:
```bash
$ git add origin.txt
$ git status

On branch master

Initial commit

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)

        new file:   origin.txt
```

It is important to note that git is made to track human-readable text files.  A human-readable text file will be readable by your text editor. Files that are binary (*docx, etc) cannot be tracked by git in the same way that text files can.

6. Everybody use your text editor (notepad++ or bbedit) and try to open a MS Word doc

We have yet to actually save a snapshot of our updates.  You should `git commit` your changes at the end of every session, when you have a working script, or when you can succinctly describe the changes you made.

7. Creating a snapshot of the project:
```bash
$ git commit -m "started the book"

[master (root-commit) a90fea2] started the book
 1 file changed, 1 insertion(+)
 create mode 100644 origin.txt
```

  The `-m` option stands for "message".  The message is there to help you know how this version is different than the previous one should you need to recover an older version in the future.  The message should be short but sufficiently descriptive.

8. Show the repo history:
```bash
$ git log

commit a90fea2df1a59e635fba3c09a0cc0f1dfe78b2d9   #this number is the fingerprint of the commit
Author: Chris Bird <cbird808@gmail.com>
Date:   Fri Sep 27 08:24:34 2019 -0500

    started the book
```

9. Let us change the text in our tracked document

```bash
$ echo "On the Origin of Species, by Means of Natural Selection, or the Preservation of Favoured Races in the Struggle for Life" > origin.txt
$ git status

On branch master
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

        modified:   origin.txt

no changes added to commit (use "git add" and/or "git commit -a")
```

10. Both add and commit need to be executed to update the repo

```bash
$ git add .
$ git commit -m "Changed the title as suggested by Murray"

[master 5b762fe] Changed the title as suggested by Murray
 1 file changed, 1 insertion(+), 1 deletion(-)
```

11. View the log history again after the commit

```bash
$ git log

commit 5b762fec87bd70db9bdd0d54620b8e4728927a36
Author: Chris Bird <cbird808@gmail.com>
Date:   Fri Sep 27 08:36:22 2019 -0500

    Changed the title as suggested by Murray

commit a90fea2df1a59e635fba3c09a0cc0f1dfe78b2d9
Author: Chris Bird <cbird808@gmail.com>
Date:   Fri Sep 27 08:24:34 2019 -0500

    started the book
```

Notice that both commits are logged and each has the "fingerprint" id.

That is the majority of the commands you will use in git: git add,  git commit

12. Showing changes since last commit

  The argument `diff` will show all changes *since the last commit*
  ```bash
  $ git diff
  ```
  If you do not see any differences, then change the repo by adding a file or changing the text in `origin.txt`

  Note that the previous version is marked with an `a/` and the newer version is labeled `b`/.  The addition and subtraction of files are marked with `+` and `-`

13. Moving and removing files

  ```bash
  $ git mv origin.txt origins.txt
    git rm *.txt
  ```
  you need to tell git when you remove or move version controlled files 

14.  Let us review what we have learned by making a new project in your sandbox and initializing the repo

  ```bash
  $ cd ~/CSB/git/sandbox
  $ mkdir newproject
  $ cd newproject
  $ git init # initialize repository
  $ git status
  # make changes to repo, then track changes by:
  $ git add --all
  $ git commit -m "my descriptive message"
  ```

---
### [Mind Expander 2.1](https://forms.office.com/Pages/ResponsePage.aspx?id=8frLNKZngUepylFOslULZlFZdbyVx8RLiPt1GobhHnlUMVJSRE4zRVpFOElBVTUzMTVVNFZBNkRGVy4u)

---

###  Troubleshooting

Git can get confused if you are not dilligent in your pattern of adding and comitting changes and it will be neccessary to troublshoot conflicts.

#### Amending an Incomplete Commit
  Incomplete commits can occur when file are not removed within git, changes are made but not added, etc..  The solution is to rectify these conflicts.
  
  ```bash
  # make file
  $ touch barnacles.txt
  
  # mistakenly commit changes without adding
  $ git commit -m "added barnacles.txt"
  
  On branch master
  Untracked files:
          barnacles.txt

  nothing added to commit but untracked files present
  
  # fix by adding then committing
  $ git add *
  $ git commit -m "added barnacles.txt"
  ```

#### Unstaging Files
  You may have added files to the snapshot staging area by mistake.  To unstage them:
  (do not type this in, it is an example)
  ```bash
  git reset HEAD filetounstage.py
  ```

---

### Remote Repositories (GitHub)

1. Cloning a repository:
  ```bash
  git clone ADD YOUR HOMEWORK REPO LINK HERE
  ```
  
2. Move into your repository, change it, add and commit the changes

3. Push changes from local repository back to central repository on GitHub
  ```bash
  git push origin master
  ```
  

  

![alt text](https://github.com/tamucc-comp-bio/fall_2019/blob/master/lectures/Week04_files/git_common_commands.png)






## HOMEWORK
Exam 1  Due 10/04  

