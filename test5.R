#Simple scatter plot----
#plot(x,y,main xlab, ylab, xlim, ylim, pch, cex)
#we can add 5 dimensions to a scatter plot of 2dim

?plot

x1=1:10
y1=x1^2
x1
y1

#adding linetype
plot(x=x1, y=y1, type='p')#lty= linetype=points
plot(x=x1, y=y1, type='l')#lty= linetype=lines
plot(x=x1, y=y1, type='b')#lty= linetype=both

#adding line width, color and cex(size of point)
plot(x=x1, y=y1, type='b',lwd=1,col='red', cex=1)
plot(x=x1, y=y1, type='b',lwd=2,col='blue', cex=5)
plot(x=x1, y=y1, type='b',lwd=3,col='purple', cex=2)

#change the limits of x and y axis
plot(x=x1, y=y1,xlim=c(0,10),ylim=c(0,100),type = 'b',cex=1,col='blue')

#using mtcars dataset: plotting mpg and weight
plot(mtcars$wt, mtcars$mpg, col='blue', pch=1, cex=1.5)
plot(mtcars$wt, mtcars$mpg, col='blue', pch=20, cex=1, xlab='Weight', ylab='Mileage', main='Weight Vs MPG')


table(mtcars$gear)
table(mtcars$cyl)
plot(x= mtcars$wt, y= mtcars$mpg, col=mtcars$cyl, pch=mtcars$gear, cex=1, xlab='Weight', ylab='Mileage', main='Weight Vs MPG')

#add fit lines
abline(lm(mtcars$mpg~mtcars$wt),col="red")

#platting wt to mpg graph and adding legends to it
#x~weight, y~Millege, Color~Cylinder, Shape~Gear, Size-AM : Points
lapply(mtcars[,c('cyl','gear','am')], table)

#you should know this to plan how many colors, shapes, size to choose
plot(x=mtcars$wt, y=mtcars$mpg, col=c(1,2,3), pch=c(20,21,22), cex=c(1,2), xlab='Weight', ylab='Mileage', main='Weight Vs Mileage')


#Boxplot

?InsectSprays
InsectSprays
?boxplot

#showing mean of mpg
boxplot(x=mtcars$mpg, col ='green')#col= colour for plotting
abline(h=mean(mtcars$mpg))
abline(h=quantile(mtcars$mpg))

boxplot(x=mtcars$mpg, col ='green', horizontal = T)#horizontal direction of boxplot

#boxplot on a formula:
?InsectSprays
boxplot(count~spray, data = InsectSprays, col="lightgray")

#add notches 
boxplot(count ~ spray, data = InsectSprays,
notch= F, col="Blue") #if we put notch=T,we'll get a warning  message by saying " some notches went outside hinges ('box'):maybe set notch=FALSE"

#using formula for mtcars
boxplot(mpg~cyl, data = mtcars,
        xlab="Number of Cylinders",
        ylab="Miles Per Gallon",
        notch=F,
        main="Mileage Data",
        col=c("green","yellow","purple"),
        names=c("High","Medium","Low")
        )


#Bar plot
#Bar and column charts are used to compare different items
#Bar charts are often used when comparing categories of data 
cars<- c(1,3,6,4,9)
trucks<- c(2,5,4,5,12)
suvs=c(4,4,6,6,16)
autos_data=data.frame(cars,trucks,suvs)
autos_data
barplot(autos_data$cars, main="Auto Data",xlab="Days", ylab="Total", names.arg=c("Mon","Tue","Wed","Thu","Fri"),
        border="blue",density=c(10,20,30,40,50))

#graphs autos with adjacent bars using rainbow colors
barplot(as.matrix(autos_data), main="Autos", ylab="Total",beside=TRUE, col=rainbow(5))

#place the legend at the top-left corner with no frame
#using rainbow colors
legend("topleft",c("Mon","Tue","Wed","Thu","Fri"), cex=1,bty="n",fill=rainbow(5))#byt=type of box to be drawn around the legend

#Graph autos (transposing the matrix)using heat colors,
#put 10% of the space between each bar, make labels
#smaller with horizontal y-axis labels
autos_data
t(autos_data)
barplot(t(autos_data),main="Autos", ylab="Total",
        col=heat.colors(3),space=0.1, cex.axis=1, las=1,
        names.arg=c("Mon","Tue","Wed","Thu","Fri"),cex=1)

legend("topleft", c("Cars","Trucks","SUVs"), cex=1, bty="n",fill=heat.colors(3))

