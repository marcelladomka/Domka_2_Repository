#Marcella Domka
#Last Updated: February 15th, 2022
#HOMEWORK EXTENSION DUE TO ILLNESS
#GGPlot Lesson 5

rm(list=ls());                         # clear Environment tab
options(show.error.locations = TRUE);  # show line numbers on error
library(package=ggplot2);              # get the GGPlot package

# read in CSV file and save the content to weatherData
weatherData = read.csv(file="Data/Lansing2016Data.csv", 
                       stringsAsFactors = FALSE);


# 1) For the humidity vs. average temperature scatterplot: map shape to season, manually change mapped shapes

plot1 = ggplot( data=weatherData ) +
  geom_point( mapping=aes(x=avgTemp, y=relHum, shape=season)) +
  theme_bw() +
  scale_shape_manual(values=c(21, 22, 23, 24)) +
  labs(title = "Humidity vs. Temperature",
       subtitle = "Lansing, Michigan: 2016",
       x = "Temperature (\u00B0F)",  
       y = "Humidity (\u0025)");     
plot(plot1);

#I did the homework out of order so "plot 7" is used up here because I came to this question last
#change the background color of the points to match the season (you will need to make a second mapping)
#add a regression line
#map regression line color to season
#remove confidence interval from linear regressions
#first example of appending plot

seasonpart2 = factor(weatherData$season,
                       levels=c("Spring", "Summer", "Fall", "Winter"));
plot7 = plot1 + 
    geom_point( mapping=aes(x=avgTemp, y=relHum, color=seasonpart2) ) +
    geom_smooth( mapping=aes(x=avgTemp, y=relHum, color=seasonpart2),
                 method="lm", se=F) +
    theme_bw() +
    labs(title = "Humidity vs. Temperature",
         subtitle = "Lansing, Michigan: 2016",
         x = "Temperature (\u00B0F)",  
         y = "Humidity (\u0025)");     
plot(plot7);

#2) Create a histogram of relative humidity

plot3 = ggplot( data=weatherData ) +
  geom_histogram( mapping=aes(x=relHum)) +
  theme_bw() +
  labs(title = "Relative Humidity",
       subtitle = "Lansing, Michigan: 2016",
       x = "Relative Humidity");     
plot(plot3);

#set the order of wind speed levels to Low -> Medium -> High

windspeedorder = factor(weatherData$windSpeedLevel,
                       levels=c("Low", "Medium", "High"));

#set the wind speed level colors to green -> yellow -> red
#map the outline color to wind speed levels
#set background color of histogram to black

plot4 = ggplot( data=weatherData ) +
  geom_histogram( mapping=aes(x=relHum, color=windspeedorder)) +
  theme_dark() +
  scale_color_manual(values=c("Low" = "green", "Medium" = "yellow", "High" = "red" ));
  labs(title = "Relative Humidity",
       subtitle = "Lansing, Michigan: 2016",
       x = "Relative Humidity");     
plot(plot4);

#3) Create a scatterplot of humidity vs. average temperature + map color to stnPressure
#also change point opacity to 50%, and make size of points 2x

plot5 = ggplot( data=weatherData ) +
  geom_point( mapping=aes(x=avgTemp, y=relHum, color=stnPressure),
              size =2,
              alpha=.50) +
  theme_bw() +
  labs(title = "Humidity vs. Temperature",
       subtitle = "Lansing, Michigan: 2016",
       x = "Temperature (\u00B0F)",  
       y = "Humidity (\u0025)");     
plot(plot5);

#Create a color gradient with 3 colors, middle color 1/3 of way through the gradient (already equidistant), 
#+ show use of appending plot

plotA = plot5 + 
  scale_color_gradientn(colors=c("purple", "orange", "red")); 
plot(plotA);

#Answer the following in comments inside your application script:

# 1) This lesson was difficult, in my opinion
# 2) A couple of hours, and still not sure I did it correctly
# 3) Removing confidence intervals and adding regression lines
# 4) This lesson was thorough, I just need some more practice with it. So, nothing new to cover.