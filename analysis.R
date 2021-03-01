# Setup  ------------------------------------------------------------------
library("dplyr")
library("tidyverse")
library("ggplot2")
lint("analysis.R")
<<<<<<< HEAD
arrest_information <-
  read.csv("https://raw.githubusercontent.com/mschrier/https-classroom.github.com-a-XrLzm1Hu/main/Arrest_Information.csv")
view(arrest_information)

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
=======

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
>>>>>>> 46d8ed2bbc0f8df6ee71d959eca9437e0b080a7e

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

# Table -------------------------------------------------------------------

table <-
  summarise(data1, total_arrest = max(Total),
            black_arrest = max(Black.or.African.American),
            white_arrests = max(White),
            American_Indian_or_Alaska_Native_arrest =
              max(American.Indian.or.Alaska.Native),
            asian_arrests = max(Asian),
            Native_Hawaiian_or_Other_Pacific_Islander_arrest =
              max(Native.Hawaiian.or.Other.Pacific.Islander))
colnames(table)[1] <- "total arrest"
colnames(table)[2] <- "black arrest"
colnames(table)[3] <- "white arrest"
colnames(table)[4] <- "american indian or alaska native arrest"
colnames(table)[5] <- "asian arrests"
colnames(table)[7] <- "native hawaiian or other pacific islander arrest"
View(table)

# 1st chart ----------------------------
total_arrest <- c(data_2013_all$Total[1], data_2015_all$Total[1],
                  data_2017_all$Total[1], data_2019_all$Total[1])
year <- c("arrest 2013", "arrest 2015", "arrest 2017", "arrest 2019")

plot <- data.frame(year, total_arrest)
ggplot(plot, aes(x = year, y = total_arrest, group = 1)) +  geom_line(
  linetype = "dashed", color = "red") + geom_point() +  ggtitle(
    "Arrests per Year") + theme(plot.title = element_text(
      hjust = 0.5)) +  ylab("total arrest")

# 2nd chart -------------------------------
plot_2019 <- data_2019_all[-c(1), c(1, 2)]
summary(plot_2019)
ggplot(plot_2019, aes(x = ï..Crime...Total.Arrest, y = Total)) + geom_bar(
  stat = "identity") + ggtitle("Arrests in 2019") + theme(
    plot.title = element_text(hjust = 0.5)) + theme(
      axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)) + xlab(
        "Crimes") + ylab("Total Arrest")
