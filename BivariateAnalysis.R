require(xlsx)
zapposdata <- read.xlsx("ZapposData.xlsx",1)
zapposdata <- as.data.frame(zapposdata)


## Lets try to find how many visits actually convert to orders
## by carrying out bivariate analysis between orders and visits.

ggplot(aes(x=visits,y=orders),data=subset(zapposdata,visits>1))+geom_point()

## Lets find the correlation between the two.

cor.test(zapposdata$visits, zapposdata$orders)

# 0.1463409

# Lets find the relationship between visits and bounces.

ggplot(aes(x=visits,y=bounces),data=zapposdata)+geom_point()

##To remove the outliers,

ggplot(aes(x=visits,y=bounces),data=zapposdata)+geom_point()+xlim(0,quantile(zapposdata$visits,0.95))+ylim(0,quantile(zapposdata$bounces,0.95))

## Finding the correlation between visits and bounces,
cor.test(zapposdata$visits,zapposdata$bounces)

##Lets try to find the relation between the add to cart and bounces

ggplot(aes(x=add_to_cart,y=bounces), data = zapposdata)+geom_line() + xlim(0,quantile(zapposdata$add_to_cart,0.95))

cor.test(zapposdata$add_to_cart,zapposdata$bounces)

## Let's try to find which website generates the maximum revenue.

qplot(x=site,y=gross_sales,data=zapposdata)+ geom_col(color="orange")


## Let's try to find which platform generates the maximum revenue.

qplot(x=platform,y=gross_sales,data=subset(zapposdata,!is.na(platform)))+ geom_col(color="orange")