legend("top", c("Cars","Trucks","SUVs"), cex=1, bty="n", fill=heat.colors(3))

#Histogram

?hist
#Histogram for a normally distributed data 
hist(rnorm(1000))
hist(rnorm(1000), probability = T)

#histogram for a skewed data 
hist(islands)#gives results in frequencies
hist(islands,probability = T)#proportion (or probabilities)
hist(islands, breaks = 5, 
     main = "islands histogrm", xlab = "Area range", border = "red", col = "grey")

head(airquality)
hist(airquality$Temp)

#adding label names and title
hist(airquality$Temp,
     main="Temperature Histogram",
     xlab="Temperature",
     ylab="Temperature Frequency",
     las=1)

#adding color to bars
hist(airquality$Temp,
     main="Tempareture Histogram",
     xlab="Temparature",
     ylab="Temperature Frequency",
     las=1,
     col=c("skyblue","chocolate2"))

#removing all the annotation and axis lim and name to give our own
hist(airquality$Temp,
     axes=F,
     ann=F,
     labels=T,
     ylim=c(0,35),
     col = c("skyblue","chocolate2"))


#specifying own annotations
hist(airquality$Temp,
     main="Tempareture Histogram",
     xlab="Temparature",
     ylab="Temperature Frequency",
     las=1,
     col=c("skyblue","chocolate2"),
     xlim=c(55,100),
     ylim=c(0,40),
     density=80)

#giving the number of breaks and adding numbers to the bars
hist(airquality$Temp,
     breaks=20,
     main="Tempareture Histogram",
     xlab="Temparature",
     ylab="Temperature Frequency",
     las=1,
     col=c("skyblue","chocolate2"),
     labels = T,
     ylim=c(0,25)
     )

#changing frequency on y axis to density/probability values; removing labels also as they are in freq value only and adding density line
hist (airquality$Temp,
      breaks = 20,
      freq=F,
      main="Tempareture Histogram",
      xlab="Temparature",
      ylab="Temperature Frequency",
      las=1,
      col=c("skyblue","chocolate2"),
      labels = T,
      )

lines(density(airquality$Temp),
      lwd=4,col="red")

hist(airquality$Temp,
     breaks=20,
     main="Tempareture Histogram",
     xlab="Temparature",
     ylab="Temperature Frequency",
     las=1,
     col=c("skyblue","chocolate2"),
     labels = T,
     ylim=c(0,25) )



#Pie charts
#pie charts are used to show parts of a whole
#Represents numbers in percentages, and the total sum of all the divided segments equals 100 percent

#Create a pie chart for cars 
cars<- c(1,3,6,4,9)
pie(cars)

#custom colors and labels
pie(cars,main="Cars", col=rainbow(length(cars)),labels=c("Mon","Tue","Wed","Thu","Fri"))

#Define some colors ideal for black & white print
colors <- c("white","grey70","grey90","grey50","black")

#calculate the percentage for each day, rounded to one 
#decimal place
car_labels<-round(cars/sum(cars)*100,1)
car_labels
#concatenate a "%" char after each value
car_labels<-paste(car_labels, "%", sep=" ")
car_labels

#and labels
pie(cars, main="Cars",col=colors, labels=car_labels, cex=0.8)

#create a legend at the right
legend('topright', c("Mon","Tue","Wed","Thu","Fri"),cex=0.8, fill=colors)

#3D Exploded pie chart 
library(plotrix)
slices <-c(10,12,4,16,8)
lbls <- c("US","UK","Australia","Germany","France")
pie3D(slices,labels=lbls,explode=0.2, main="Pie Chart of Countries")


#GGPlot 
#install.packages()
library(ggplot2)
library(dplyr)
mtcars

#Scatter Plot
#basic scatter plot (wt vs mpg)
plot(mtcars$wt, mtcars$mpg)

#1st layer of ggplot- creating base for plotting
ggplot(data=mtcars, aes(x=wt, y=mpg))

#adding geometry to graph
ggplot(data=mtcars,aes(x=wt, y=mpg))+geom_point(color='red',size=3)
ggplot(data=mtcars, aes(x=wt, y=mpg))+geom_point(color='red',size=3,shape=20)
head(mtcars)

table(mtcars$cyl)
table(mtcars$gear)
table(mtcars$carb)
table(mtcars$am)

