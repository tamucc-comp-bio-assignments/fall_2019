rm(list=ls())

#arithmetic
17+3    #addition, sum
17-3    #subtraction
17*3    #multiplication, product
17/3    #division
17%%3   #remainder
17%/%3  #integer

#equalities
17==3
17!=3
17>=3
17<=3
17>3 | 17<3

#variables
x <- -1.2345
y <- "Hi"
x
y

#data types
x <- as.integer(50)
class(x)
1+x
z <- as.numeric(x^2)
y <- as.character("Bye")
q <- as.complex(1+3i)
r <- 3==4
is.numeric(x)
is.numeric(y)
is.numeric(z)
is.numeric(q)
is.numeric(r)
is.logical(r)

#math functions
rm(list=ls())
x <- -1.234
abs_x <- abs(x)
sqrt_abs_x <- sqrt(abs_x)
ceiling(x); ceiling (abs_x)
floor(x); floor(abs_x)
trunc(x); trunc(abs_x)
y <- round(x, 2)
cos_y <- cos(y)
z <- log(abs(y))
exp_z <- exp(z)

#vectors
rm(list=ls())
1:6
x <- c(1:6)
y <- c("a", "B", "c", "D")
y[3]
z <- seq(1, 40, 4)
z
z[3:6]
z[c(2,8,10)]

#statistical functions 
#for vectors
length(y)
min(x); max(x)
sum(x); prod(x)
median(z)
mean(z)
var(z)
summary(z)

##########################################
#Mind expanders 1
rm(list=ls())
#1
z <- seq(2,100,2)
z
#2
z_div_12 <- z[z%%12 == 0]
#3
length(z_div_12)
#4
sum(z_div_12)
#5
prod(z[c(5,10,15)])

y <- seq(0,30,3)
y

z[z%%3==0 & z<=30]

1+z^2
##########################################

#matrices
rm(list=ls())
x <- c(1, 2, 3, 4)
matrix(x, 2, 2)
matrix(x, 2, 2, byrow=TRUE)
A <- matrix(x, 2, 2)
A %*% A
solve(A)
diag(A)
B <- matrix(1,3,2)
B
t(B)
B %*% t(B)
dim(A)
dim(B)
nrow(B)
ncol(B)

#matrices 2
Z <- matrix(1:9, 3, 3)
Z     #whole matrix
Z[1,] #vector with first row
Z[,3] #vector with third column
Z[1:2, 2:3] #submatrix
Z[c(1,3), c(1,3)] #submatrix
mean(Z)

#arrays
rm(list=ls())
M <- array(1:24, dim=c(4,3,2))
M
dim(M)
#return first matrix as matrix
M[,,1]  
#return first matrix as array
M[,,1, drop=FALSE] 

#Lists
rm(list=ls())
list(1,"A",3000)
mylist <- list(Names=c("a","b","c","d"),
               Values=c(3,1,2))
mylist
mylist[[1]]       #first item in list
mylist[["Names"]] #item named "Names"
mylist$Values     #item named "Values"
mylist[[1]][4]    #4th element of 1st item

#string manipulation
rm(list=ls())
x <- "Sample-36"
strsplit(x,'-')
substr(x, start=8, stop=9)
sub("36", "39", x)
paste(x, "is smaller", sep=" ")
nchar(x)
toupper(x)
tolower(x)

#data frames
rm(list=ls())
data(trees)   #load example data frame
str(trees)    #structure of data frame
ncol(trees)   #num cols
nrow(trees)   #num rows
head(trees)   #display first few rows
trees$Girth   #select column
trees$Girth[1:5] #select 1st 5 rows of col Girth
trees[1:5,1]    #select 1st 5 rows of 1st col
trees[1:5,]$Girth #select 1st 5 rows of col Girth
colnames(trees) <- tolower(colnames(trees))




###################################################
#mind expanders 2
rm(list=ls())
data(trees)
avg_height <- mean(trees$height)
avg_girth_gr75 <- mean(trees$girth[trees$height > 75])
max_height_15_35 <- mean(trees$height[trees$volume > 15 & trees$volume < 35])
###################################################


