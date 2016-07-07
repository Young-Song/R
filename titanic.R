# load data into working environment
trainData <- read_csv("train.csv")
str(trainData)
#table counts occurrence of each value
table(trainData$Survived)
#proportion
prop.table(table(trainData$Survived))

#plotting with NA values removed
plot(density(trainData$Fare,na.rm=TRUE))
plot(density(trainData$Age,na.rm=TRUE))

#survival rate by gender and barplot
counts <- table(trainData$Survived,trainData$Sex)
barplot(counts,xlab="Gender",ylab="Number of People",main="Survival by gender")

Pclass_survival <- table(trainData$Survived,trainData$Pclass)
barplot(Pclass_survival,xlab="Cabin Class", ylab="Number of People")

#gives survival rate in each cabin
Pclass_survival[2]/(Pclass_survival[1]+Pclass_survival[2])
Pclass_survival[4]/(Pclass_survival[3]+Pclass_survival[4])
Pclass_survival[6]/(Pclass_survival[5]+Pclass_survival[6])

# Cleaning the data
# remove unused columns c generates columns, negative sign means remove
trainData = trainData[-c(1,9:12)]

# replace male/female with a dummy 0/1
trainData$Sex = gsub("female",1,trainData$Sex)
trainData$Sex = gsub("male",0,trainData$Sex)

# handle missing values
# idea: Ms. is younger than Mrs.; same title have similar age
# use grep(), which returns row numbers, to find entries with a title

master_vector = grep("Master.", trainData$Name,fixed=TRUE)
miss_vector= grep("Miss", trainData$Name,fixed =TRUE) 
mrs_vector= grep("Mrs.", trainData$Name,fixed=TRUE)
mr_vector= grep("Mr.", trainData$Name,fixed=TRUE)
dr_vector= grep("Dr.", trainData$Name,fixed=TRUE) 

# Replace name with title which only has four possible values(Master,Miss,Mr,Dr)

for(i in master_vector){
	trainData$Name[i] = "Master" 
}
for(i in miss_vector ){
	trainData$Name[i] = "Miss"
}
for(i in mrs_vector){
	trainData$Name[i] ="Mrs"
}
for(i in mr_vector){
	trainData$Name[i] ="Mr"
}
for(i in dr_vector){
	trainData$Name[i] ="Dr"
}


# replace missing values with the average value of the group within

# calculate average age for each group
master_age= round(mean(trainData$Age[trainData$Name	== "Master"], na.rn =TRUE), digits=2)
miss_age= round(mean(trainData$Age[trainData$Name	== "Miss"], na.rn =TRUE), digits=2)
mrs_age= round(mean(trainData$Age[trainData$Name	== "Mrs"], na.rn =TRUE), digits=2)
mr_age= round(mean(trainData$Age[trainData$Name	== "Mr"], na.rn =TRUE), digits=2)
dr_age= round(mean(trainData$Age[trainData$Name	== "Dr"], na.rn =TRUE), digits=2)

# replace 
for( i in 1:nrow(trainData)){
	if (is.na(trainData$Age[i]){
		if(trainData$Name[i]=="Master"){
			trainData$Age[i]=master_age
		}
		else if(trainData$Name[i]=="Miss"){
			trainData$Age[i]=miss_age
		}
		else if(trainData$Name[i]=="Mrs"){
			trainData$Age[i]=mrs_age
		}
		else if(trainData$Name[i]=="Mr"){
			trainData$Age[i]=Mr
		}
		else if(trainData$Name[i]=="Dr"){
			trainData$Age[i]=dr_age
		}
		else{
			print{"Unknow title"}
		}
	}	
}

# adding new features
# 1 add a child variable (under 12 years old)
trainData['Child'] = 0
for (i in 1:nrow(trainData)){
	trainData$Age[i] <= 12{
		trainData$Child[i]=1
	} 
		trainData$Child[i]=2
}

# 2 add a "family" variable
trainData$['Family']=NA
for(i in 1:nrow(trainData) ){
	x =trianData$SibSp[i]
	y=trainData$Parch[i]
	trainData$Family[i]=x+y+1
}

# add a "mother" variable
trainData['Mother']
for(i in 1:nrow(trainData)){
	if (trainData$Name[i] =="Mrs" & trianData$Parch[i]>0){
		trainData$Mother[i]=1
	}else{
		trainDAta$Mother[i]=2
	}
}

#
# here we also need to clean the test data 
#


# Model training  
# logistic regression model (for binary result Survived or not)
train.glm <- (Survived ~ Pclass +Sex +Age +Child +Sex*Pclass,data=trainData)

# model testing
p.hats <- predict.glm(train.glm, newdata = testData)