#adding different dimensions to ggplot now: adding col as per no. cyl
#ggplot(data=mtcars, aes(x=wt,y=mpg))+geom_point(color=cyl, size=3,shape=20) #Error "object 'cyl' not found"
ggplot(data=mtcars, aes(x=wt,y=mpg))+geom_point(aes(color=cyl), size=3,shape=20)
ggplot(data=mtcars, aes(x=wt,y=mpg))+geom_point(aes(color=factor(cyl)), size=3,shape=20)

#adding different dimensions to ggplot now: adding size as per type os transmission
ggplot(data=mtcars, aes(x=wt, y=mpg))+geom_point(aes(color=factor(cyl),size=factor(am)), shape=20)

#adding different dimensions to ggplot now: adding col as per no. of gear
ggplot(data=mtcars, aes(x=wt, y=mpg))+geom_point(aes(color=factor(cyl), size=factor(am)),shape=20)

#adding labels to the graph
ggplot(data=mtcars, aes(x=wt, y=mpg))+geom_point(aes(shape=factor(gear), size=factor(am),color=factor(cyl)))+labs(title='Adding dimensions to graph',subtitle='Sactter Plot', x='Weight',y='Mileage')

#So, in a graph we can add at least 7 dimensions, making it ineractive and precise to need 
#adding text to points, name of the cars
ggplot(data=mtcars, aes(x=wt, y=mpg))+geom_point(aes(color=factor(cyl),size=factor(am),shape=factor(gear)))+facet_grid(cyl+vs~carb)+labs(title='Adding dimensions to graph', subtitle='Scatter Plot',x='Weight',y='Mileage')+geom_text(aes(label=rownames(mtcars)),size=2.5)

#adding text to points,name of the cars using ggrepel package to make graph tidy
library(ggrepel)
ggplot(data=mtcars, aes(x=wt,y=mpg))+ geom_point(aes(color=factor(cyl),size=factor(am),shape=factor(gear)))+ facet_grid(vs~carb)+labs(title='Adding dimensions to graph', subtitle='Scatter Plot', x='Weight', y='Mileage')+ ggrepel::geom_text_repel(aes(label=rownames(mtcars)),size=2.5)


#BarPlot----
#converting certain columns to factor data type (categorial variables)
barplot(mtcars$cyl)
barplot(table(mtcars$cyl))

#creating bar plot using no. of cyl to fill colors to bars/if col will be used - borders of bar will be colored

ggplot(data=mtcars, aes(x=cyl))+geom_bar()
ggplot(data=mtcars, aes(x=cyl))+geom_bar(fill='red')
ggplot(data=mtcars, aes(x=cyl))+geom_bar(col='red')
ggplot(data=mtcars, aes(x=cyl))+geom_bar(aes(fill=factor(cyl)))
ggplot(data=mtcars, aes(x=cyl))+geom_bar(aes(col=factor(cyl)))


#if you want the heights of the bars to represent values in the data, use stat ="identity" and map a value to the y aesthetic
#summerising and summing the count of cars against no. of cyl ; using stat="identity to get count on top of bars

mtcars %>% group_by(cyl) %>% summarise (n=n()) %>% ggplot(.,aes(x=cyl,y=n))+ geom_bar(stat='identity',aes(fill=factor(cyl)))+geom_text(aes(label=n))

mtcars %>% group_by(cyl,gear,am,vs) %>% summarise (n=n()) %>% ggplot(.,aes(x=cyl,y=n))+ geom_bar(stat='identity',aes(fill=factor(cyl)))+ geom_text(aes(label=n))+facet_grid(gear~am)

#updating facet_layer-scales and space = free--makes full use of the graph areas otherwise the values are very small so the bars will also be short-zooms the graph by auto selecting the limits

mtcars %>% group_by(cyl,gear,am,vs) %>% summarise (n=n()) %>% ggplot(.,aes(x=cyl,y=n))+ geom_bar(stat='identity',aes(fill=factor(cyl)))+ geom_text(aes(label=n))+facet_grid(gear~am, scales='free',space='free')

#HEAT MAP
a = mtcars %>% group_by(cyl,gear)%>% summarise(n=n())
a
ggplot(a, aes(x=factor(cyl),y=factor(gear),fill=n))+geom_tile()+geom_text(aes(label=n),size=6)

ggplot(a,aes(x=factor(cyl),y=factor(gear),fill=n))+geom_tile()+geom_text(aes(label=n),size=6)

ggplot(a,aes(x=factor(cyl),y=factor(gear),fill=n))+geom_tile()+geom_text(aes(label=n),size=6)+scale_fill_gradient2()


#Simple Linear Regression in R
?women
women
str(women)
dim(women)

