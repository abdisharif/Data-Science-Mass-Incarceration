## Install Package
library(lintr)
library(ggplot2)
library(dplyr)
lint("first_chart.R")
## Load Data
data <-
  read.csv("https://raw.githubusercontent.com/mschrier/https-classroom.github.com-a-XrLzm1Hu/main/Arrest_Information.csv")
View(data)
# Data division by year
data_2013_all <- filter(data, X2013 == "2013")
data_2015_all <- filter(data, X2013 == "2015")
data_2017_all <- filter(data, X2013 == "2017")
data_2019_all <- filter(data, X2013 == "2019")

total_arrest <- c(data_2013_all$Total[1], data_2015_all$Total[1],
                  data_2017_all$Total[1], data_2019_all$Total[1])
year <- c("arrest 2013", "arrest 2015", "arrest 2017", "arrest 2019")

plot <- data.frame(year, total_arrest)
ggplot(plot, aes(x = year, y = total_arrest, group = 1)) +  geom_line(
  linetype = "dashed", color = "red") + geom_point() +  ggtitle(
    "Arrests per Year") + theme(plot.title = element_text(
      hjust = 0.5)) +  ylab("total arrest") 
