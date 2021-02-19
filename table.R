## Install Package
install.packages("dplyr")
library(dplyr)

## Load Data
Data <- read.csv("https://raw.githubusercontent.com/mschrier/https-classroom.github.com-a-XrLzm1Hu/main/Arrest_Information.csv")
View(Data)

Data1 <- group_by(Data, X2013)

Table <- summarise(Data1, total_arrest = max(Total), 
                   black_arrest = max(Black.or.African.American), white_arrests = max(White),
                   American_Indian_or_Alaska_Native_arrest = max(American.Indian.or.Alaska.Native),
                   asian_arrests = max(Asian), Native_Hawaiian_or_Other_Pacific_Islander_arrest = max(Native.Hawaiian.or.Other.Pacific.Islander))
View(Table)




