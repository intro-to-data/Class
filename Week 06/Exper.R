
library(tidyverse)

InvoiceThings <- 
    Invoices %>%
    inner_join(InvoiceItems, by = "InvoiceId") %>%
    inner_join(Customers, by = "CustomerId")

What <- 
    InvoiceThings %>%
    ##filter(InvoiceId == 1) %>%
    group_by(FirstName, LastName) %>%
    summarize(BadTotal = sum(Total),
              Total    = sum(UnitPrice*Quantity))
