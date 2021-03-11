
# This is the user-interface for the Shiny web application. 


library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(                 
  
  # Application title
  titlePanel("Arrest Information"),
  
  navbarPage("",
             tabPanel("Introduction/Summary",
                      "By: Abdirahim, Matthew, and Confidence",
                      img(src = "mass incarceration.jpg", height = 200, width = 500),
                      
                      p("Mass incarceration in the United States has boggled the mind of my teammates and I for some time; so we set out to learn more. In this great 'land of the free' 'home of the brave', 
                      why is there such an embarassingly high number of incarceration? And why does it seem to target a specific group? Black Americans. What crimes are they most indicted 
                      for compared to other races? Is the rate of incarceration going up or is it finally starting to come down? Join us as we learn more and try to unravel this mystery!"),
                      
                      p("We choose this project in order to shed light on the mass incarceration problems for the minorities in the United States.A couple questions that we wanted to answer while working through our project was, What crime has led to the most arrests in the African American community? and What percentage of the total arrests are of African Americans. 
                        Our datasets looks at the total number of arrests in the United States by race and by crime. Our first graphs look at the total number of arrests by different crimes in the years 2013,2015,2017, and 2019.
                        We choose to display this graph because it shows the primary crimes that are resulting in the majority of arrests in the United States. This could allow us to zero in on the problem so that we can create the best possible solutions.
                        For instance we found that drug abuse violations and property crimes comprise of most of the arrests, but drug abuse violations, comprised of mostly African Americans. 
                        The second graph looks at total arrests by race over the years 2013, 2015, 2017, and 2019. We choose this graph because it allowed us to get a general overview of the trends of arrests for each race. 
                        This could allow us to determine if we were on the right track or not with reducing mass incarceration for certain races and what races are still being discriminated against. 
                        Lastly, we display a scatter plot that looks at total arrests by race as a percentage of the whole over the years. This allows us to to see how impactful arrests are on each race, and how much of a problem mass incarceration is in this country.
                        After looking at the information we noticed that even though African Americans are 13.4% of the United States populationm, there arrests are really high (around 20% of the Arrests.)")
                      
                    
                      
                     
             ),
             tabPanel("Bar Graph",
                      sidebarLayout(
                        sidebarPanel(
                          selectInput("year", h3("Select Year"),
                                      choices=list("2013"=1,"2015"=2,"2017"=3, "2019"=4 ),
                                      selected = 0)
                        ),
                        mainPanel(
                          plotOutput("bar"),
                          p("Our first chart shows the total number of arrests by crime per year"),
                        )    
                      )
                      
             ),
             
             tabPanel("Line Graph",
                      sidebarLayout(
                        sidebarPanel(
                          selectInput("race", h3("Select Race"),
                                      choices=list("White"=1, "Black or African American"=2,
                                                   "American Indian or Alaska Native"=3,"Asian"= 4,
                                                   "Native Hawaiian or Other Pacific Islander"=5,
                                                   "Hispanic or Latino"=6, "Not Hispanic or Latino"=7), 
                                      selected=1)
                        ),
                        
                        mainPanel(
                          plotOutput("line"),
                          p("Our second chart shows the total number of arrests by year for each race"),
                        )
                      )
             ),
             tabPanel("Scatter Plot",
                      sidebarLayout(
                        sidebarPanel(
                          selectInput("year1", h3("Select Year"),
                                      choices=list("2013"=1,"2015"=2,"2017"=3, "2019"=4 ),
                                      selected = 0) 
                        ),
                        mainPanel(
                          plotOutput("pie1"),
                          p("Finally our third and last chart shows the percentage of arrests for different races for each year"),
                        )    
                      )
                    ),
             tabPanel("Conclusion",
               mainPanel(
                 img(src = "image2.jpg", height = 200, width = 500),
                 p("Mass incarceration has been at an all time high in the United states. We can see that Black people have higher arrests rates compared to any other race in the US. 
                   In the charts it shows there is a higher number of arrests among the White Population but this is not the case. The population of White people in American is a lot bigger compared to all other races. 
                   Given this knowledge, it shows that Black arrests are astronomically higher than they should be."),
                 
                 p("We had three specific takeaways from the analysis. First, drug crimes comprise of the highest rates of arrests for any crime in the United States. 
                   This is important because it shows, which crimes are resulting the the mass incarceration problem faced in the United States. Second, we noticed that the drug crimes were mostly crimes that people of color committed where as white people were mostly arrested for property crime. 
                   This is important because it shows that drug crimes are negatively impacting black people. The third takeaway was that arrest trends are decreasing for whites, blacks, American Indians, and Asians. 
                   This is important because it shows that we are on the right track of solving a very difficult mass incarceration problem, but more work needs to be done."),
                 
                 p("Mass incarceration is a tremendous problem in the United States and we hope we  shed some light on this through our data analysis. Many people who are incarcerated are because of crimes they didn't commit or an unjustified sentence term. A lot of prisoners are released from prison but are not ready for the society they are released in. 
                   We also noticed that those who are mostly affected are living in poor communities and are of African American descent. This causes a higher percentage of reincarceration. It is a repetitive system. There needs to be a change in how education is brought up in the United states because both systems coincide. 
                   I hope that we can make the changes we need to solve this problem. ")
               )
             )
            )
           )
          )


