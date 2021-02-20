## Install Package
install.packages("ggplot2")
install.packages("reshape2")
library(reshape2)
library(ggplot2)
library(dplyr)
## Load Data
Data <- read.csv("https://raw.githubusercontent.com/mschrier/https-classroom.github.com-a-XrLzm1Hu/main/Arrest_Information.csv")

# Data division by year
Data_2013_all <- filter(Data, X2013=="2013")
Data_2015_all <- filter(Data, X2013=="2015")
Data_2017_all <- filter(Data, X2013=="2017")
Data_2019_all <- filter(Data, X2013=="2019")

Total_Arrest<- c(Data_2013_all$Total[1],Data_2015_all$Total[1],Data_2017_all$Total[1],Data_2019_all$Total[1])
Year <- c("2013","2015","2017","2019")
Total_Arrest<- data.frame(Year, Total_Arrest)
# Data division for max crime type
Data_2013 <- Data_2013_all[-c(1,29),]
Data_2015 <- Data_2015_all[-c(1,29),]
Data_2017 <- Data_2017_all[-c(1,29),]
Data_2019 <- Data_2019_all[-c(1,29),]

max_crime_arrest_type_2013 <- as.vector(Data_2013[which.max(Data_2013$Total),c(1,2)])
max_crime_arrest_type_2015 <- as.vector(Data_2015[which.max(Data_2015$Total),c(1,2)])
max_crime_arrest_type_2017 <- as.vector(Data_2017[which.max(Data_2017$Total),c(1,2)])
max_crime_arrest_type_2019 <- as.vector(Data_2019[which.max(Data_2019$Total),c(1,2)])

max_crime_type<- rbind(max_crime_arrest_type_2013,max_crime_arrest_type_2015,max_crime_arrest_type_2017,max_crime_arrest_type_2019)
colnames(max_crime_type)[2]= "Max_crime_type_arrest"

Final_Plot_Data <- cbind(Total_Arrest,max_crime_type)
Final_Plot_Data <- Final_Plot_Data[,-c(3)]

Final_Plot_Data1<- melt(Final_Plot_Data, id.vars='Year')

ggplot(Final_Plot_Data1, aes(x=Year, y=value, fill=variable)) +
  geom_bar(stat='identity', position='dodge') + ylab("No. of Arrests")+
  ggtitle("Comparison of total arrest and\n max crime type arrest")+ theme(plot.title = element_text(hjust = 0.5))+ labs(fill = "Legend")



