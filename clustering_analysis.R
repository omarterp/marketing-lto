#install.packages("foreign")
install.packages("cluster")
install.packages("ClustOfVar")
install.packages("FactoMineR")

library(foreign)
library(dplyr)
library(cluster)
library(ClustOfVar)
library(readr)
library(FactoMineR)




devices <- dev.list()
lapply(devices, dev.off)


session_six <- tbl_df(read.spss("./session_six1.sav", to.data.frame = TRUE))

session_sixa <- tbl_df(read.spss("./session_six2.sav", to.data.frame = TRUE))


write_csv(session_sixa, "./yash.csv")

dir()


customer <- tbl_df(read.spss("./customer.sav", to.data.frame = TRUE))


#str(customer)

#transform to numerics --> Discretize

quant <- as.data.frame(customer %>%
  select( age, employ, income, reside, cars))

qual <- as.data.frame(customer %>%
  select(townsize, gender, edcat, marital, homeown ))


str(quant)

a <- kmeansvar(quant, qual, init = 4, iter.max = 100)



par(mfrow = c(2, 1))

tree <- hclustvar(quant)
plot(tree)
#choice of the number of clusters
stability(tree,B=100)
part <- cutreevar(tree,2)
print(part)d
summary(part)


par(mfrow = c(2, 1))
data(decathlon)
tree <- hclustvar(decathlon[,1:10])
plot(tree)
#choice of the number of clusters
stability(tree,B=40)
part <- cutreevar(tree,4)
print(part)
summary(part)




a$var

str(a)

kmeans(quant, centers = 2)

#Factor Analysis
test <- session_sixa[, -c(1:4)]


a <- DMFA(test, num.fact = 12, ncp = 4 )

str(a)

?DMFA




