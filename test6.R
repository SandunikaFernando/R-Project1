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


#Cluster Analysis-----
#Clustering with mtcars
pacman :: p_load(dplyr,ggplot2)
head(mtcars)
df=mtcars[,c('mpg','wt','hp','am')]
head(df)

#K means
#Building k means clutering models with 3 centers

km1 = kmeans(df, centers=3)
km1
cbind(df,km1$cluster)
df[km1$cluster==1,]
df%>% filter(km1$cluster==2)
table(km1$cluster)#help to know the number of observations in each cluster

#based on custers lets find the mean of variables in our data set
df%>%group_by(clusterNo=km1$cluster)%>%summarise_all(mean, na.rm=T)

#plotting the clusters using package factoextra
library(factoextra)
fviz_cluster(km1, data=df)

#how to choose best number of cluster - elbow method
#elbow method contains 2 method: factoextra and NbClust
#factoextra method

set.seed(123)
?geom_vline
fviz_nbclust(df,kmeans,method="wss")#with-in-Sum-of-squares
fviz_nbclust(df, kmeans, method="wss")+geom_vline(xintercept = 3, linetype=2)+
labs(subtitle = "Elbow Method")

#xintercept: Parameters that control the position of the line

#NbClust method:
library(NbClust)
?NbClust

set.seed(1234)
nc<-NbClust(df,distance="euclidean", min.nc=2,max.nc=6, method="kmeans")
nc

marks1=c(65,60,70,75,67)
marks2=c(95,80,52,55,57)
project=c(120,100,90,80,110)
exam3=data.frame(marks1,marks2,project)

#project marks will be more dominating
exam3scaled=scale(exam3)#function used to scale the data
exam3scaled
cluster2C=kmeans(exam3scaled,centers=2)
cluster2C
cluster2C$cluster
cbind(exam3,group=cluster2C$cluster)


#hierarchical clustering -----
df = mtcars[,c('mpg', 'wt', 'hp', 'am')]
dfD = dist(df)
dfD

#example for distance matrix 
#using the data created exam3 
exam3
#project marks will be more dominating 
xam3scaled = scale(exam3)
exam3scaled
res.dist <- dist(exam3, method = "euclidean")
res.dist

hc = hclust(dfD)
plot(hc) # which car is closer to the other 

sub_grp <- cutree(hc, k = 4)
#number of members in each cluster 
table(sub_grp)


#creating models using different methods : average
hc.average = hclust(dfD, method = 'average')
hc.average
plot(hc.average, hang=-1, cex=.8, main='Average Likage Clustering : cluster Nos')


rect.hclust(hc.average, k=4, border = 2:6)
plot(hc.average, hang = -1, cex=.8, main = 'Avarage Linkage Clustering')
rect.hclust(hc.average, h=100)


abline(h=100)


#Data sets
?mtcars
?mtcars;ptitanic
?women
