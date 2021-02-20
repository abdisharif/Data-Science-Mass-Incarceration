## Install Package
install.packages("ggplot2")
install.packages("reshape2")
library(reshape2)
library(ggplot2)
library(dplyr)
lint("3rd_chart.R")

## Load Data
Data <- read.csv("https://raw.githubusercontent.com/mschrier/https-classroom.github.com-a-XrLzm1Hu/main/Arrest_Information.csv")


# Data of 2019
Data_2019_all <- filter(Data, X2013=="2019")

Total_Arrest<- c(Data_2019_all$White[1],Data_2019_all$Black.or.African.American[1],Data_2019_all$Asian[1],
                 Data_2019_all$American.Indian.or.Alaska.Native[1],Data_2019_all$Native.Hawaiian.or.Other.Pacific.Islander[1])

pie(Total_Arrest, main = "Arrest_2019",labels=c("White_arrest","Black_arrest","Asian_arrest","America_Indian_Alaska_Native_Arrest",
                                                "Native_Hawaiian_or_Other_Pacific_Islander_arrest"), radius = 1)









