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


printcp(dt3)
dt3b<-prune(dt3, cp=,01)
dt3b
rpart.plot(dt3b, type=2, extra=104, nn=T, cex=.9)

dt3c<-prune(dt3,cp=.018)
dt3c
rpart.plot(dt3b, type=2, extra=104, nn=T, cex=.8)

#use this model to predict survival for testSet 
head(testSet)
pred1=predict(dt3b, newdata=testSet, type='class')#qualitative response
head(pred1)
pred2=predict(dt3b, newdata=testSet, type='prob')#response is in probabilityof death and survival
head(pred2)

#confused matrix to find accuracy----
caret:: confusionMatrix(testSet$survived,pred1)

head(ptitanic)

dt4=rpart(age~.,data=ptitanic, method="anova")#annova is used for regression tree
dt4
dim(ptitanic)
rpart.plot(dt4,nn=T, cex=.8)
rpart.rules(dt4, cover=T, nn=T)

#using dplyr package
?sample_frac
dim(ptitanic)
1309*0.1/100

sample2= sample_frac(ptitanic, size=.1)
head(sample2)
dim(sample2)
predAge<-predict(dt4,newdata=sample2, type='vector')
head(predAge)
predict(dt4,newdataw=sample2)

sample2=cbind(sample2, predAge)
head(sample2)

caret:: RMSE(sample2$age, predAge, na.rm=T)
#lesser the better
