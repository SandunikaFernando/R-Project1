# Decision Tree----
library(rpart.plot)
library(rpart)
pacman::p_load(rpart,rpart.plot, dplyr)

#classification tree
#created for categorical variable and qualitative responsibility
str(mtcars)

head(mtcars)
df=mtcars
df$am=factor(df$am)
str(df)

dt1 <- rpart(am~mpg,data=df, method='class')
dt1
?rpart.plot
rpart.plot(dt1)
rpart.plot(dt1, type=1, nn=T)
rpart.plot(dt1,type=2, extra=104,nn=T)
df%>% select(mpg,am)%>% arrange(mpg)

rpart.rules(dt1,nn=T)
rpart.rules(dt1,cover=T, nn=T)

(sample1<-dplyr::sample_n(df,3))
rpart.predict(dt1,newdata=sample1, rules=T)
rpart.predict(dt1,newdata=sample1)

#titanics----
data("ptitanic")
head(ptitanic)

#predict survive or NOT
str(ptitanic)
names(ptitanic)
dim(ptitanic)
dt2<-rpart(survived~. , data=ptitanic)
dt2
rpart.plot((dt2))
rpart.plot(dt2,cex=0.8)

#partition data into 2 parts----
library(caret)
trgIndex=createDataPartition(ptitanic$survived,p= .8, list=F,times=1)
?createDataPartition
trgSet=ptitanic[trgIndex,]
testSet=ptitanic[-trgIndex,]
dim(trgSet); dim(testSet)#total matching
dt3=rpart(survived~., data=trgSet)
dt3
rpart.plot(dt3)
rpart.plot(dt3,type=1, extra=104, nn=T,cex=.9)
rpart.plot(dt3,type=1, extra=104, nn=T,cex=.9)
