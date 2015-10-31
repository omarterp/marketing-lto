read_csv("./mlr1.csv")


mlr1 <- read_csv("./mlr1.csv")

mlr2 <- read_csv("./mlr2.csv")

#Week	SALES	PRICE	FEATURED	DISPLAY	TPR (Temporary Price Reduction)	Holiday


str(mlr1)

mlr1$SALES <- as.integer(str_replace_all(mlr1$SALES, ",", ""))

#graph
p <- ggplot(mlr1)
p + geom_line(aes(x=Week, y=SALES, color=SALES))

?geom_line()

#regression - variable importance


#correlation matrix

#business drivers

#Durbin Watson

###Relationships between Covariance###

#d <- data.frame(x1=rnorm(10),
#                x2=rnorm(10),
#                x3=rnorm(10))


M <- cor(d) # get correlations

install.packages("corrplot")
library('corrplot') #package corrplot
corrplot(M, method = "circle") #plot matrix

str(mlr2)

p <- ggplot(mlr2)
p + geom_line(aes(x=Date, y=SALES, color=SALES))

names(mlr2) <- c("date","week", "sales", "acv_disp_only_pct",
                 "acv_feat_only_pct", "acv_tpr_only", "acv_wtd_dist",
                 "avg_items_per_store", "avg_unit_price")

mlr2$sales <- as.integer(str_replace_all(mlr2$sales, ",", ""))


mlr2[, -1]


# Correlation Matrix

str(mlr2)
#mlr2$year <- 
  
#as.integer(
  
mlr2$year <- as.integer(str_replace(str_sub(mlr2$date, str_length(mlr2$date) - 4, str_length(mlr2$date) ), " ", ""))

M <- cor(na.omit(mlr2[, -1])) # get correlations

install.packages("corrplot")
library('corrplot') #package corrplot
corrplot(M, method = "circle") #plot matrix

