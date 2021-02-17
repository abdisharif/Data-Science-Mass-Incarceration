#Mass Incarceration Project 
# Setup  ------------------------------------------------------------------
library("dplyr")
library("tidyverse")
library("lintr")
library("styler")
library("stringr")
library("expss")
library("lubridate")
library("plyr")

# Load the data from "https://raw.githubusercontent.com/mschrier/https-classroom.github.com-a-XrLzm1Hu/main/Arrest_Information.csv"
Arrest_Information <- read.csv("https://raw.githubusercontent.com/mschrier/https-classroom.github.com-a-XrLzm1Hu/main/Arrest_Information.csv")
view(Arrest_Information)

dim(Arrest_Information)
unique(Arrest_Information$X2013)
length(unique(Arrest_Information$Black.or.African.American.1))
length(unique(Arrest_Information$White))



# Questions/Variables -------------------------------

# into a variable called `incarceration`
Incarceration <- read.csv("https://gist.github.com/curran/8838736cfa6f3f960e2c#file-data-csv")
View(Incarceration)

#what county has the highest incarceration rate?
total_deaths <- national %>%
  filter(date ==max(date))%>%
  pull(deaths)

# How many cases have occured in the U.S.? `total_cases`
total_jail_population <- Incarceration %>%
  filter(date ==max(date))%>%
  pull(cases)

library("dplyr")
library("tidyverse")

# Plot1  ------------------------------------------------------------------




# Plot2  ------------------------------------------------------------------
# Plot of Black Population Incarceration Trend 
plot1 <- ggplot() + 
  geom_line(aes(y = X2013, x =  Black.or.African.American.1),
            data = Arrest_Information) 
scale_x_continuous(breaks=seq(2013,2019,2))
theme(text=element_text(family="Tahoma"))


plot1 + labs(title = "Mass Incarceration", x = "Total of Black People Arrested", y = "Years", caption = "By: Abdirahim M. ")


