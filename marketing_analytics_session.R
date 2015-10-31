library(stringr)
library(readr)
library(ggplot2)
library(dplyr)


setwd("C:/tmp/marketing_analytics")


marketing_data <- read_csv("./DAPT Session Two _ October 9 2015.csv")


md_tbldf <- tbl_df(marketing_data)
md_tbldf


summary(md_tbldf)

#t test
t.test(md_tbldf$avg_mon_bill~md_tbldf$gender)


p <- ggplot(md_tbldf,)

#coefficient of variation
cov <- function(mean, sd) { (mean/sd) * 100}

#assess mean : t-test
#assess standard deviation : f-test
#Distribution (Expected) chi-square test #NON-PARAMETRIC TEST (Contingency Table)
  #Sum of (Observed and Expected ^2 / Expected)

View(md_tbldf)


names(md_tbldf)

names(md_tbldf) <- c("gender", "avg_month_talk_min", "avg_mon_bill", "length_of_service", "household_income", "satisfaction")

mean_bill_by_male <- mean(unlist(md_tbldf %>%
  filter( gender == 2 ) %>%
  select( avg_mon_bill )))

sd_bill_by_male <- mean(unlist(md_tbldf %>%
                                   filter( gender == 2 ) %>%
                                   select( avg_mon_bill )))

mean_bill_by_female<- mean(unlist(md_tbldf %>%
                                   filter( gender == 1 ) %>%
                                   select( avg_mon_bill )))



#Non-parametric 

#Cross Tabs - Contingency Tables






?t.test(md_tbldf$`Average Monthly Bill`~md_tbldf$Gender)

