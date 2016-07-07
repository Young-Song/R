#Graph1

#using library vcd
library(vcd)
attach(Arthritis) 

#barplot
counts<-table(Improved)
barplot(counts,main="Simple Barplot",xlab="Improved",ylab="Freq", horiz=TRUE)

#Stack  barplot
#columns map to x axis, rows map to y axis
counts<-table(Improved,Treatment)
barplot(counts,xlab="T",ylab="F",col=c("r","y","g"),legend=row.names(counts))


#Mean barplot  using aggregate functions
states <- data.frame(state.region,state.x77)
means <- aggregate(state$Illiteracy,by=list(state.region),FUN=mean)
means <- means[order(mean$x),] # sort means by mean$x, select all rows, all columns
barplot(means$x,names.arg=means$Group.1)

#barplost adjustment
par(mar=c(5,8,4,2)) # margin
par(las) # style axis

#pie chart 
par(mfrow=c(2,2))
slices<-c(10,12,4,16,8)
lbls<-c("US","UK","Australia","Germany","France")
pie(slices,labels=lbls,main="Simple Pie Chart")
pct <- round(slices/sum(slices)*100)
lbls2 <- paste(lbls," ", pct, "%",sep="")
pie(slices,labels=lbls2,col=rainbow(length(lbls2)),main="Pie Chart with Percentages")
library(plotrix)
pie3D(slices,labels=lbls,explode=0.1,main="3D Pie Chart")
mytable <- table(state.region)
lbls3 <- paste(names(mytable),"\n",mytable,sep="")
pie(mytable,labels=lbls3,main="Pie Chart from a Table\n (with sample sizes)")


#dot chart
dotchart(mpg,labels=row.names(mtcars),cex=.7,main="Gas Mileage for Car Models",xlab="Mile Per Gallon")

# group sort colora
x <- mtcars[order(mpg),]
x$cyl <- factor(x$cyl)
x$color[x$cyl==4] <- "red"
x$color[x$cyl==6] <- "blue"
x$color[x$cyl==8] <- "darkgreen"
par(mar=c(10,4,4,2))
dotchart(x$mpg,labels=row.names(x), cex=0.7, gcolor="black", color=x$color, pch=19, main="gas mileage car model")

