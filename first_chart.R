## Install Package
install.packages("ggplot2")
library(ggplot2)
library(dplyr)
## Load Data
Data <- read.csv("https://raw.githubusercontent.com/mschrier/https-classroom.github.com-a-XrLzm1Hu/main/Arrest_Information.csv")
View(Data)
# Data division by year
Data_2013_all <- filter(Data, X2013=="2013")
Data_2015_all <- filter(Data, X2013=="2015")
Data_2017_all <- filter(Data, X2013=="2017")
Data_2019_all <- filter(Data, X2013=="2019")

Total_Arrest<- c(Data_2013_all$Total[1],Data_2015_all$Total[1],Data_2017_all$Total[1],Data_2019_all$Total[1])
Year <- c("arrest_2013","arrest_2015","arrest_2017","arrest_2019")

Plot<- data.frame(Year, Total_Arrest)
ggplot(Plot, aes(x=Year, y=Total_Arrest,group=1)) + geom_line(linetype = "dashed",color = "red")+geom_point()+
  ggtitle("Arrests per Year")+ theme(plot.title = element_text(hjust = 0.5))
  
                                                                                                                                                  
