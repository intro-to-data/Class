## #############################################################################
## LAB 3: More Fun With Visualization
##
## #############################################################################



## =============================================================================
## INIT
## =============================================================================
library(tidyverse)



## =============================================================================
## DATA
## This is the Cards Against Humanity Poll.
## This is more fun than you should have in class. You can thank me later.
## All the details: https://thepulseofthenation.com/
##
## The function, read_csv, is part of the tidyverse.
## Don't worry too much about the importing/cleanup.
## Accept that it runs and smile.
##
## =============================================================================

cah <- read_csv("https://thepulseofthenation.com/downloads/201709-CAH_PulseOfTheNation_Raw.csv")
LongColNames <- names(cah)
ShortColNames <- c("Income",
                   "Gender",
                   "Age",
                   "AgeRange",
                   "PoliticalAffiliation",
                   "TrumpApproval",
                   "HighestLevelEducation",
                   "q7x",
                   "Race",
                   "Q6OTH1",
                   "MaritalStatus",
                   "Q7OTH1",
                   "q8x",
                   "ReplaceYouWithRobot",
                   "ClimateChange",
                   "TransformersMovies",
                   "q11x",
                   "ScientistsAreHonest",
                   "VaccinesAreSafe",
                   "BooksInPastYear",
                   "q14x",
                   "BelieveInGhosts",
                   "PercentBudgetScience",
                   "q16x",
                   "IsScienceFundingRight",
                   "WhereIsEarth",
                   "SmartSadDumbHappy",
                   "UrinateInShower")
names(cah) <- ShortColNames
cah <-
    cah %>%
    select(-q7x, -Q6OTH1, -Q7OTH1, -q8x, -q11x, -q14x, -q16x)



## =============================================================================
## EXPLORE
##
## - Let's just look at the data.
## - What do we have?
## =============================================================================

str(cah)
summary(cah)

## Categorical Tables
table(cah$BelieveInGhosts)
table(cah$BelieveInGhosts, cah$Gender)  ## Remember [ROW,COL]

## This one is probably a bit much.
round(100*prop.table(table(cah$BelieveInGhosts, cah$Gender)),2)



## =============================================================================
## VISUALIZATION
##
## =============================================================================

## BelieveInGhosts Counts ----------------------------------
ggplot(data = cah, mapping = aes(x = BelieveInGhosts)) +
    geom_bar()

## BelieveInGhosts Percents --------------------------------
ggplot(data = cah, mapping = aes(x = BelieveInGhosts)) +
    geom_bar(aes(y = 100*..count../sum(..count..)))

## BelieveInGhosts x Gender --------------------------------
## But . . . this is a percent of the total.
## Percent of total per Gender is harder than we can do today.
ggplot(data = cah, mapping = aes(x = BelieveInGhosts, fill = Gender)) +
    geom_bar(aes(y = 100*..count../sum(..count..)), position="dodge")

## But we can do it this way.
ggplot(data = cah, mapping = aes(x = BelieveInGhosts, fill = Gender)) +
    geom_bar(aes(y = 100*..count../sum(..count..))) +
    facet_wrap(~Gender)

## Age Distribution x Gender -------------------------------
## I want to look at continuous variables v categoricals
ggplot(data = cah, mapping = aes(x = Age, fill=Gender)) +
    geom_histogram() +
    facet_wrap(~Gender)

ggplot(data = cah, mapping = aes(x = AgeRange, fill=Gender)) +
    geom_bar() +
    facet_wrap(~Gender)

## And here it is, reduced to an average
## What does this lose?
mean(cah$Age)                           ## Age Over-all
mean(cah$Age[cah$Gender == "Male"])     ## Age For Men
mean(cah$Age[cah$Gender == "Female"])   ## Age For Women

## But sometimes a single number can provide context!
ggplot(data = cah, mapping = aes(x = Age, fill=Gender)) +
    geom_bar() +
    geom_vline(xintercept = mean(cah$Age), color = "darkred", size=1.5) +
    facet_wrap(~Gender)

## ---------------------------------------------------------
## Deeper Thinking!
## What is the difference between the barplot and the histogram?
## Can we make them more similar? More different?
## ---------------------------------------------------------



## =============================================================================
## YOUR TURN!
##
## We are going to split up into groups.
## Pick a question, and find one or more demographic variable that
## correlates strongly with it.
## =============================================================================

## Fun Questions:
cah$ReplaceYouWithRobot
cah$ClimateChange
cah$TransformersMovies
cah$ScientistsAreHonest
cah$VaccinesAreSafe
cah$BooksInPastYear
cah$BelieveInGhosts
cah$PercentBudgetScience
cah$IsScienceFundingRight
cah$WhereIsEarth
cah$SmartSadDumbHappy
cah$UrinateInShower

## Use LongColNames to see the entire question:
View(LongColNames)

## Use both ggplot() and table() to look at these.



## =============================================================================
## DEBRIEF
##
## - What didn't make sense today?
## - What would you like to know how to do?
## =============================================================================
