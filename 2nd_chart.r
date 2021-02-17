# Plot of Black Population Incarceration Trend ----------------------------
plot1 <- ggplot() + 
  geom_line(aes(y = X2013, x =  Black.or.African.American.1),
            data = Arrest_Information) 
scale_x_continuous(breaks=seq(2013,2019,2))
theme(text=element_text(family="Tahoma"))


plot1 + labs(title = "Mass Incarceration", x = "Total of Black People Arrested", y = "Years", caption = "By: Abdirahim M. ")


