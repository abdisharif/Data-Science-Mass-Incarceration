## Install Package
install.packages("dplyr")
library(dplyr)

## Load Data
Data <- read.csv("https://raw.githubusercontent.com/mschrier/https-classroom.github.com-a-XrLzm1Hu/main/Arrest_Information.csv")
View(Data)

# Data division by year
Data_2013_all <- filter(Data, X2013=="2013")
Data_2015_all <- filter(Data, X2013=="2015")
Data_2017_all <- filter(Data, X2013=="2017")
Data_2019_all <- filter(Data, X2013=="2019")
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

