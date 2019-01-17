## #############################################################################
## BIRTHS
##
## #############################################################################

## INIT ========================================================================
library(tidyverse)

## DATA ========================================================================
births  <- read_csv("https://github.com/IntroToData/IntroToData/raw/master/data/births.csv")
names(births) <-  c("row",
                    "facility",
                    "insurance",
                    "gender",
                    "length_of_stay",
                    "admitted",
                    "discharged",
                    "birth_weight",
                    "total_charges")

