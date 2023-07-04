## My first R command
1 + 11

##----------------------
## Variables

weight <- 55

## same thing
height = 176

weight

weight2 <- 103 - 31

weight <- 57

weihgt <- weight

weight <- 100

## Ex: create a new variable
## that converts weight into
## pounts (times 2) and store
## the results in weigth_p

weight_p <- weight * 2

##----------------------
## Functions

x <- round(3.14)

ls()

rm(weight_p)

round(3.14)

?round

round(3.14, 1)

round(x = 3.14, 
      digits = 1)

round(3.14, digits = 1)

round(digits = 1,
      x = 3.14)

round(1, 3.14)

##----------------------
## Vectors

## numerics
weight <- c(56, 67, 121, 86)
weight

length(weight)

## Ex: calculate the mean weight
## using mean()

mean(weight)

## Ex: combine the content of 
## weight and weight2 into a new
## vector called weight3. 

weight3 <- c(weight, weight2)

## vectorising 

weight4 <- weight + weight2

length(weight4)

length(weight)

## recycling
(1:4) + (1:2) 
(1:4) + (1:3) 

x <- c(1, NA, 10)
y <- c(1, 2, 3)
x + y

## calcuate the median()
## of x
median(x, na.rm = TRUE)

##----------------------
## Characters

molecules <- c(
  "dna", 
  "rna",
  "protein"
)
molecules
length(molecules)

class(molecules)
class(weight)

str(molecules)
str(weight)

##----------------------
## Logicals

TRUE
FALSE

3 > 1

3 > 5

c(TRUE, FALSE, FALSE)

class(c(TRUE, FALSE, FALSE))

str(c(TRUE, FALSE, FALSE))

num_char <- c(1, 2, 3, "a")
class(num_char)
num_char

num_logical <- c(1, 2, 3, TRUE, FALSE)
class(num_logical)
num_logical

char_logical <- c("a", "b", "c", TRUE)
class(char_logical)
char_logical

tricky <- c(1, 2, 3, "4")
class(tricky)
tricky

as.numeric(c(TRUE, FALSE))
as.character(c(TRUE, FALSE))

as.numeric("4")
as.numeric("Q")

## strsplit("ab4", "")

##----------------------
## Subsetting

molecules[2]
molecules[1]

## extact 1st and 3rd elements?

molecules[c(1, 3)]
c(molecules[1], molecules[3])

molecules[-2]

x <- 1:10
x
head(x, 1)

tail(x, 1)

x[1]

x[length(x)]

## create a vector of molecules that 
## contains "dna", 'dna', 'rna', 
## "protein", and "dna" using 
## molecules.

## -----------------------
## 




