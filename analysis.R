# Setup  ------------------------------------------------------------------
library("dplyr")
library("tidyverse")
library("ggplot2")

Arrest_Information <- read.csv("https://raw.githubusercontent.com/mschrier/https-classroom.github.com-a-XrLzm1Hu/main/Arrest_Information.csv")
view(Arrest_Information)

# summary -----------------------------------------------------------
Data_2013_all <- filter(Arrest_Information, X2013=="2013")
Data_2015_all <- filter(Arrest_Information, X2013=="2015")
Data_2017_all <- filter(Arrest_Information, X2013=="2017")
Data_2019_all <- filter(Arrest_Information, X2013=="2019")
summary(Data_2013_all)

# race_with_the_highest_crime_rate_in_2019
race_with_the_highest_crime_rate_in_2019 <- select(Data_2019_all, White,Black.or.African.American,American.Indian.or.Alaska.Native,Asian,Native.Hawaiian.or.Other.Pacific.Islander)
race_with_the_highest_crime_rate_in_2019 <- colnames(race_with_the_highest_crime_rate_in_2019)[max.col(race_with_the_highest_crime_rate_in_2019,ties.method="first")]
race_with_the_highest_crime_rate_in_2019 <- race_with_the_highest_crime_rate_in_2019[1]

# highest crime type for African Americans in 2013
Data_2013 <- Data_2013_all[-c(1,29),]
highest_crime_type_for_African_Americans_in_2013 <- as.vector(Data_2013[which.max(Data_2013$Black.or.African.American),1])


#highest crime type for African Americans in 2019
Data_2019 <- Data_2019_all[-c(1,29),]
highest_crime_type_for_African_Americans_in_2019 <- as.vector(Data_2019[which.max(Data_2019$Black.or.African.American),1])

# average criminal total for 2013, 2015,2017, and 2019
average_criminal_total <- mean(Data_2013_all$Total[1],Data_2015_all$Total[1],Data_2017_all$Total[1],Data_2019_all$Total[1])

# highest crime type for white in 2013
highest_crime_type_for_white_in_2013 <- as.vector(Data_2013[which.max(Data_2013$White),1])

# highest crime type for white in 2019
highest_crime_type_for_white_in_2019 <- as.vector(Data_2019[which.max(Data_2019$White),1])

summary <- t(data.frame(race_with_the_highest_crime_rate_in_2019,highest_crime_type_for_African_Americans_in_2013,highest_crime_type_for_African_Americans_in_2019,average_criminal_total,highest_crime_type_for_white_in_2013,highest_crime_type_for_white_in_2019))
View(summary)

# Table -------------------------------------------------------------------

Data1 <- group_by(Arrest_Information, X2013)

Table <- summarise(Data1, total_arrest = max(Total), 
                   black_arrest = max(Black.or.African.American), white_arrests = max(White),
                   American_Indian_or_Alaska_Native_arrest = max(American.Indian.or.Alaska.Native),
                   asian_arrests = max(Asian), Native_Hawaiian_or_Other_Pacific_Islander_arrest = max(Native.Hawaiian.or.Other.Pacific.Islander))
View(Table)


# 1st chart ----------------------------

Data_2013_all <- filter(Arrest_Information, X2013=="2013")
Data_2015_all <- filter(Arrest_Information, X2013=="2015")
Data_2017_all <- filter(Arrest_Information, X2013=="2017")
Data_2019_all <- filter(Arrest_Information, X2013=="2019")

Total_Arrest<- c(Data_2013_all$Total[1],Data_2015_all$Total[1],Data_2017_all$Total[1],Data_2019_all$Total[1])
Year <- c("arrest_2013","arrest_2015","arrest_2017","arrest_2019")

Plot<- data.frame(Year, Total_Arrest)
ggplot(Plot, aes(x=Year, y=Total_Arrest,group=1)) + geom_line(linetype = "dashed",color = "red")+geom_point()+
  ggtitle("Arrests per Year")+ theme(plot.title = element_text(hjust = 0.5))

# 2nd chart -------------------------------
# Data division by year

Plot_2019 <- Data_2019_all[-c(1),c(1,2)]
ggplot(Plot_2019, aes(x=ï..Crime...Total.Arrest, y=Total)) + geom_bar(stat="identity")+
  ggtitle("Arrests in 2019")+ theme(plot.title = element_text(hjust = 0.5))+ theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +
  xlab("Crimes") + ylab("Total Arrest")

# 3rd Chart ---------------------------------------------------------------------

boxplot(Arrest_Information$Black.or.African.American,
        main = "Decrease in Black Arrests",
        xlab = "Black Arrests",
        ylab = "Total",
        col = "orange",
        border = "brown",
        horizontal = TRUE,
        notch = TRUE
)