#setwd
rm(list=ls())
getwd()
#use your own path below
#i've used paste("text1","text2",delimiter) command so
#I could show whole path on screen
setwd(paste("C:/Users/cbird/Documents/CloudStation/",
      "Teaching/Summer_2019/PhilippinesWorkshop/",
      "CSB/r/sandbox",
      sep=""))
getwd()

#read in data
#make sure you use the correct path for your computer
ch6 <- read.table("../data/H938_Euro_chr6.geno", 
                  header=TRUE)
dim(ch6)
head(ch6)
tail(ch6)


###################################################
#mind expanders 3
ch6$NumInd <- ch6$nA1A1 + ch6$nA1A2 + ch6$nA2A2
num_ind <- max(ch6$nA1A1 + ch6$nA1A2 + ch6$nA2A2)
num_ind <- max(rowSums(ch6[,5:7])) #function was not taught
num_snps_homo <- length(ch6$SNP[ch6$nA1A2 == 0])
num_snps_gr99homo <- length(ch6$SNP[rowSums(ch6[,c(5,7)])/rowSums(ch6[,5:7]) > 0.99])

###################################################











length(ch6$SNP[ch6$nA1A1+ch6$nA2A2 > 0 & ch6$nA1A2==0])












#if statements
rm(list=ls())
x <- seq(1,50,3)
y <- sample(x, size=1, replace = TRUE) #randomly sample 1 value from x

if(y%%2 == 0){
  print(paste(y, "is even"))
} else {
  print(paste(y, "is odd"))
}

if(y%%2 == 0){
  print(paste(y, "is even"))
} else if(y%%2 != 0) {
  print(paste(y, "is odd"))
}




#####################################
#Mind expanders 4
rm(list=ls())

x <- seq(1,50,3)
y <- sample(x, size=1, replace = TRUE) #randomly sample 1 value from x

if(y%%4 == 0){
  print(paste("the sqrt of y is", sqrt(y)))
}

if(y > 25){
  print(paste("the cube of y is", y^3))
} else if(y < 10){
  print(paste("a vector from 1:y is", 1:y))
} else {
  print(paste("y is", y))
}

if(y <= 25 & y >= 10){
  y
}

if(y < 15){
  print(paste("y is only", y))
} else {
  print("y is large")
}
######################################




#loops
rm(list=ls())
myvec <- 1:10     #make vector from 1 to 10
for(i in myvec){  #for each value in myvec
  a <- i^2        #square it
  print(a)        #and print the square
}                 #goto next value in myvec

i <- 1            #set i = 1
while(i <= 10){   #while i <= 10 
  a <- i^2        #square i
  print(a)        #print the square
  i <- i + 1      #increase i by 1
}                 #goto while line





#####################################
#Mind expanders 5
rm(list=ls())

#print all values in list from 1 to 1000 in 3s 
#that can be divided by 4 evenly
z <- seq(1, 1000, by=3)
for(k in z){
  if(k%%4 == 0){
    print(k)
  }
}
#####################################




#functions
rm(list=ls())

#check whether number is triangular
isTriangular <- function(y){
  #triangular numbers (T) defined by n(n+1)/2, thus
  #y is triangular if the following is an integer
  n <- (sqrt((8*y)+1) - 1) / 2
  if(as.integer(n) == n){
    return(TRUE) # function will end here in n is integer
  }
  #if n is not integer, return FALSE
  return(FALSE)
}
isTriangular(4)
isTriangular(91)


#sourcing functions
rm(list=ls())
source("triangular.R")
isTriangular(4)
isTriangular(91)

rm(list=ls())
source("triangular.R")
isTriangular(91)
findTriangular(1000)




#addtional functions
rm(list=ls())

tell_fortune <- function(){
  if(runif(1) < 0.9){
    print("Today is going to change your life!")
  } else {
    print("You should have stayed in bed :-|")
  }
}
tell_fortune()

order_3 <- function(x,y,z){
  return(sort(c(x,y,z)))
}
order_3(10,7,9)

order_3_list <- function(x,y,z){
  ordered_numbers <- sort(c(x,y,z))
  return(list("1st" = ordered_numbers[1],
              "2nd" = ordered_numbers[2],
              "3rd" = ordered_numbers[3]))
}
order_3_list(10,7,9)

split_string <- function(s, separator = "_"){
  return(strsplit(s, separator)[[1]])
}
split_string("I_get_it!")




