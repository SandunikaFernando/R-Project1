#Sub setting the data
#square bracket notation
df=matrix(1:12, nrow=4, byrow=F)
df

#Return row 1
df[1,]

#Return a Column
df[,3]

#value of Rows 1:3 in column 2
df[1:3,2]

#subset a vector----
x<-c(2.1,4.2,3.3,5.4)

#extracting 3rd and 1st element 
x[c(3,1)]

#omit elements at the specific positions
x[-c(3,1)]

#logical vectors select elements where the corresponding logical values
x[c(T,T,F,F)]
x[x>3]

#the original vector
x[]


#if the vector is named
(y<-setNames(x,letters[1:4]))
#extraction with column names
y[c("d","c","a")]

#example2
a<-matrix(1:9, nrow=3)
colnames(a)<-c("A","B","C")
a
#rownames(a)<-c("D","E","F")
#a

#extracting 1st and 2nd rows from list
a[1:2,]

#extracting element at position of 3rd row 3rd column
a[3,3]

#excluding  2nd column: 2nd row
a[-2,-2]

#sub setting data frame----
df<-data.frame(x=1:3,y=3:1,z=letters[1:3])
df
df[df$x==2,]

df[df$y==2,]

df[df$x==1,]
df[df$x==3,]


#Sub setting a function
set.seed(1234)
x<-round(matrix(rnorm(30,1), ncol=5),2)
y<-c(1,seq(5))
#combining x and y into one matrix
x<-cbind(x,y)
x

#converting x into data frame x.df
x.df<-data.frame(x)
x.df
?rnorm

#sub-setting rows using the subset function
subset(x.df,y>2)

#sub-setting rows using multiple conditional statements
subset(x.df,y>2 & V1>0.2)

#sub-setting both rows and columns
?subset
subset(x.df,y>2 & V2>0.4,select=c(V1,V4))

#Sub-setting which()statement and conditional statements
#Which function----
?which

letters
which(letters=="z")
which(letters=="s")

#using data frame WOMEN
women
which(women$height==66)
which(women$height>=70)

#which for sub-setting vector and using conditions
#example1
j=c(2,3,4,5,6,7,8,9,23,24,22,1,10)
j>6
which(j>6)
a=j[which(j>6)]
a

letters
LETTERS
which(LETTERS=="K")

#Example2
marks=c(10,20,30,40,60)
which(marks>30)
marks[which(marks>30)]

#example3-using grep command
names=c('jack','jill','tom','jerry','buggs','bunny')
#which names have bu
grep('[bu]',names,ignore.case=T)
names[grep('[bu]',names,ignore.case=T)]

?grep

#example4
mtcars
which(mtcars$mpg>25)
mtcars[which(mtcars$mpg>25),]
?which

#Descriptive Statistics----

#Compute the mean value
mean(mtcars$mpg)

#compute the median
median(mtcars$mpg)

#compute the variance
var(mtcars$mpg)
?var
#compute the sd
sd(mtcars$mpg)

#compute the min value
min(mtcars$mpg)

#compute the max value
max(mtcars$mpg)

#compute the range
range(mtcars$mpg)

#compute the generic function
summary(mtcars$mpg)

#interquartile range
quantile(mtcars$mpg, probs=seq(0,1,0.25))

#column and Row sum and mean
df=data.frame(a=c(1,2,3,4,5,6,7), b=c(7,6,5,4,3,2,4))
df
#column sum
colSums(df)

#Row Sum
rowSums(df)

#column means
colMeans(df)

#row means
rowMeans(df)

#Apply family in R
#Apply()----
?apply
# data frame creation
df<-data.frame(first=c(1:10),second=c(11:20),third=c(21:30))
df

#2(margin)is for columns
apply(df,2,mean)

#1(margin) is for rows
apply(df,1,mean)

#sorting the data
x<-cbind(x1=3, x2=c(4:1,2:5))
x
dimnames(x)[[1]]<-letters[1:8]
x
apply(x,2,mean)
col.sums<-apply(x,2,sum)
col.sums
row.sums<-apply(x,1,sum)
row.sums

apply(x,2,sort)

#lapply()----
#Create a list of matrices
(A= matrix(1:9,nrow=3,byrow=F))
(B= matrix(4:15,nrow=4,byrow=F))
(C= data.frame(x=c(8,9,10),y=c(8,9,10)))
MyList<- list(A,B,C)
MyList

#extract the 2nd column from 'MyList' with the selection operator '['with lapply()
lapply(MyList,"[",,2)
#extract the 1st row from 'MyList'
lapply(MyList,"[",1,)
MyList

#Eg2
movies<-c("SPIDERMAN","BATMAN","VERTIGO","CHINATOWN")
movies
movies_lower<-lapply(movies,tolower)
movies_lower

#sapply()
A=lapply(MyList,"[",1,1)
Z=sapply(MyList,"[",1,1)
A
Z


