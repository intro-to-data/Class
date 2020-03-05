# Instructions

The goal of this midterm is to help me understand what you have learned
thus far in our time together. As with all other tasks in this course, I
am going to treat you like programmers, with a few caveats. To complete
the tasks in this exam, you may use the following:

  - Any/all class lecture notes, labs, cheat sheets from RStudio, etc.
  - The book for this class: <https://r4ds.had.co.nz/>
  - Google (If you are really desperate, Bing.)
  - Stack Overflow

However, I must require you to complete your own exam. You may not help
anyone else in this class and you may not accept help from anyone else
in the class.

If you have any questions, please ask me. Any clarifications I make will
be announced to the entire class.

The layout of the midterm is identical to the labs you have completed.
Complete the tasks below and answer the associated questions in Canvas.

# SETUP

1.  Create a folder called “Midterm”.
2.  Create a script, “No Shows.R” into that folder.
3.  Copy/paste the following into RStudio. Replace `Your Name` with . .
    . . your name.
4.  After running the code below, confirm that you have created a table
    called Appointments. It should contain:
      - 110,527 rows
      - 15 columns

<!-- end list -->

``` r
## Your Name
## Midterm - No Shows


## INIT ========================================================================
library(tidyverse)

## For large/small numbers, R likes to use scientific notation. This makes the
## numbers easier to read. None of these numbers warrant scientific notation.
options(scipen = 999)

## DATA ========================================================================
appointments_url <- "https://raw.githubusercontent.com/intro-to-data/Data/master/Appointments.csv"
Appointments <- read_csv(appointments_url)
```

    ## Parsed with column specification:
    ## cols(
    ##   AppointmentID = col_double(),
    ##   PatientID = col_double(),
    ##   Gender = col_character(),
    ##   AppointmentDate = col_datetime(format = ""),
    ##   AppointmentDay = col_character(),
    ##   AppointmentMonth = col_character(),
    ##   Age = col_double(),
    ##   Neighbourhood = col_character(),
    ##   Scholarship = col_logical(),
    ##   Hipertension = col_logical(),
    ##   Diabetes = col_logical(),
    ##   Alcoholism = col_logical(),
    ##   Handcap = col_logical(),
    ##   ReceivedSMS = col_logical(),
    ##   NoShow = col_logical()
    ## )

``` r
head(Appointments)
```

    ## # A tibble: 6 x 15
    ##   AppointmentID PatientID Gender AppointmentDate     AppointmentDay
    ##           <dbl>     <dbl> <chr>  <dttm>              <chr>         
    ## 1       5642903   2.99e13 F      2016-04-29 00:00:00 Fri           
    ## 2       5642503   5.59e14 M      2016-04-29 00:00:00 Fri           
    ## 3       5642549   4.26e12 F      2016-04-29 00:00:00 Fri           
    ## 4       5642828   8.68e11 F      2016-04-29 00:00:00 Fri           
    ## 5       5642494   8.84e12 F      2016-04-29 00:00:00 Fri           
    ## 6       5626772   9.60e13 F      2016-04-29 00:00:00 Fri           
    ## # … with 10 more variables: AppointmentMonth <chr>, Age <dbl>,
    ## #   Neighbourhood <chr>, Scholarship <lgl>, Hipertension <lgl>,
    ## #   Diabetes <lgl>, Alcoholism <lgl>, Handcap <lgl>, ReceivedSMS <lgl>,
    ## #   NoShow <lgl>

Remember, you must load your packages (`tidyverse`, etc.) and data for
EACH session in R. Just beause you had the `tidyverse` loaded last time
means nothing for the current session.

**Hint:** Run all of the preceding code.

# Appointments

A no-show appointment occurs when a patient makes an appointment with
their doctor, receives all of the instructions, and does not come to
their appointment. Understanding the likelihood of a patient skipping
their appointment is helpful for providers and their staff.

Although this data set is specific to Brazil and is taken from Kaggle,
this is a very real problem we work on here in the Capital District.
With that said, this data is specific to the context from which it was
collected. Do not assume the patterns seen in this data are necessarily
true here. Context matters.

<https://www.kaggle.com/joniarroba/noshowappointments>

**Grain:** Each row of data is a *single appointment*. A patient may
have more than one appointment. (Many do.)

## Data Dictionary

  - PatientId: Unique identifier for that patient.
  - AppointmentID: Unique identifier for each appointment
  - Gender: Male (M) or Female (F).
  - AppointmentDate: The Date (YYYY-MM-DD) of the appointment
  - AppointmentDay: An abbreviation of the name of the day of the
    appointment (Mon, Tue, etc.)
  - AppointmentMonth: The abbreviation of the name of the month of the
    appointment.
  - Age: Patient age, on the day of the appointment, in years.
  - Neighbourhood: Where the appointment takes place.
  - Scholarship: TRUE or FALSE
      - For more detail:
        <https://en.wikipedia.org/wiki/Bolsa_Fam%C3%ADlia>
  - Hipertension: Does the patient have hypertension? TRUE or FALSE
      - Note the unusual spelling of this column.
  - Diabetes: Does the patient have diabetes? TRUE or FALSE
  - Alcoholism: Does the patient have diabetes? TRUE or FALSE
  - Handcap: Does the patient have a handicap? TRUE or FALSE
      - Note the unusual spelling of this column.
  - ReceivedSMS: Did the patient receive a SMS? TRUE or FALSE
  - NoShow: Did the patient no-show? TRUE or FALSE
      - **Hint:** R treats Boolean TRUE values as equal to 1 and FALSE
        values as equal to 0. You can sum a column of TRUE/FALSE values
        to get the count of TRUE.

