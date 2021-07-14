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

