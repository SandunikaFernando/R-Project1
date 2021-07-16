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
notch= F, col="Blue") #if we put notch=T,we'll get a warning message by saying " some notches went outside hinges ('box'):maybe set notch=FALSE"

#using formula for mtcars
boxplot(mpg~cyl, data = mtcars,
        xlab="Number of Cylinders",
        ylab="Miles Per Gallon",
        notch=F,
        main="Mileage Data",
        col=c("green","yellow","purple"),
        names=c("High","Medium","Low")
        )
