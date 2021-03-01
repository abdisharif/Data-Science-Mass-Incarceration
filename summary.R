## Install Package
library(dplyr)
library(lintr)
lint("summary.R")
## Load data
data <- read.csv("https://raw.githubusercontent.com/mschrier/https-classroom.github.com-a-XrLzm1Hu/main/Arrest_Information.csv")
View(data)

# data division by year
data_2013_all <- filter(data, X2013 == "2013")
data_2015_all <- filter(data, X2013 == "2015")
data_2017_all <- filter(data, X2013 == "2017")
data_2019_all <- filter(data, X2013 == "2019")
summary(data_2013_all)
# highest_race_crime_rate_2019
highest_race_crime_rate_2019 <-
  select(data_2019_all, White, Black.or.African.American,
         American.Indian.or.Alaska.Native,
         Asian, Native.Hawaiian.or.Other.Pacific.Islander)
highest_race_crime_rate_2019 <-
  colnames(highest_race_crime_rate_2019)[
    max.col(highest_race_crime_rate_2019, ties.method = "first")]
highest_race_crime_rate_2019 <-
  highest_race_crime_rate_2019[1]

# highest crime type for African Americans in 2013
data_2013 <- data_2013_all[-c(1, 29), ]
highest_crime_afri_amer_2013 <-
  as.vector(data_2013[which.max(data_2013$Black.or.African.American), 1])


#highest crime type for African Americans in 2019
data_2019 <- data_2019_all[-c(1, 29), ]
highest_crime_afri_amer_2019 <-
  as.vector(data_2019[which.max(data_2019$Black.or.African.American), 1])

# average criminal total for 2013, 2015,2017, and 2019
average_criminal_total <-
  mean(data_2013_all$Total[1], data_2015_all$Total[1],
       data_2017_all$Total[1], data_2019_all$Total[1])

# highest crime type for white in 2013
highest_crime_type_white_2013 <-
  as.vector(data_2013[which.max(data_2013$White), 1])

# highest crime type for white in 2019
highest_crime_type_white_2019 <-
  as.vector(data_2019[which.max(data_2019$White), 1])

summary <-
  t(data.frame(highest_race_crime_rate_2019,
               highest_crime_afri_amer_2013,
               highest_crime_afri_amer_2019,
               average_criminal_total, highest_crime_type_white_2013,
               highest_crime_type_white_2019))
View(summary)
