## #############################################################################
## LAB 2: Visualization
##
## #############################################################################



## =============================================================================
## INTRODUCTION
##
## - Now you know how to access specific rows/columns
## - We can use that knowledge to start drawing (which is more fun)
## - GGPlot2 v Base R
##
## =============================================================================



## =============================================================================
## Outline
##
## - Install/Load the tidyverse
## - (Re)-Load some data
## - Draw!
## =============================================================================

## Install the Tidyverse!
## You don't have to do this (again),
## if you did this while reading the book
install.packages("tidyverse")
library(tidyverse)

## In case you closed R, load the data
data(ChickWeight)
str(ChickWeight)



## =============================================================================
## GGPLOT
##
## - "The Grammar Of Graphics"
## - Think in layers
## =============================================================================

## -----------------------------------------------------------------------------
## Univariate
## -----------------------------------------------------------------------------

## Histogram of weight
ggplot(data = ChickWeight, mapping = aes(x = weight)) +
    geom_histogram(fill="darkred", color="black")

## Note the Warning about bins . . . what is this telling us?

## Kernel Density Plot of weight
ggplot(data = ChickWeight, mapping = aes(x = weight)) +
    geom_density(fill="darkred", color="black", alpha=.75)

## The code for these two graphs is NEARLY identical.
## But the results are quite different.

## But - do they make any sense?
## What are we graphing?

ggplot(data = ChickWeight[ChickWeight$Time == 21,],
       mapping = aes(x = weight)) +
    geom_density(fill="darkred", color="black", alpha=.75)

## That looks better! Why?

## Maybe what we want is a two dimensional plot?
## We'll do that in a moment.

## Number of cases by Diet type
ggplot(data = ChickWeight, mapping = aes(x = Diet)) +
    geom_bar(fill="darkred", color="black")
 
## What is the difference between a histogram and a barplot?

## OK - Pie Charts
## I want to take a minute to say terrible things about pie charts
## http://www.businessinsider.com/pie-charts-are-the-worst-2013-6


## -----------------------------------------------------------------------------
## Bivariate
## -----------------------------------------------------------------------------

## Scatter Plot of weight as a function of days
ggplot(data = ChickWeight, mapping = aes(x = Time, y = weight)) +
    geom_point(color="darkred", size=3, alpha=.5)

## Question: What do you see in this graph?
## Question: What might you want to change about it?

## Let's turn our scatter plot into a box plot!
ggplot(data = ChickWeight, mapping = aes(x = Time, y = weight)) +
    geom_boxplot(color="darkred")

## Ooh. That didn't work because Time is a number column:
typeof(ChickWeight$Time)

## A box plot has NO idea wat to do with a number on the X Axis
## So, we have to tell R to treat Time as a categorical variable (factor)
ggplot(data = ChickWeight, mapping = aes(x = as.factor(Time), y = weight)) +
    geom_boxplot(color="darkred")

## Scatter Plot of weight as a function of days with a regression
ggplot(data = ChickWeight, mapping = aes(x = Time, y = weight)) +
    geom_point(color="darkred", size=3, alpha=.5) +
    geom_smooth()

ggplot(data = ChickWeight, mapping = aes(x = Time, y = weight)) +
    geom_point(color="darkred", size=3, alpha=.5) +
    geom_smooth(method="lm")

ggplot(data = ChickWeight, mapping = aes(x = Time, y = weight)) +
    geom_point(color="darkred", size=3, alpha=.5) +
    geom_smooth(method="lm", formular = y~x)

## -----------------------------------------------------------------------------
## Multivariate
## -----------------------------------------------------------------------------

## How can we look at the relationship between Time and weight for
## each diet type?

## Hint: There are several ways!


ggplot(data = ChickWeight, mapping = aes(x = Time, y = weight, color = Diet)) +
    geom_point(size=3, alpha=.5) +
    geom_smooth()

ggplot(data = ChickWeight, mapping = aes(x = Time, y = weight, color = Diet)) +
    geom_point(size=3, alpha=.5) +
    geom_smooth() +
    facet_wrap(~Diet)

## What is going on Diet #2?


## =============================================================================
## Debrief
##
## - GGPlot is a flexible package (part of the Tidyverse) which makes it possible
##   to make complex, informative plots with only a limited amount of code
## - We only scratched the surface of GGPlot. You can control almost ANY part of
##   the graph, but that is a discussion for another day.
## - DOCUMENTATION: http://ggplot2.tidyverse.org/reference/index.html
##
## =============================================================================

## Take 10!
