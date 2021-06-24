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
