## #############################################################################
## LAB 1: Baby Steps
##
## #############################################################################



## =============================================================================
## INTRODUCTION
##
## - A comment starts with "#"
## - I use comments to discuss AND to provide "structure" in the script.
## - Don't just watch . . . DO!
##
## =============================================================================



## =============================================================================
## ChickWeight
##
## Data from an experiment on the effect of diet on early growth of chicks.
## =============================================================================

## Load/View the data --------------------------------------
data(ChickWeight)                       ## We will import data later, promise

## Now that our data is loaded . . . what can we learn?
?ChickWeight                            ## HELP!
View(ChickWeight)                       ## Demonstrate CLI & GUI
head(iris)                              ## Quick view of the data
dim(ChickWeight)                        ## Starting to get META
names(ChickWeight)                      ## I do this but RStudio likes to help you
str(ChickWeight)                        ## Discuss data types!!!
summary(ChickWeight)                    ## Lots of info!

## Discuss: In each of row of code . . . there is an object (a
## data.frame) being acted on by a function.

## Row -----------------------------------------------------
## IMP: [] is the index operator. You will see it . . . alot.
## IMP: [ROW, COL]
ChickWeight[14,]                        ## A single row
ChickWeight[14:17,]                     ## Or Several

## Columns (Vector) ----------------------------------------
ChickWeight$Chick                       ## A vector is a fancy way of saying "column"
ChickWeight[,3]                         ## NOTE: [ ,COL]
ChickWeight[,1:3]                         ## Or several!

## You can do Boolean logic! -------------------------------
## Don't ask me what unit weight is in because I don't know.
ChickWeight$weight
ChickWeight$weight == 50
ChickWeight$weight > 50
ChickWeight$weight < 50

## Boolean Logic returns a special type of data
TRUE == True
TRUE == "True"
FALSE == "FALSE"
TRUE == 1

## Return Specific Rows ------------------------------------
## We can combine boolean logic and indexing to filter the data
ChickWeight[ChickWeight$Chick == 4,]
ChickWeight[ChickWeight$Chick >= 45,]

## Return Specific Values From A Specific Vector -----------
ChickWeight$weight[ChickWeight$Chick == 4]



## QUIZ! =======================================================================
## Find a partner and try to answer the following questions.

## Note: Run this line of code to load the iris data set.
data(iris)

## Question 1: What is the ioris data set?

## Questions 2: How many row/columns are in it?

## Question 3: Return the vector (column) called Species. What Species
## are in iris?

## Question 4: What is the Species on row 10?

## Question 5: Return all Sepal.Width where Species is setosa



## Debrief =====================================================================
## - Vectors and Data.Frames are _VERY_ important to using/mastering R.
## - Confused? That's OK too. You are going to have LOTS of practice
## - Starting today.
## - PRO TIP: If I show you some code and you don't understand it. ASK A QUESTION!
##
## =============================================================================

## Take 10!
