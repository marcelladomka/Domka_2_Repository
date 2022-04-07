### Marcella Domka
### March 1st, 2022
### GGPlot Lesson 8: Multipaneling

library(ggplot2)

rm(list=ls());                         # clear Environment tab
options(show.error.locations = TRUE);  # show line numbers on error
weatherData = read.csv(file="Data/Lansing2016Data.csv") # read in weather data
library(package=gridExtra) # gridExtra installed, called using library

#Create a histogram of tempDept restricted to days that meet a condition in the weatherType column

snowDays = grep(weatherData$weatherType, pattern="SN");   # any day with snow
meansnow = mean(weatherData[snowDays,]$tempDept)
meansnow
#mean for snowDays is -4.11

#charlie's example for corrections...:
#meanFog = mean(…);

#geom_vline(xintercept = meanFog) + 

plot1 = ggplot( data=weatherData[snowDays,] ) +
  geom_histogram(mapping = aes(x=tempDept)) +
  geom_vline(xintercept = meansnow) +
  theme_bw() +
  annotate(geom="text",  
           x=-10.5,        
           y=5.8,    
           label="-4.11",   
           color="red") +
  annotate(geom="segment",
           x=-8.95, 
           xend=-4.95,
           y=5.8, 
           yend=5.8,
           color = "red",
           linetype=2,
           size = 0.5,
           arrow = arrow()) +
  labs(title = "TempDept for Snowy Days",
       subtitle = "Lansing, Michigan: 2016",
       x = "TempDept (\u00B0F)");
plot(plot1)

#Repeat step 2 for two more weather conditions in weatherType

fogDays = grep(weatherData$weatherType, pattern="FG");   # any day with fog
meanfog =mean(weatherData[fogDays,]$tempDept)
#mean for fogDays is 2.58

plot2 = ggplot( data=weatherData[fogDays,] ) +
  geom_histogram(mapping = aes(x=tempDept)) +
  geom_vline(xintercept = meanfog) +
  theme_bw() +
  annotate(geom="text",  
           x=-2.5,        
           y=3.8,    
           label="2.58",   
           color="red") +
  annotate(geom="segment",
           x=-1.5, 
           xend=2.3,
           y=3.8, 
           yend=3.8,
           color = "red",
           linetype=2,
           size = 0.5,
           arrow = arrow()) +
  labs(title = "TempDept for Foggy Days",
       subtitle = "Lansing, Michigan: 2016",
       x = "TempDept (\u00B0F)");
plot(plot2)

hazeDays = grep(weatherData$weatherType, pattern="HZ");   # any day with haze
meanhaze = mean(weatherData[hazeDays,]$tempDept)
#mean for hazeDays is 0.016

plot3 = ggplot( data=weatherData[hazeDays,] ) +
  geom_histogram(mapping = aes(x=tempDept)) +
  geom_vline(xintercept = meanhaze) +
  theme_bw() +
  annotate(geom="text",  
           x=-4.5,        
           y=3.8,    
           label="0.016",   
           color="red") +
  annotate(geom="segment",
           x=-2.9, 
           xend=0.05,
           y=3.8, 
           yend=3.8,
           color = "red",
           linetype=2,
           size = 0.5,
           arrow = arrow()) +
  labs(title = "TempDept for Hazy Days",
       subtitle = "Lansing, Michigan: 2016",
       x = "TempDept (\u00B0F)");
plot(plot3)

#Create a histogram of tempDept restricted to days where two conditions occur in the weatherType column 

fog_and_haze = intersect(fogDays, hazeDays)
meanfoghaze = mean(weatherData[fog_and_haze,]$tempDept)
#mean for fog AND haze Days is -0.83

plot4 = ggplot( data=weatherData[fog_and_haze,] ) +
  geom_histogram(mapping = aes(x=tempDept)) +
  geom_vline(xintercept = meanfoghaze) +
  theme_bw() +
  annotate(geom="text",  
           x=-4.5,        
           y=1.8,    
           label="-0.83",   
           color="red") +
  annotate(geom="segment",
           x=-3.5, 
           xend=-1.0,
           y=1.8, 
           yend=1.8,
           color = "red",
           linetype=2,
           size = 0.5,
           arrow = arrow()) +
  labs(title = "TempDept for Days with Fog and Haze",
       subtitle = "Lansing, Michigan: 2016",
       x = "TempDept (\u00B0F)");
plot(plot4)

#Create a histogram of tempDept restricted to days where one of two conditions occur (from weatherType)

foggy_or_hazy = union(fogDays, hazeDays)
meanfog_or_haze = mean(weatherData[foggy_or_hazy,]$tempDept)
#mean for fog OR haze Days is 1.52

plot5 = ggplot( data=weatherData[foggy_or_hazy,] ) +
  geom_histogram(mapping = aes(x=tempDept)) +
  geom_vline(xintercept = meanfog_or_haze) +
  theme_bw() +
  annotate(geom="text",  
           x=-2.9,        
           y=4.8,    
           label="1.52",   
           color="red") +
  annotate(geom="segment",
           x=-1.8, 
           xend=1.25,
           y=4.8, 
           yend=4.8,
           color = "red",
           linetype=2,
           size = 0.5,
           arrow = arrow()) +
  labs(title = "TempDept for Days with Fog Or Haze",
       subtitle = "Lansing, Michigan: 2016",
       x = "TempDept (\u00B0F)");
plot(plot5)

#For all histograms, place a vertical line at the average tempDept and label 
#the line with the average value 
#***I went ahead and added the necessary code for this to each section of code for plots 1-5!

#Using arrangeGrob(), place the 5 histograms you created in the previous steps on one canvas

multi1=arrangeGrob(plot1, plot2, plot3, plot4, plot5,
                   ncol=3);
plot(multi1)

#Using arrangeGrob(), pick three histograms from steps 2-4 and place them on a canvas
#Resize at least 2 of the histogram so they take up more than 1 cell

multi2=arrangeGrob(plot1, plot2, plot3,
                   layout_matrix = rbind(c(1,1,1), #row 1: plot 1 takes up all 3 cells
                                         c(3,NA,NA), #row 2: plot 3 takes up 1st cell, NA in last 2
                                         c(2,2,NA))); #row 3: plot 2 takes up 2 cells, NA in last 1
plot(multi2)


#Answer the following in comments inside your application script:

#What was your level of comfort with the lesson/application?
 #1) It was all new to me, but not too bad!
#Approximately how long did you work on this lesson?
 #2) Maybe 2 hours or so?
#What areas of the lesson/application confused or still confuses you?
 #3) Nothing right now!
#What are some things you would like to know more about that is related to,
#but not covered in, this lesson?
 #4) NA right now, I've really needed assistance with multipaneling for thesis work, so this is helpful!