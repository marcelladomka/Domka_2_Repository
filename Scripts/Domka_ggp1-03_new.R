### Marcella R. Domka
### January 25th, 2022
### GGPlot Lesson 3 (Mapping and Aesthetics)
### ALL APPLICATION ANSWERS CAN BE FOUND AT THE BOTTOM OF THE SCRIPT
### CHANGES TO CODE (as directed by the lesson) can be found in their respective chunks

{
  rm(list=ls());                         # clear Environment tab
  options(show.error.locations = TRUE);  # show line numbers on error
  library(package=ggplot2);              # get the GGPlot package
  
  # read in CSV file and save the content to weatherData
  weatherData = read.csv(file="Data/Lansing2016Data.csv", 
                         stringsAsFactors = FALSE);  # for people still using R v3
  
  #### Part 1: Last lesson's plot ####
  plot1 = ggplot( data=weatherData ) +
    geom_point( mapping=aes(x=avgTemp, y=relHum) ) +
    labs( title="Humidity vs Temperature",
          subtitle="Lansing, MI -- 2016",
          x = "Average Temperatures (Fahrenheit)",
          y = "Relative Humidity") +
    scale_x_continuous( breaks = seq(from=10, to=80, by=10) ) +
    theme_bw() +
    theme( axis.text.x=element_text(angle=90, vjust=0.5) );
  plot(plot1);
  
  #### Part 2: Same plot with awful code spacing. Please don't do this.  ####
  plot2 = ggplot( data=weatherData ) + geom_point( mapping=aes(x=avgTemp, 
                                                               y=relHum) ) + labs( title="Humidity vs Temperature", subtitle="Lansing, MI -- 2016",
                                                                                   x = "Average Temperatures (Fahrenheit)", y = "Relative Humidity") +
    scale_x_continuous( breaks = seq(from=10, to=80, by=10) ) + theme_bw() +
    theme( axis.text.x=element_text(angle=90, vjust=0.5) );  plot(plot2);
  
  #### Part 3: adding color to represent season ####
  plot3 = ggplot( data=weatherData ) +
    geom_point( mapping=aes(x=avgTemp, y=relHum, color=season) ) +
    labs( title="Humidity vs Temperature",
          subtitle="Lansing, MI -- 2016",
          x = "Average Temperatures (Fahrenheit)",
          y = "Relative Humidity") +
    scale_x_continuous( breaks = seq(from=10, to=80, by=10) ) +
    theme_bw() +
    theme( axis.text.x=element_text(angle=90, vjust=0.5) );
  plot(plot3);
  
  #### Part 3b: adding color to represent precip2 ####
  plot3b = ggplot( data=weatherData ) +
    geom_point( mapping=aes(x=avgTemp, y=relHum, color=precip2) ) +
    labs( title="Humidity vs Temperature",
          subtitle="Lansing, MI -- 2016",
          x = "Average Temperatures (Fahrenheit)",
          y = "Relative Humidity") +
    scale_x_continuous( breaks = seq(from=10, to=80, by=10) ) +
    theme_bw() +
    theme( axis.text.x=element_text(angle=90, vjust=0.5) );
  plot(plot3b);
  
  #### Part 3c: adding color to represent the string precip column ####
  plot3c = ggplot( data=weatherData ) +
    geom_point( mapping=aes(x=avgTemp, y=relHum, color=precip) ) +
    labs( title="Humidity vs Temperature",
          subtitle="Lansing, MI -- 2016",
          x = "Average Temperatures (Fahrenheit)",
          y = "Relative Humidity") +
    scale_x_continuous( breaks = seq(from=10, to=80, by=10) ) +
    theme_bw() +
    theme( axis.text.x=element_text(angle=90, vjust=0.5) );
  plot(plot3c);
  
  #### Part 4: adding size to represent precipitation ####
  plot4 = ggplot( data=weatherData ) +
    geom_point( mapping=aes(x=avgTemp, y=relHum, size=precip2) ) +
    labs( title="Humidity vs Temperature",
          subtitle="Lansing, MI -- 2016",
          x = "Average Temperatures (Fahrenheit)",
          y = "Relative Humidity") +
    scale_x_continuous( breaks = seq(from=10, to=80, by=10) ) +
    theme_bw() +
    theme( axis.text.x=element_text(angle=90, vjust=0.5) );
  plot(plot4);
  
  #### Part 4b: map size to a string value ####
  plot4b = ggplot( data=weatherData ) +
    geom_point( mapping=aes(x=avgTemp, y=relHum, size=season) ) +
    labs( title="Humidity vs Temperature",
          subtitle="Lansing, MI -- 2016",
          x = "Average Temperatures (Fahrenheit)",
          y = "Relative Humidity") +
    scale_x_continuous( breaks = seq(from=10, to=80, by=10) ) +
    theme_bw() +
    theme( axis.text.x=element_text(angle=90, vjust=0.5) );
  plot(plot4b);
  
  #### Part 4c: map alpha to a numeric value ####
  plot4c = ggplot( data=weatherData ) +
    geom_point( mapping=aes(x=avgTemp, y=relHum, alpha=precip2) ) +
    labs( title="Humidity vs Temperature",
          subtitle="Lansing, MI -- 2016",
          x = "Average Temperatures (Fahrenheit)",
          y = "Relative Humidity") +
    scale_x_continuous( breaks = seq(from=10, to=80, by=10) ) +
    theme_bw() +
    theme( axis.text.x=element_text(angle=90, vjust=0.5) );
  plot(plot4c);
  
  #### Part 5: Change legend position and title ####
  plot5 = ggplot( data=weatherData ) +
    geom_point( mapping=aes(x=avgTemp, y=relHum, alpha=precip2) ) +
    labs( title="Humidity vs Temperature",
          subtitle="Lansing, MI -- 2016",
          x = "Average Temperatures (Fahrenheit)",
          y = "Relative Humidity",
          alpha = "Precipitation") +
    scale_x_continuous( breaks = seq(from=10, to=80, by=10) ) +
    theme_bw() +
    theme( axis.text.x=element_text(angle=90, vjust=0.5),
           legend.position = c(0.15, 0.2));
  plot(plot5);
  
  #### Part 6: combining size and color ####
  plot6 = ggplot( data=weatherData ) +
    geom_point( mapping=aes(x=avgTemp, y=relHum, size=precip2, color=season) ) +
    labs( title="Humidity vs Temperature",
          subtitle="Lansing, MI -- 2016",
          x = "Average Temperatures (Fahrenheit)",
          y = "Relative Humidity",
          size = "Precipitation",
          color = "Seasons") +    # changes order
    scale_x_continuous( breaks = seq(from=10, to=80, by=10) ) +
    theme_bw() +
    theme( axis.text.x=element_text(angle=90, vjust=0.5) ,
           legend.position = "left");
  plot(plot6);
  
  #### Part 7: adding a linear model ####
  plot7 = ggplot( data=weatherData ) +
    geom_point( mapping=aes(x=avgTemp, y=relHum, size=precip2, color=season) ) +
    geom_smooth( mapping=aes(x=avgTemp, y=relHum), 
                 method="lm" ) +
    labs( title="Humidity vs Temperature",
          subtitle="Lansing, MI -- 2016",
          x = "Average Temperatures (Fahrenheit)",
          y = "Relative Humidity",
          size = "Precipitation",
          color = "Seasons") +    # changes order
    scale_x_continuous( breaks = seq(from=10, to=80, by=10) ) +
    theme_bw() +
    theme( axis.text.x=element_text(angle=90, vjust=0.5) ,
           legend.position = "none");
  plot(plot7);
  
  #### Part 8: overlapping plots ####
  plot8 = ggplot( data=weatherData ) +
    geom_smooth( mapping=aes(x=avgTemp, y=relHum, color=season), 
                 method="lm") +
    geom_point( mapping=aes(x=avgTemp, y=relHum, size=precip2, color=season) ) +
    labs( title="Humidity vs Temperature",
          subtitle="Lansing, MI -- 2016",
          x = "Average Temperatures (Fahrenheit)",
          y = "Relative Humidity",
          size = "Precipitation",
          color = "Seasons") +    # changes order
    scale_x_continuous( breaks = seq(from=10, to=80, by=10) ) +
    theme_bw() +
    theme( axis.text.x=element_text(angle=90, vjust=0.5) ,
           legend.position = "none");
  plot(plot8);
}


