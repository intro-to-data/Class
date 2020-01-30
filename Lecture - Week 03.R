## Week 03 Lecture Code
## By: Your Name Here

## INIT ========================================================================
library(knitr)
library(tidyverse)
library(readxl)

## Use variables. It is easier to read and more flexible.
data_url <- "https://www.fueleconomy.gov/feg/epadata/20data.zip"
local_file <- "mpg20.zip"

## DATA ========================================================================

# Downloads the ZIP file, unzips it in your project directory.
download.file(url = data_url, destfile = local_file)
unzip(local_file)
dir(pattern="xlsx")

# Now, let's import the Excel file.
# This would not work right if there were more than one.
data_file <- dir(pattern="xlsx")
Mpg <- read_excel(data_file)
head(Mpg)


## STOP!!!! ====================================================================
## Let's talk about GRAIN.
## Like quinoa, wheat, etc.


names(Mpg)
attributes(Mpg)$labels <- names(Mpg)

col_names <- names(Mpg)

## Generic Changes
col_names <- gsub("- Conventional Fuel", "", col_names, fixed=TRUE)
col_names <- gsub("- Alternative Fuel", "", col_names, fixed=TRUE)
col_names <- gsub(" ", "", col_names, fixed=TRUE)
col_names <- gsub(".", "", col_names, fixed=TRUE)
col_names <- gsub("?", "", col_names, fixed=TRUE)
col_names <- gsub(",", "", col_names, fixed=TRUE)
col_names <- gsub("-", "", col_names, fixed=TRUE)
col_names <- gsub("%", "", col_names, fixed=TRUE)
col_names <- gsub("#", "N", col_names, fixed=TRUE)

# Specific Tweaks
col_names[6] <- "Indexed"
col_names[10] <- "CityFECF"
col_names[11] <- "HwyFECF"
col_names[12] <- "CombFECF"
col_names[13] <- "CityUnadjFECF"
col_names[14] <- "HwyUnadjFECF"
col_names[15] <- "CombUnadjFECF"
col_names[16] <- "CityUnrdUnadjFECF"
col_names[17] <- "HwyUnrdUnadjFECF"
col_names[18] <- "CombUnrdUnadjFECF"
col_names[19] <- "Guzzler"
col_names[30] <- "MaxEthanolGasoline"
col_names[31] <- "MaxBiodiesel"
col_names[32] <- "Range1CF"
col_names[33] <- "FuelUsageCF"
col_names[151] <- "MoneySaved5Year"
col_names[152] <- "MoneySpend5Year"
col_names[157] <- "ChargeTimeat240volts"
col_names[158] <- "ChargeTimeat120volts"
col_names[159] <- "PHEVRange"

## How can we change:
## [46] "EPA Calculated Annual Fuel Cost  -----  Annual fuel cost error. Please revise Verify."

names(Mpg) <- col_names


## EDA

## Let's discuss why I do the aesthetic in the ggplot command.
ggplot(data = Mpg, aes(x = CityFECF)) +
    geom_density() +
    facet_wrap(~MfrName)

ggplot(data = Mpg, aes(x = FuelUsageCF, y = CityFECF, color = FuelUsageCF )) +
    geom_boxplot()

Tmp <- Mpg %>% filter(MfrName == "Honda")
ggplot(data = Tmp, aes(x = Carline)) +
    geom_bar() +
    theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = .45))

ggplot(data = Mpg, aes(x = MfrName, y = NCyl)) +
    geom_count() +
    theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = .45))

Mpg %>%
    group_by(MfrName) %>%
    summarize(MeanCityFECF = mean(CityFECF),
              SDCityFECF   = sd(CityFECF))



## DPLYR Transformations (Single Table)
## - filter
## - select
## - arrange
## - mutate
## - summarize
## - group_by
