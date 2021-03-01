library(ggplot2)
library(lintr)
library(dplyr)
<<<<<<< HEAD
lint("2nd_chart.R")
=======
lint("2nd_chart.r")

>>>>>>> 46d8ed2bbc0f8df6ee71d959eca9437e0b080a7e
## Load Data
data <-
  read.csv("https://raw.githubusercontent.com/mschrier/https-classroom.github.com-a-XrLzm1Hu/main/Arrest_Information.csv")
View(data)
# Data division by year
data_2013_all <- filter(data, X2013 == "2013")
data_2015_all <- filter(data, X2013 == "2015")
data_2017_all <- filter(data, X2013 == "2017")
data_2019_all <- filter(data, X2013 == "2019")

plot_2019 <- data_2019_all[-c(1), c(1, 2)]
summary(plot_2019)
ggplot(plot_2019, aes(x = ï..Crime...Total.Arrest, y = Total)) + geom_bar(
  stat = "identity") + ggtitle("Arrests in 2019") + theme(
    plot.title = element_text(hjust = 0.5)) + theme(
      axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)) + xlab(
        "Crimes") + ylab("Total Arrest")
