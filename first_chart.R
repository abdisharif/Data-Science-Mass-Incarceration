## Load Data
Data <- read.csv("/Users/matthewschrier/Desktop/INFO_201/https-classroom.github.com-a-XrLzm1Hu/Crime_Race_Date_2014.csv")

# First chart Data
Dat <- Data[c(3),c(2:7)]
boxplot(Dat, ylab = "Rape", xlab = "Crimes by different Race")
