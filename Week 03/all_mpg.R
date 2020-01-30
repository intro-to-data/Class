## This is an example R script.

library(tidyverse)
read_csv("all_mpg.csv")

dim(mpg)

# Do you like the color "rosy brown"?
ggplot(mpg, aes(displ, hwy)) +
    geom_point(color = "rosybrown3")


# Each person in this class has the data all_mpg stored in a different place.
# But I was able to write one script that worked everywhere, because I "knew"
# you would run it in a project.
