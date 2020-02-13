## Intro To Relational Data
## This is one of my favorite topics.



## INIT ========================================================================
library(knitr)
library(tidyverse)
library(DBI)
source()



## DATA =======================================================================
download.file(url = "https://github.com/intro-to-data/Data/raw/master/chinook.db",
              destfile = "chinook.db")
con <- dbConnect(RSQLite::SQLite(), dbname = "chinook.db")
##dbListTables(con)
Albums         <- dbReadTable(con, "albums") %>% as_tibble()
Artists        <- dbReadTable(con, "artists") %>% as_tibble()
Customers      <- dbReadTable(con, "customers") %>% as_tibble()
Employees      <- dbReadTable(con, "employees") %>% as_tibble()
Genres         <- dbReadTable(con, "genres") %>% as_tibble()
InvoiceItems   <- dbReadTable(con, "invoice_items") %>% as_tibble()
Invoices       <- dbReadTable(con, "invoices") %>% as_tibble()
MediaTypes     <- dbReadTable(con, "media_types") %>% as_tibble()
PaylistsTracks <- dbReadTable(con, "playlist_track") %>% as_tibble()
Playlists      <- dbReadTable(con, "playlists") %>% as_tibble()
Tracks         <- dbReadTable(con, "tracks") %>% as_tibble()
dbDisconnect(con)



## SINGLE TABLE TRANSFORMATIONS ================================================
## Each table has it's own grain. And these grains intersect and have
## relationships with each other.
## We will start with Tracks.

## How many Albums?
Tracks %>%
    select(AlbumId) %>%
    distinct() %>%
    count()

## How many Tracks per album?
Tracks %>%
    group_by(AlbumId) %>%
    summarize(Tracks = n())

## How many Albums have 10 or more Tracks?
Tracks %>%
    group_by(AlbumId) %>%
    summarize(Tracks = n()) %>%
    filter(Tracks >= 10)

## These are all transformation we can do with a single table.  IRL,
## most data is stored in a relational data structure.  When you do a
## statistical anslysis, you need a flat view of the data.  You have
## to reduce the complexity we are going to discuss today, and boil it
## down to a single table. But to do that, you have to master
## relational data.

## This is where traditional statisticians tend to get stuck.



## SINGLE ALBUM DEEP DIVE ======================================================
## https://en.wikipedia.org/wiki/Restless_and_Wild
## https://www.youtube.com/watch?v=VUrkcK9DT-I

## Let's look at tracks from a single Album.
## Specifically, AlbumId == 3.
## Let me see all the rows.
Tracks %>%
    filter(AlbumId == 3) %>%
    kable()

## Let's talk about Keys.
## TrackId: Primary Key
## AlbumId: Foreign Key
## MediaTypeId: Foreign Key
## GenreId: Foreign Key

## Now, what do you see in Albums where AlbumId is 3?
## AlbumId in Tracks "maps" to AlbumId in albuns.
## In Albums, AlbumId is a primary key.
## Primary keys and foreign keys tend to connect!
Albums %>%
    filter(AlbumId == 3) %>%
    kable()

## ArtistId in Albums is a foreign key in Artists.
## Get the artist where ArtistId is 2.
Artists %>%
    filter(ArtistId == 2) %>%
    kable()

## The relationships between primary keys and foreign keys are often
## shown in a Entity Relationship Diagram (ERD). In an
## academic/learning setting, you will almost always have an ERD. In
## practice/reality, these things are as rare as a unicorn.
## Chinook ERD: http://schemaspy.org/sample/relationships.html



## FIRST JOINS =================================================================
## Traversing the ERD by looking into each table manually is . . . inefficient.
## So, we can COMBINE the tables.

## BE VERY CAREFUL, FooId and FooID are different!

## Return the name of the album and Tracks.
## This query only returns the first 25.
Tracks %>%
    inner_join(Albums, by = "AlbumId") %>%
    select(Title, AlbumId, Name, TrackId) %>%
    kable() %>%
    head(25)

## Join Playlists to PaylistsTracks
## Show how many tracks are in each playlist.
Playlists %>%
    inner_join(PaylistsTracks, by = "PlaylistId") %>%
    group_by(PlaylistId, Name) %>%
    count()

## What are the names of Playlists with 25 or more tracks?
## You can reuse your previous code.
Playlists %>%
    inner_join(PaylistsTracks, by = "PlaylistId") %>%
    group_by(PlaylistId, Name) %>%
    count() %>%
    filter(n >= 25)

## What is the name of customer with the most Invoices?
Customers %>%
    inner_join(Invoices, by="CustomerId") %>%
    group_by(FirstName, LastName) %>%
    count() %>%
    arrange(desc(n)) %>%
    kable()


## What is the highest value Invoice?
Invoices %>%
    inner_join(InvoiceItems, by = "InvoiceId") %>%
    group_by(InvoiceId) %>%
    summarize(Value = sum(UnitPrice)) %>%
    arrange(desc(Value))


## Who are the most valuable customers?
Invoices %>%
    inner_join(InvoiceItems, by = "InvoiceId") %>%
    group_by(CustomerId) %>%
    summarize(Value = sum(UnitPrice)) %>%
    inner_join(Customers, by = "CustomerId") %>%
    select(FirstName, LastName, Value) %>%
    arrange(desc(Value))
