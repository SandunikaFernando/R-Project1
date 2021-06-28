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