#check linearity of the dataa set first by plotting it
plot(women$height,women$weight)

#building a model for women data set
lmmodel=lm(weight~height, data=women)
lmmodel

#checking summary of the model
summary(lmmodel)

#plotting a regression line on graph to show the relationship
abline(lm(weight~height, data=women),col='red',lwd=1)

#predicting the value of y (weight) with a new data of x (height)
head(women)
range(women$weight)
range(women$height)
newdata=data.frame(height=c(50,75,80,85))
pred_weight=predict(lmmodel, newdata)
pred_weight

#checking assumptions of the model by diagnostic plotting
plot(lmmodel)


#Multi-Linear Regression----

?mtcars
names(mtcars)
View(mtcars)
plot(mpg~hp, data=mtcars)
plot(mpg~wt, data=mtcars)
result<-lm(mpg~hp+wt,data=mtcars)
summary(result)

#value of adjust R2=0.82
#checking Multicolinearity:

result<-lm(mpg~hp+wt+disp+cyl+gear, data=mtcars)
summary(result)

#creating training and test data
trainingRowIndex <- sample(1:nrow(mtcars),0.8*nrow(mtcars))#row indices for training data
trainingData <-mtcars[trainingRowIndex, ]#model training data
testData <-mtcars[-trainingRowIndex, ]

#Build the model on training data----
lmMod <-lm(mpg~cyl
           +disp
           +hp
           +wt, data=trainingData)#build the model
#review diagnostic measures
summary(lmMod)#model summary

#Accuracy:
#since R2 is close to 1, i.e., 0.84, hence model is significant

#Prediction----
#Predicing values for test dataset

testData$mpgPred <- predict(lmMod, testData)
View(testData)

#accuracy----
#determining Prediction accuracy on test dataset using MAPE

#MAPE(MeanAbsolutePrecentageError):
#lower its value better is the accuracy of the model
#MAPE Calculation:

mape <- mean(abs(testData$mpgPred-testData$mpg)/testData$mpg)
mape

#checking assumptions through diagnostics plots
plot(lmMod)

lmMod


#Logistic Regression----

mydata <- read.csv("https://stats.idre.ucla.edu/stat/data/binary.csv")
head(mydata)
str(mydata)
summary(mydata)
sapply(mydata,sd)

#rank is a categorical values, but is saved in integer datatypes; lets convert it to factors
mydata$rank=as.factor(mydata$rank)
mydata$admit=as.factor(mydata$admit)
str(mydata)
dim(mydata)

#wo-way contingency table of categorical outcome and predictors we want 
#to make sure there are not 0 cells
#which rank of institute are more successful (in nos/ %) in getting admitted - 2/ 1
xtabs(~admit +rank,data=mydata)

?glm
mylogit=glm(admit~gre+rank,data=mydata,family="binomial")
summary(mylogit)

#dividing the data set into training and test for analysis

n=nrow(mydata)
sample=sample(1:n, size=round(0.7*n),replace=FALSE)
train= mydata[sample,]
test= mydata[-sample,]

#Model 2
?glm
logR1=glm(admit~gre+gpa+rank,train,family=binomial)
logR1
summary(logR1)

#predict on test set
?predict
predicted=predict(logR1,newdata=test,type='response')
head(predicted)
predictV=factor(ifelse(predicted<0.5,0,1))
head(predictV)
test=cbind(test,predictV)
head(test)
str(test)

#checking accuracy of the model
library(caret)

confusionMatrix(test$admit, test$predictV)#better

#Model 3
n=nrow(mydata)
sample=sample(1:n,size=round(0.7*n), replace=F)
train=mydata[sample,]
test2=mydata[-sample,]

logR2=glm(admit ~ gre+rank, train, family=binomial)#gpa removed
logR2
summary(logR2)

pred=predict(logR2, newdata = test2, type = 'response')
predict=factor(ifelse(pred<0.5,0,1))
test2=cbind(test2, predict)
head(test2)

#checking accuracy using caret package: confusion matrix
caret::confusionMatrix(test2$admit,test2$predict) #better

#confusion matrix using table command
table(test2$admit,pred>0.5)

#checking accuracy of model using mean command
mean(test2$predict==test2$admit)

#New data prediction
range(mydata$gpa)
df2=data.frame(gre=700, rank=factor(2))
df2

p=predict(logR2, newdata=df2)
p
p1=factor(ifelse(p<0.5,0,1))
p1
df.p=cbind(df2,p1)
df.p



