# R Regression

#linear regression
fit <- lm(weight ~height, data = women)
summary(fit)

plot(height,weight)
abline(fit)

#polynomial regression
fit2 <- lm(weight~height+I(height^2),data=women)
summary(fit2)

plot(women$height,women$weight,xlab="Height", ylab="Weight")
lines(women$height,fitted(fit2))

# (installl car library) scatterplot
library(car)
scatterplot(weight~height, data=women,spread=FALSE, lty.smooth=2,pch=19,main="Women age 30- 39",xlab="Height",ylab="Weight")

# create a data frame that has particular columns
states <- as.data.frame(state.x77[,c("Murder","Population","Illiteracy","Income","Frost")])

# since there are more variables on right hand side, can't plot
# but summary shows the coefficient of each variable
fit <- lm(Murder ~ Population +Illiteracy +Income +Frost, data =states)
summary(fit)