# Remember:

![](https://imgs.xkcd.com/comics/integration_by_parts.png)

# Tasks

## Task 01: How Many No-Shows?

  - How many appointments were recorded as a no-show?
  - When you create a new column via summarize, I recommend you give it
    a name, so you can later sort it, call it, etc. In this case,
    calling the `sum()` `N` seems appropriate.

<!-- end list -->

``` r
## Task 01: How Many No-Shows?
Appointments %>%
    summarize()
```

## Task 02: No-Shows by Neighbourhood?

  - Which neighbourhood had the most no-shows?
  - **Hint:** Spelling matters.
  - You can use your code from Task 01 to help you.
  - You can thank me now for recommending you name the sum of NoShow.

<!-- end list -->

``` r
## Task 02: No-Shows by Neighbourhood?
Appointments %>%
    group_by() %>%
    summarize() %>%
    arrange()
```

## Task 03: 822145925426128

  - How many appointments did 822145925426128 (`PatientID`) have?
  - How many no-shows did 822145925426128 have?

<!-- end list -->

``` r
## Task 03: 822145925426128
Appointments %>%
    filter()
```

## Task 04: No-Shows For Patients Over 50

  - How many no-shows were recorded by patients over the age of 50?

<!-- end list -->

``` r
## Task 04: No-Shows For Patients Over 50
```

## Task 05: Average Age NoShow

  - What is the average age of a no-show patient?
  - What is the standard deviation of the age of a no-show patient
    (`sd()`)?

<!-- end list -->

``` r
## Task 05: Average Age NoShow
```

## Task 06: ReceivedSMS

  - One popular intervention for no-shows is to call patients before
    their appointment, to remind them of their upcoming appointment.
  - In `Appointments` we have a column called `ReceivedSMS`. Where
    `TRUE`, these patients received a text message reminding them of
    their upcoming appointment.
  - Who had a higher no-show rate?
      - ReceivedSMS == TRUE
      - ReceivedSMS == FALSE

<!-- end list -->

``` r
## Task 06: ReceivedSMS
Appointments %>%
    group_by() %>%
    summarize() %>%
    mutate()
```

## Task 07: Chronic Conditions

  - Create a new table, called `NoShowRate` which compares the no-show
    rate of two groups.
      - Use this to compare the no-show rate of patients with/without
        hypertension and diabetes.
  - Create a bar plot (`geom_col()`) comparing the rate of no-shows per
    1,000 appointments.
  - Create a separate plot for those with/without hypertension and
    with/without diabetes.
  - Please upload the diabetes plot.
      - Remember, you can export a plot from RStudio.
  - Compared to the rest of the population, how would you describe the
    no-show rate of patients with these chronic conditions?
      - Higher no-show rate
      - Lower no-show rate
      - Similar no-show rate

<!-- end list -->

``` r
## Task 07: Chronic Conditions
##Hint: Name your results in both summarize and
## mutate so you can use them as variables later.
NoShowRate <-
    Appointments %>%
    group_by() %>%
    summarize() %>%
    mutate()

## geom_col expects a defined column for x and y.
ggplot(NoShowRate, aes()) + geom_col()
```

## Task 08: Distribution of No-Shows

  - Create a new table, called `NoShowCounts`.
  - The `Appointments` table is at the appointment grain.
  - This new table, `NoShowCounts`, should be at the patient grain. This
    means each row in `NoShowCounts` should be a single patient and no
    patient should duplicate.
  - Create a histogram showing the distribution of no-show appointments.
      - Upload your histogram of no-shows.
  - How many distinct patients are in your `NoShowCounts` table?
      - If you made your table right, this should be the number of rows
        in your `NoShowCounts` table.
  - How would you describe the distribution of no-shows?
      - Normally distributed
      - Skewed

<!-- end list -->

``` r
## Task 08: Distribution of No-Shows
NoShowCounts <-
    Appointments

ggplot(NoShowCounts, aes()) +
    geom_histogram()
```

## Task 09: New Column Over50

  - Create a column which identifies patients who are over 50 years old.
  - Call this new column `Over50`. (Use `mutate()`)
  - This column should contain TRUE/FALSE values for each appointment.
    In other words, this new column goes into the `Appointments` table,
    not a new table.
  - How would you describe the no-show rate of patients over 50 compared
    to other patients?
      - Higher
      - Lower
      - About the same
  - Once you have created your new column, this is very similar to Task
    7.  
<!-- end list -->

``` r
## Task 09: New Column Over50
## There's no code stub, but your code
## should create a new copy of Appointments.
```

## Task 10: Upload your code

  - Upload your .R file.
  - Please and thank you.
  - Have a great spring break.

<!-- end list -->

``` r
## Task 10: Upload your code
## You don't really need to write any code here.
```

![](https://imgs.xkcd.com/comics/convincing.png)
