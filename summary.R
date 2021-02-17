## Install Package
install.packages("dplyr")
library(dplyr)

## Load Data
Data <- read.csv("")

## create five variables
# race with the highest crime rate
race_with_the_highest_crime_rate <- colnames(Data[,c(3:7)])[max.col(Data[,c(3:7)],ties.method="first")]
race_with_the_highest_crime_rate[1]

# highest crime type for white
highest_crime_type_for_white <- as.vector(Data[which.max(Data$White[2:NROW(Data)])+1,1])
highest_crime_type_for_white

# highest crime type for African Americans 
highest_crime_type_for_black <- as.vector(Data[which.max(Data$Black.or.African.American[2:NROW(Data)])+1,1])
highest_crime_type_for_black

# highest crime total
highest_crime_total <- max(Data$Total[2:NROW(Data)])
highest_crime_total 

# total number of max crime type for African Americans 
total_number_of_max_crime_type_for_blacks <- max(Data$Black.or.African.American[2:NROW(Data)])
total_number_of_max_crime_type_for_blacks

