myString <- "Hello , World"
print(myString)

x=read.csv("Book1.csv", header = F)
x
str(x)

y=read.csv("Book1.csv", header = T)
y
str(y)

abc = "https://support.staffbase.com/hc/en-us/article_attachments/360009197031/username.csv"
radio = read.table(abc, header = TRUE, sep = ",", stringsAsFactors = FALSE)
str(radio)
View(radio)

get_yesterday <- function(){
  return(Sys.Date() - 1)
}

z=read.table("BOok1.txt")
z

z=read.table("Book1.txt",header = T)
z

library(xlsx)
excel=read.xlsx("Book1.xlsx",sheetIndex=1)
excel

file=read.xlsx("Book1.xlsx",2)
file

file=read.xlsx("Book1.xlsx",sheetIndex=2, sheetName="Sheet2")
file

library(gsheet)
url="https://docs.google.com/spreadsheets/d/1SGc63CYu7rsluEcfkX_iC1vmfWGCImI7Gg67mA7juCg/edit?usp=sharing"
abc=as.data.frame(gsheet2tbl(url))
abc

#exporting data
data()
?write.csv

write.csv(abc,file = "export")
abc

#assignment operators
h<-10#leftward
i<<-20
j=30
40->k#rightward
50->>l
h
i
j
k
j
l

#arithmetic operators
x=5
x
y=2
y

x+y
x-y
x*y
x/y
x^y
x%%y  #modulus(gives the remainder)
x%/%y #integer division (gives the quotient)

#relational Operators
a=5
a
b=9
b

a<b
a>b
a<=b
a>=b
a==b
a!=b

#logical Operators
f=14
f

#And Operator
f>5 & f>15
f>5 & f<15

#OR operator
f<5 | f>15
f>5 | f>15

#NOT operator
!(f<5)
f<5

is.numeric(5)
!is.numeric(5)


#Vectors
#(Comparing all elements)
c(T,T,F)&c(T,F,F)
c(T,T,F)&c(T,F,F)
!c(T,F,F)
#(Element wise comparing)
c(T,T,F)&& c(T,F,F)
c(T,T,F)|| c(F,F,F)

#Data Structures
#vectors------
#Numeric
x=c(2,3,4)
x
class(x)
length(x)

#Character
y=c('a','b','c')
y
class(y)

#logical
z=c(T,T,F,F)
z

#integers
a=c(1L, 2L, 3L)
class(a)

#adding an element to the vector
y=c(y, 'd')
y

#Vectors from a sequence of numbers
series= 1:10
series
seq(10)
seq(1,10,1.5)


#Matrices-----
#Creating a matrix
m=matrix(1:10, nrow=2, ncol=5)
m

#checking dimension
dim(m)

#matrix filled row wise with giving names to rows and columns
(myMatrix= matrix(1:6,nrow=3,byrow=TRUE,dimnames=list(c("d","e","f"),c("a","b"))))

#matrix filled column wise
(myMatrix=matrix(1:6,nrow=3,byrow=FALSE))

#other ways to construct matrix
m <-1:10
dim(m)=c(5,2)
m

#adding Column to a matrix
c= c(7,8,9)
myMatrix1=cbind(myMatrix, c)
myMatrix1

d= c(10,11,12)
myMatrix2=cbind(myMatrix1, d)
myMatrix2

#adding row to a matrix
g=c(13,14,15,16)
myMatrix3=rbind(myMatrix2,g)
myMatrix3


#Lists----
(v1=1:5)
class(v1)
(v2=month.abb[4:10])
class(v2)
(v3=c(T,F,TRUE, FALSE))
class(v3)

(combineV= c(v1,v2,v3))#all converted into characters by default
class((combineV))

list1=list(v1,v2,v3)
list1


#arrays----
#Create two vectors of different length
vector1<-c(5,9,3)
vector2<- c(10,11,12,13,14,15)
column.names <-c("COL1","COL2","COL3")
row.names <- c("ROW1","ROW2","ROW3")
matrix.names <- c("Matrix1","Matrix2")

#take these two vectors as inputs to the array
result <-array(c(vector1,vector2),dim=c(3,3,2),dimnames=list(row.names,column.names,matrix.names))
print(result)


#Data Frames----
#1st method

df1=data.frame(name=c("S1","S2","S3"), age=c(22,23,24))
df1

#2nd Method
(rollno=1:10)
(name=paste('S',1:10,sep=''))
(age=round(rnorm(10,mean=25,sd=2),1))#rounds up to 1 decimal point
(gender=sample(c('M',"F"), size=2, replace=T))
df2=data.frame(rollno, name, age, gender)
df2
class(df2)


#install packages
#installing single package----
install.packages('dplyr')
#loading a single package
library(dplyr)

#installing multiple packages----
install.packages(c('dplyr','plotly','readr'))


#function used to load multiple packages
install.packages('pacman')
pacman::p_load(dplyr,tidyr,lubridate)
search()
require(lubridate)

#to view loaded packages
search()

#to unload a packages
detach("dplyr", unload=T)

#remove installed packages
remove.packages("dplyr")

#updating all the installed packages
update.packages()

#updating selected packages
update.packages(oldPkgs=c('dplyr','lubridate'))

