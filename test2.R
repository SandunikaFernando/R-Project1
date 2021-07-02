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

#subset a vector
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

#sub setting data frame
df<-data.frame(x=1:3,y=3:1,z=letters[1:3])
df

df[df$x==2,]

df[df$y==2,]

df[df$x==1,]

df[df$x==3,]
