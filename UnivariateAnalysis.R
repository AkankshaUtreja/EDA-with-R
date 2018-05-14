# The goal is assess the overall performance of business by analyzing who is coming
# to our website and what they do during their visit

require(xlsx)
zapposdata <- read.xlsx("ZapposData.xlsx",1)
zapposdata <- as.data.frame(zapposdata)


# Let's see which columns are there in the dataset
dim(zapposdata)
names(zapposdata)
data = data[,1:12]
str(zapposdata)


## Adding a column month, which will help in grouping data and bring 
## clarity.

require(lubridate)
zapposdata$month <- month(zapposdata$day,label = TRUE,abbr = TRUE)


##Now, starting with visualizations. 
# We can find out the popularity of Zappos among the various sites using the
#following code. --1

library(ggplot2)
qplot(x=site,data = zapposdata, main="Popularity Among Sites")+ geom_bar(fill=rainbow(6))

## Let's see the old customer count vs the new customer count.

library(ggplot2)
colors=c("red", "violet")
table(zapposdata$new_customer)
slices <- c(5811,5441)
lbls <-c("Old Customers","New Customers")
pct <- round(slices/sum(slices)*100)
lbls <- paste(lbls, pct) 
lbls <- paste(lbls,"%",sep="") 
pie(slices, labels = lbls, col = rainbow(length(lbls)),main = "Old Customers vs New Customers")

# We can analyze how was performance for different months i.e how was
# popularity for different months.


qplot(x=month, data = zapposdata, main = "Monthly count") 

# We can find the popularity of platform for Zappos site or in other
#words which platform users most frequently visit our site.

library(ggplot2)
qplot(x=platform, data = zapposdata, main = "Platform Popularity") + geom_bar(fill=rainbow(15))

##Removing the NA values,

library(ggplot2)
qplot(x=platform, data = subset(zapposdata,!is.na(platform)), 
      main = "Platform Popularity")+ geom_bar(fill=rainbow(14))



## Calculating the numerical summary

summary(zapposdata)


