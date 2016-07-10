# A prediction of USA GDP of 1st quarter in 2016


download csv file from Fred Economic Research 

# read csv file into a data.frame 
gdp<-read.csv("gdp.csv")
str(gdp)

# extract gdp as a column vector
gdp_values <- gdp[["GDP"]]

# factors are year , quarter
year<-rep(2009:2015,each=4)
quarter<-(1:4,7)

# test correlation between year and gdp, correlation between gdp and quarter


# A linear regression 
fit<-lm(gdp_values~year+quarter)

# coefficients
fit$coefficients

# predict 2016 1st quarter GDP (Real value: 18230.1)
newData <- data.frame(year=2016,quarter=1)
predict(fit,newData)


# plot 3D
library(scatterplot3d)
s3d<-scatterpot3d(year,quarter,gdp_values,hightlight.3d=T,type="h",lab=c(2,3)) 
s3d$plane(fit)

# Generalized Linear Model
gdp.glm<-glm(gdp_values~year+quarter,family=gaussian("log"),data=gdp)
summary(gdp.glm)
pred <- predict(gdp.glm,type="response")
plot(pred,xlab="Observed",ylab="Prediction")



