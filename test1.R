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