### APPLICATION:

# 10A: When you add the mapping color=season to the linear model, you get a regression line for
#each of the four seasons, rather than the previous single regression line plotted over the
#scatterplot. When I try linetype=season, there are still 4 regression lines, but they are no longer
#representing the season colors.

# 10B:
plot9 = ggplot( data=weatherData ) +
  geom_smooth( mapping=aes(x=windSpeed, y=tempDept), 
               method="lm" ) +
  geom_point( mapping=aes(x=windSpeed, y=tempDept, size=precip2, color=windDir) ) +
  labs( title="Wind Speed vs. Temperature Deviation from Avg.",
        subtitle="Lansing, MI -- 2016",
        x = "Wind Speed (mph)",
        y = "Temperature Dept (degrees F)",
        size = "Precipitation",
        color = "Wind Direction") +    # changes order
  scale_x_continuous( breaks = seq(from=10, to=80, by=10) ) +
  theme_minimal() +
  theme( axis.text.x=element_text(angle=90, vjust=0.5) ,
         legend.position = c(0.88, 0.47));
plot(plot9);

#The pattern that I see in the plot is that, as wind speed increases, temperature dept increases as well.
#Precipitation seems to be greatest around wind speeds of 10 mph, and winds moving south seem to be associated
#with higher levels of precipitation.

#10C:

plot10 = ggplot( data=weatherData ) +
  geom_point( mapping=aes(x=windPeakSpeed, y=minTemp, color=windSpeedLevel, size=coolDays, shape=season) ) +
  labs( title="Wind Peak Speed vs. Minimum Temperature",
        subtitle="Lansing, MI -- 2016",
        x = "Wind Peak Speed (mph)",
        y = "Minimum Temperature (degrees F)",
        size = "Cool Days",
        shape = "Season",
        color = "Wind Speed Level") +    # changes order
  scale_x_continuous( breaks = seq(from=10, to=80, by=10) ) +
  theme_light() +
  theme( axis.text.x=element_text(angle=90, vjust=0.5) ,
         legend.position = c(0.88, 0.47));
plot(plot10);

# 10.1 APPLICATION QUESTIONS:

# 1) My level of comfort was good!
# 2) I would say I worked on the whole lesson for about 45 mins - 1 hr (reading through the lesson and then
#doing the application and interpretation.)
# 3) I think the only thing I struggled with was trying to make the scatterplot with 5 mappings, because
#I was trying to make a plot where all the variables would make sense together. I don't think the product
#plot is super aesthetically pleasing.
# 4) I can't think of anything off the top of my head, this lesson was helpful in terms of aesthetics!