#tapply()----
#mean MPG of each Am type in mtcars...
?mtcars
names(mtcars)
head(mtcars)
AM1=mtcars[,'am']
AMCYL1=mtcars[,c('cyl','am')]
MPG1=mtcars[,c('mpg')]
tapply(MPG1, AM1, mean)
tapply(MPG1, AMCYL1, mean)

#rep()----
Z=sapply(MyList,"[",1,1)
Z
a=rep(Z,c(3,1,2))
a
?rep

#mapply()----
?mapply
Q=matrix(c(rep(1,4), rep(2,4),rep(3,4),rep(4,4)),4,4)
Q
P=mapply(rep,1:4,4)
P

mapply(sum,1:4,1:4,1:4)
#mapply sums up all the first element (1+1+1), sums up all the second elements(2+2+2) and so on the result will be


#Aggregate----

?aggregate #to understand the function
?ChickWeight

head(ChickWeight)#inbuilt data set
data=ChickWeight#copying data set to another variable
dim(data)#checking the dimensions of the data set

#aggregating the mean weight depending on diet
aggregate(data$weight, by=list(diet=data$Diet),FUN='mean')

#finding the mean weight depending on diet
aggregate(data$weight, by=list(time=data$Time,diet=data$Diet),FUN='mean')

#To get first 6 and last 6 data using function head() and tail()
head(aggregate(data$weight, by =list(time=data$Time, diet=data$Diet), FUN= mean))

tail(aggregate(data$weight, by =list(time=data$Time, diet=data$Diet), FUN= mean))

#finding max weight for each diet
aggregate(data$weight, by = list(diet=data$Diet), FUN =max)



#reading data to do another aggregation
#using package xlsx

library(xlsx)

ad=read.xlsx('Book1.xlsx',sheetName = 2)
ad

#finding mean salary expenditure based on name 
aggregate(ad$salary, by= list (name=ad$name), FUN=mean)

#aggregating salary based on gender
aggregate(ad$salary, by= list (Gender=ad$gender), FUN=mean)

#aggregating salary based on name and roll no
aggregate(ad$salary, by= list(RollNo=ad$rollno, Name= ad$name), FUN=mean)


#Table Command----
#table, addmargins, margin.table, prop.table

mtcars
str(mtcars)

#table
?table
table(mtcars$cyl)
table(mtcars$cyl,mtcars$gear)
table(mtcars$cyl, mtcars$gear, dnn=c('cyl','gear'))#dnn = dimension names
#store in expression t1
t1= table(mtcars$cyl, mtcars$gear, dnn=c('cyl','gear'))
t1

#margin.table - sums values over margin - total sum of table
margin.table(t1)
margin.table(x=t1, margin=1)#cylinder wise #margin-1: row
margin.table(x=t1, margin=2)#gear wise #margin-2: column



#addmargins - extends a table with the marginal totals of the rows and columns
#add different functions over the margins
addmargins(A=t1, margin=1)
addmargins(A=t1, margin=2, FUN=mean)
addmargins(A=t1, margin=c(1,2), FUN=sum)
addmargins(A=t1, margin=c(1,2), FUN=c(sum,mean))

#different functions in rows and columns
addmargins(A=t1, margin=c(1,2), FUN=list(list(sum,length,mean),list(sd,sum)))


#prop.table-convert a frequency table into proportions
#proportion of value of the table (out of 100%)= sum will come up to 1
t1
prop.table(t1)
?prop.table

#Cyl 4, Gear 3: 1 out of 32= 3.12%
1/32
8/32
prop.table(t1,margin=1)#sum of each row

t1

prop.table(t1, margin=2)#sum of each column

#Cyl 4, Gear 3: 1 out of 15 gear 3 cars:1/15
1/15

#creating matrix using prop.table and adding %value
matrix (paste(prop.table(x=t1)*100, '%', sep=''),ncol=3)

#quick check
rowSums(prop.table(t1,margin=1))
colSums (prop.table(t1,margin=2))



#Data Manipulation in R-----

vignette("dplyr")
library(dplyr)

#select function
?select
#select()keeps only the variables you mention

df=mtcars
factorcols=c('cyl','vs','am','gear','carb')
df[factorcols]=lapply(df[factorcols], factor, ordered=T)

sapply(df, class)#check the class
str(df)
abbreviate(rownames(df))
#abbreviate the carnames
names(df)
table(df$cyl)#cylinder wise summary
table(df$am)#transmission wise summary

#combine it in  single command
sapply(df[factorcols],table)

select(mtcars,mpg)
a=df %>% select(mpg)
a
b=df %>% select(mpg,cyl,am)
b
head(b)

#rename: change column name and save it in the same variable in order to update records
b=b %>% rename(MPG=mpg)
head(b)
b=b%>% rename(CYL=cyl,AM=am)
head(b)
