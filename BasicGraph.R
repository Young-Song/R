# Graph in R - Basic

#interacting with R console
attach(mtcars)	#bind dataframe
plot(wt,mpg)
abline(lm(wt~mpg))	# lm linear model
detach(mtcars)

#Parameters par(name1=value1, name2=value2, ...)
par(lty=2)	 # 6 line types
par(pch=17)  # 25 plotting char
par(cex=1.5) # scale char extension 
par(lwd=1.8) # scale line width

# An example 
dose <- c(20,30,40,45,60)
drugA <- c(16,20,27,40,60)
drugB <- c(15,18,25,31,40)
opar <- par(no.readonly=TRUE)
par(pin=c(2,3))
par(lwd=2,cex=1.5)
par(cex.axis=.75,font.axis=3)
plot(dose,drugA,type="b",pch=19,lty=2,col="red")
plot(dose,drugB,type="b",pch=23,lty=6,col="blue",bg="green")
par(opar)
title(main="Main Title",sub="Sub-Title",xlab="X-axis",y="Y-axis")

#legend
legend("topright",inset=0.05,title="type",c("A","B"))

#text 
text(locator(1),"interact with mouse")
text(xData,yData,row.names)
