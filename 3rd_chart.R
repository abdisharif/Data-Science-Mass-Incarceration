## Install Package
library(reshape2)
library(ggplot2)
library(dplyr)
<<<<<<< HEAD
library(lintr)
lint("3rd_chart.R")
=======
lint("3rd_chart.R")

>>>>>>> 46d8ed2bbc0f8df6ee71d959eca9437e0b080a7e
## Load Data
data <-
  read.csv("https://raw.githubusercontent.com/mschrier/https-classroom.github.com-a-XrLzm1Hu/main/Arrest_Information.csv")
# Data of 2019
data_2019_all <- filter(data, X2013 == "2019")

total_arrest <- c(data_2019_all$White[1],
                  data_2019_all$Black.or.African.American[1],
                  data_2019_all$Asian[1],
                  data_2019_all$American.Indian.or.Alaska.Native[1],
                  data_2019_all$Native.Hawaiian.or.Other.Pacific.Islander[1])

pie(total_arrest, main = "Arrest 2019",
    labels = c("White", "Black",
               "Asian", "America Indian Alaska Native",
               "Native Hawaiian or Other Pacific Islander"), radius = 0.8,
    cex = 0.7)