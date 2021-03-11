library(shiny)
library(tidyverse)
#Please put the file that was sent with this file
data <- read.csv("https://raw.githubusercontent.com/abdisharif/Info-Group/main/Arrest_info.csv")

#Fixing Variable names
vr_names<- c("Crime", "Total1", "White", "Black_or_African_American", "American_Indian_or_Alaska_Native",
             "Asian", "Native_Hawaiian_or_Other_Pacific_Islander", "Total1_p", 
             "White_p", "Black_or_African_p", "American_Indian_or_Alaska_Native_p","Asian_p",
             "Native_Hawaiian_or_Other Pacific_Islander_p","Total2", "Hispanic_or_Latino",
             "Not_Hispanic_or_Latino", "Total2_p", "Hispanic_or_Latino", "Not_Hispanic_or_Latino",
             "Year" )
names(data)<- vr_names 

#Races
Race<- c("White","Black_or_African_American",
         "American_Indian_or_Alaska_Native",
         "Asian","Native_Hawaiian_or_Other_Pacific_Islander",
         "Hispanic_or_Latino","Not_Hispanic_or_Latino"
)

#Data Manipulation
data[data =="Rape3"]="Rape"





# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  output$bar <- renderPlot({ 
    data1<-data[-c(1,32,63,94), c(1,2,ncol(data))]
    data1$Total<- data1$Total1/1000000
    y<- if(input$year==1){
      2013
    } else if(input$year==2){
      2015
    } else if( input$year==3){
      2017
    } else{ 2019 }
    
    data1 %>% filter(Year %in% all_of(y) ) %>% 
      ggplot(aes(x= Crime , y= Total))+
      geom_bar(stat="identity")+
      theme_minimal()+
      theme(axis.text.x = element_text(angle = 90, vjust = 1, hjust=1))+
      labs(title= "Bar diagram of total number of arrest by crime per year ")+
      xlab("Crime")+
      ylab( "Number of people(in Million)")
    
  })
  
  output$line<- renderPlot({
    
    r <- if(input$race==1){
      "White"
    }else if(input$race==2){
      "Black_or_African_American"
    }else if( input$race==3){
      "American_Indian_or_Alaska_Native"
    } else if(input$race==4){
      "Asian"
    }else if( input$race==5){
      "Native_Hawaiian_or_Other_Pacific_Islander"
    }else if(input$race==6){
      "Hispanic_or_Latino" 
    }else{ "Not_Hispanic_or_Latino" }
    
    data2<- data[c(1,32,63,94),c(3:7,15:16,20)]
    data2<- data2 %>% select(all_of(r),Year)
    data2$Year<- as.factor(data2$Year)
    names(data2)[1]= "Required_Race"
    data2 %>% group_by(Year) %>% summarise(Total=sum(Required_Race)/1000000) %>%  
      ggplot(aes(x=Year,y=Total, group=1,
             col = input$color_var))+
      geom_point()+
      geom_line(lty=2)+
      labs(title= "line chart of total number of arrests in different year for a indiviudal race")+
      xlab("Year")+
      ylab( "Number of People(in Million)")+
      geom_text(aes(label=Year),
                position=position_dodge(0.9), vjust=-.5, size=3,
                col="Black")
  })
  
  
  output$pie1 <- renderPlot({
    
    data3<-  data[c(1,32,63,94),c(2:7,14:16,20)]
    data3$Total<-data3$Total1+data3$Total2 
    data3<- data3 %>% select(-c(Total1, Total2 ))
    t<- data3$Total
    data3[1,1:7]<- round( 100*data3[1,1:7]/t[1],2)
    data3[2,1:7 ]<- round(100*data3[2,1:7 ]/t[2],2)
    data3[3,1:7]<- round(100*data3[3,1:7]/t[3],2)
    data3[4,1:7]<- round(100*data3[4,1:7 ]/t[4],2)
    data3_1<-data3 %>% select(-Total) %>% gather(Year)
    data3_1$Year1<- rep(data3$Year,nrow(data3_1)/4)
    
    y1<- if(input$year1==1){
      2013
    } else if(input$year1==2){
      2015
    } else if( input$year1==3){
      2017
    } else{ 2019 }
    data3_1 %>%  filter( Year1 %in% all_of(y1)) %>% 
      ggplot(aes(x=Year, y=value)) +
      geom_point(aes(size=value,col=Year),show.legend = F)+
      theme_minimal() +
      guides(fill=guide_legend(title="Year"))+
      theme(axis.text.x = element_text(angle = 90, vjust = 1, hjust=1))+
      ylim(c(0,50))+        
      labs(title= "Scatter plot of percentage of total arrests by race for individual year")+
      xlab("Race")+
      ylab( "Percentage of total arrests")
    
    
  })
  
  
  
})
