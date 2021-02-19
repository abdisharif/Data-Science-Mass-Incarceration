install.packages("ggplot2")
library(ggplot2)
library(dplyr)
## Load Data
Data <- read.csv("https://raw.githubusercontent.com/mschrier/https-classroom.github.com-a-XrLzm1Hu/main/Arrest_Information.csv")

# Data division by year
Data_2013_all <- filter(Data, X2013=="2013")
Data_2015_all <- filter(Data, X2013=="2015")
Data_2017_all <- filter(Data, X2013=="2017")
Data_2019_all <- filter(Data, X2013=="2019")


Plot_2019 <- Data_2019_all[-c(1),c(1,2)]
ggplot(Plot_2019, aes(x=Crime...Total.Arrest, y=Total)) + geom_bar(stat="identity")+
  ggtitle("Arrests in 2019")+ theme(plot.title = element_text(hjust = 0.5))+ theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +
  xlab("Crimes") + ylab("Total Arrest")