#Packages
RSiteSearch("AMOVA")

#install all packages related to a particular field
install.packages("ctv")
library(ctv)
install.views("genetics")   #this doesn't work
update.views("genetics")    #this doesn't work





#random numbers, permuting, bootstrapping
rm(list=ls())

runif(3)            #random numbers from uniform distribution

rnorm(5, 15, 5)     #random numbers from normal distribution, simulate quantitative phenotypes
rbinom(1, 10, 0.5)  #random numbers from binomial distribution, simulate coin flipping, genetic drift, genotypes
rpois(6, 10)        #random numbers from Poisson distribution, simulate count data

x <- 1:10
sample(x,10)              #permutation test, randomly assign individuals to treatments
sample(x,10,replace=TRUE) #bootstrapping



#################################################
#Mind Expanders 6
rm(list=ls())
data(trees)   #load data frame

#number 1, bootstrap experiment
  num_obs <- nrow(trees)
  trees$Experiment <- 1+rbinom(num_obs, 1, 0.5)
  trees$Experiment
  
  #alternative solution using runif
  trees$Experiment <- runif(num_obs)
  trees$Experiment[trees$Experiment > 0.5] <- 2
  trees$Experiment[trees$Experiment <= 0.5] <- 1
  trees$Experiment
  
  #alternative solution using sample
  x <- c(1,2)
  trees$Experiment <- sample(c(1,2),num_obs,replace=TRUE)
  trees$Experiment
  
#number 2
  #function to bootstrap the assignment of trees 
  #to either Experiment 1 or 2
  num_obs <- nrow(trees)
  bsExp <- function(num_obs){
    return(1+rbinom(num_obs, 1, 0.5))
  }
  trees$Experiment <- bsExp(num_obs)
####################################################

  
  
  
  
#Vectorization of loops
  rm(list=ls())
  
  #make a matrix with 10000 rows and columns filled
  #with uniform random numbers between 0 and 1
  M <- matrix(runif(10000*10000),10000,10000)
  
  #Function that calculates row means of M
  #without vectorization
  get_row_means <- function(M){
    #set up vector to capture results
    row_means <- rep(1, nrow(M))
    #loop through rows, calc the mean of each,
    #and save into row_means vector
    for(i in 1:nrow(M)){
      row_means[i] <- mean(M[i,])
    }
    return(row_means)
  }
  
  #measure time to complete get_row_means
  system.time(get_row_means(M))
  
  #measure time to complete vectorized rowMeans()
  system.time(rowMeans(M))
  
  
  rm(list=ls())
  #use lapply to create list of matrices
    #make list filled with NA
    Mlist <- as.list(rep(NA, length = 20))
    #function to generate small random matrices
    randMat <- function(x){
      return(matrix(rnorm(25),5,5))
    }
    Mlist <- lapply(Mlist, randMat)
  
  #use lapply to find largest eigen val in each matrix
    Meig <- lapply(Mlist, function(x) 
      return(eigen(x, only.values=TRUE)$values[1]))
    print(unlist(Meig))
  
  #use sapply to count nucleotides
    DNAlist <- list(A='GTTTCG',B='GCCGCA',C='TTATAG',
                    D='CGACGA')
    #function to count nucleotides
    count_nucl <- function(seq, nucl){
      #return list of positions with match
      pos <- gregexpr(pattern=nucl, text=seq)[[1]]
      #change -1, no match, to 0
      if(pos[1] == "-1"){return(0)
        } else {return(length(pos))}
    }
    #
    numAs <- sapply(DNAlist, count_nucl, nucl = 'A')
    print(numAs)
    numGs <- sapply(DNAlist, count_nucl, nucl = 'G')
    print(numGs)  
 

#Debugging
  rm(list=ls())
    
  myfun <- function(i,x){
    for(z in 1:i){
      x <- x*2
      browser()
    }
    return(x)
  }
  myfun(3,4)
  
  
  
