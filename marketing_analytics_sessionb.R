cars <- read_csv("./cars.csv")
problems(cars)


cars <- cars[, c(1:3,5:8)]

cars

cars$price <- cars$`Car Value`

names(cars)


chisq.test(cars$price, y = NULL, correct = TRUE,
           p = rep(1/length(x), length(x)), rescale.p = FALSE,
           simulate.p.value = FALSE, B = 2000)

chisq.test(cars$price, cars$Gender)

chisq.test(cars$price, cars$Marital)

chisq.test(cars$price, cars$Retired)

chisq.test(cars$price, cars$Newpaper)

chisq.test(cars$`2013 Satisfaction`, cars$Newpaper)

t.test(cars$`2013 Satisfaction`, cars$Newpaper)

?t.test

#Does Gender Affect Car Price?  Run t-test to compare mean
#Does Marital Affect Car Price?  Run t-test to compare mean
#Does Retired Status Affect Car Price?  Run t-test to compare mean
#Does Newspaper Affect Car Price?  Run t-test to compare mean
#Paired Sample - 2013 Satisfaction = 2014 Satisfaction

str(cars)
cars$`2013 Satisfaction` <- factor(cars$`2013 Satisfaction`)
cars$`2014 Satisfaction` <- factor(cars$`2014 Satisfaction`)

table(cars$`2013 Satisfaction`, cars$`2014 Satisfaction`, dnn = c("2013, 2014"))

with(cars, ftable(`2013 Satisfaction`, `2014 Satisfaction`))

#Syndicated Data that Tracks Sales for Manufacturers - Aggregated by Channel
#IRI & AC Nielsen data

?table
