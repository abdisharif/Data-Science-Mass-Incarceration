## Install Package
library(dplyr)
<<<<<<< HEAD
library(lintr)
lint("table.R")
=======
lint("table.R")

>>>>>>> 46d8ed2bbc0f8df6ee71d959eca9437e0b080a7e
## Load Data
data <- read.csv("https://raw.githubusercontent.com/mschrier/https-classroom.github.com-a-XrLzm1Hu/main/Arrest_Information.csv")
View(data)

data1 <- group_by(data, X2013)

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