#Statistics
  rm(list=ls())
  data(iris)    #load built-in iris dataset
  
  #useful commands for exploring data
  str(iris)     #show columns in data
  summary(iris) #show summary stats
  table(iris$Species) #number of observations by spp
  table(iris$Species, iris$Petal.Width) #number of observations by species and petal width
  range(iris$Petal.Length)  #min and max
  by(iris$Sepal.Length, iris$Species, mean) #mean by group
  cor(iris$Sepal.Length,iris$Petal.Length) #correlation
  pairs(iris) #matrix scatterplot to visualize correlations
  rank(iris$Sepal.Length) #return rank of each observation from smallest to largest
  
  #extract rows of data frame based on value match
  noSetosa <- subset(iris, iris$Species != "setosa")
  
  #return row num based on condition match
  which(iris$Petal.Length > 6)
  which.max(iris$Petal.Length)
  
  #t-test   compare two samples
  t.test(Sepal.Width[Species == "setosa"], 
         Sepal.Width[Species == "versicolor"],
         data=iris)
  
  t.test(Sepal.Width ~ Species, data=noSetosa)
  
  #linear regression
  linear_model <- lm(Sepal.Width ~ Sepal.Length,
                     data=iris)
  summary(linear_model)
  
  #anova   compare many samples
  petalL_ANOVA <- lm(Petal.Length ~ Species, 
                     data=iris)
  anova(petalL_ANOVA)
  summary(petalL_ANOVA)
  
  

  
  
  
  
  
  
###################################################
#Mind expanders 7
#script to bootstrap the assignment of trees to one
#of two experiments, conduct t-test on volume between
#the two experiements, report the number bootstraps
#that resulted in p <= 0.05
rm(list=ls())

#set variables
num_bs <- 1000
num_obs <- nrow(trees)
pval <- c()

data(trees)   #load data frame 

#function to boostrap assignment of samples to Experiments
bsExp <- function(num_obs){
  return(1+rbinom(num_obs, 1, 0.5))
}

#loop to boostrap Experiments, conduct t-test, save p-val
for(i in 1:num_bs){
  trees$Experiment <- bsExp(num_obs)
  test_result <- t.test(Volume ~ Experiment, data=trees)
  pval <- c(pval, test_result$p.value)
}

#determine how many tests had p<=0.05 can calc proportion of randomly generated positives
num_sig_tests <- length(which(pval <= 0.05))
prop_sig_tests <- num_sig_tests/num_bs
prop_sig_tests
#####################################################

 

#Basic Plotting
  rm(list=ls())
  data(iris)    #load built-in iris dataset
  
  #scatter plot
  plot(Petal.Length ~ Petal.Width, data=iris)
  plot(Petal.Length ~ Petal.Width, data=iris, pch=4)
  plot(Petal.Length ~ Petal.Width, data=iris, pch=4,
       col="blue")
  abline(c(0,1))
  plot(Petal.Length ~ Petal.Width + Species, 
       data=iris, col=Species)
  
  #histogram
  hist(Petal.Length, data=iris)
  hist(Petal.Length, data=iris, breaks=7)
  hist(Petal.Length, data=iris, breaks=c(1,2,5,9),
       freq=FALSE)
  
  #bar plots
  barplot(height = iris$Petal.Width, 
          beside=TRUE, col=iris$Species)
  
  #box plots
  boxplot(Petal.Width ~ Species, data=iris,
          col=c("red","green","blue"))


 
  
#Interfacing with Operating System
  list.files()
  #if your os is mac or linux, run this
  system("wc -l triangular.R")
  system("wc -l triangular.R", intern=TRUE)
  
  #if your os is win, run this
  system("dir", intern=TRUE) #doesn't work
  
  
  
#capturing arguments from the command line
  args <- commandArgs(TRUE) #read the arguments
  num_args <- length(args)  #count the arguments
  
  #set default values
  input_file <- "test.txt"
  num_reps <- 10
  start_point <- 3.14
  
  #change default value if argument given 
  if(num_args >= 1){
    input_file <- args[1]
  }
  if(num_args >= 2){
    num_reps <- args[2]
  }
  if(num_args >= 3){
    start_point <- args[3]
  }
  
  print(c(input_file, num_reps, start_point))
  
  
  
  
  
  
  
  

  
  

#documenting code
install.packages("knitr")
library(knitr)
install.packages("pdflatex")

setwd("CSB/r/solutions")
#open Goldberg2010_solution.Rmd & run ctrl+shift+S
setwd("../../../")









