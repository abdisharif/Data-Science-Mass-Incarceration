#Mass Incarceration Project 
# Setup  ------------------------------------------------------------------
library("dplyr")
library("tidyverse")
library(ggplot2)

# Load the data from "https://raw.githubusercontent.com/mschrier/https-classroom.github.com-a-XrLzm1Hu/main/Arrest_Information.csv"
Arrest_Information <- read.csv("https://raw.githubusercontent.com/mschrier/https-classroom.github.com-a-XrLzm1Hu/main/Arrest_Information.csv")
view(Arrest_Information)

dim(Arrest_Information)
unique(Arrest_Information$X2013)
length(unique(Arrest_Information$Black.or.African.American.1))
length(unique(Arrest_Information$White))



# Questions/Variables -------------------------------

# into a variable called `incarceration`
Incarceration <- read.csv("https://gist.github.com/curran/8838736cfa6f3f960e2c#file-data-csv")
View(Incarceration)

#what county has the highest incarceration rate?
total_deaths <- national %>%
  filter(date ==max(date))%>%
  pull(deaths)

# How many cases have occured in the U.S.? `total_cases`
total_jail_population <- Incarceration %>%
  filter(date ==max(date))%>%
  pull(cases)


# Plot1  ------------------------------------------------------------------
# Load Data
# Data division by year
Data_2013_all <- filter(Data, X2013=="2013")
Data_2015_all <- filter(Data, X2013=="2015")
Data_2017_all <- filter(Data, X2013=="2017")
Data_2019_all <- filter(Data, X2013=="2019")

Total_Arrest<- c(Data_2013_all$Total[A1],Data_2015_all$Total[1],Data_2017_all$Total[1],Data_2019_all$Total[1])
Year <- c("arrest_2013","arrest_2015","arrest_2017","arrest_2019")

Plot<- data.frame(Year, Total_Arrest)
ggplot(Plot, aes(x=Year, y=Total_Arrest,group=1)) + geom_line(linetype = "dashed",color = "red")+geom_point()+
  ggtitle("Arrests per Year")+ theme(plot.title = element_text(hjust = 0.5))
# Plot2  ------------------------------------------------------------------

Plot_2019 <- Data_2019_all[-c(1),c(1,2)]
ggplot(Plot_2019, aes(x=Crime...Total.Arrest, y=Total)) + geom_bar(stat="identity")+
  ggtitle("Arrests in 2019")+ theme(plot.title = element_text(hjust = 0.5))+ theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +
  xlab("Crimes") + ylab("Total Arrest")


# Plot3  ------------------------------------------------------------------

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


# Plot of Total Population Incarceration Trend ----------------------------
plot1 <- ggplot() + 
  geom_line(aes(y = Total, x =  X2013),
            data = Arrest_Information) 
scale_x_continuous(breaks=seq(2011,2021,2))
theme(text=element_text(family="Tahoma"))


plot1 + labs(title = "Mass Incarceration", x = "Years", y = "Total Number of Arrests:" , caption = "By: Abdirahim M. ")






