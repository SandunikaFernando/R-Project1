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
