# Marcella Domka
# February 1st, 2022
# Lesson 4: GGPlot - Elements and Styles

  rm(list=ls());                         # clear Environment tab
  options(show.error.locations = TRUE);  # show line numbers on error
  library(package=ggplot2);              # get the GGPlot package
  
  # read in CSV file and save the content to weatherData
  weatherData = read.csv(file="Data/Lansing2016Data.csv", 
                         stringsAsFactors = FALSE);
  
  # Make the first unique plot (modifies plot points using 5 unique properties, 5 total modifications)
  
  plot1 = ggplot( data=weatherData ) +
    geom_point( mapping=aes(x=minTemp, y=precip2), 
                color="navyblue", 
                size=3, 
                shape=22,
                fill="red",
                alpha=.5) +
    theme_bw() +
    labs(title = "Minimum Temperature vs. Precipitation",
         subtitle = "Lansing, Michigan: 2016",
         x = "Temperature (F)",
         y = "Precipitation (in)");
  plot(plot1);
  
  # Make second unique plot (same as above but modifies plot points with 6th and final 
  #modification of color="yellow")
  
  plot2 = ggplot( data=weatherData ) +
    geom_point( mapping=aes(x=minTemp, y=precip2), 
                color="yellow", 
                size=3, 
                shape=22,
                fill="red",
                alpha=.5) +
    theme_bw() +
    labs(title = "Minimum Temperature vs. Precipitation",
         subtitle = "Lansing, Michigan: 2016",
         x = "Temperature (F)",
         y = "Precipitation (in)");
  plot(plot2);
  
  #Make third unique plot with 4 modifications to plot lines with at least 3 unique properties
  
  plot3 = ggplot(data=weatherData) +
    geom_line(mapping=aes(x=1:nrow(weatherData), y=minTemp),
              color="darkorchid2") +
    geom_line(mapping=aes(x=1:nrow(weatherData), y=precip2), 
              color=rgb(red=0, green=0, blue=1)) +   
    theme_bw() +
    geom_smooth(mapping=aes(x=1:nrow(weatherData), y=minTemp),
                method="loess",
                color=rgb(red=1, green=1, blue=0),
                linetype=4,
                size=2, 
                fill="maroon1") +
    labs(title = "Minimum Temperature vs. Precipitation",
         subtitle = "Lansing, Michigan: 2016",
         x = "Precipitation (in)",
         y = "Temperature (F)");
  plot(plot3);
  
  
  #Make fourth unique plot with additional modifications to plot lines with at least 3 unique properties
  
  plot4 = ggplot(data=weatherData) +
  geom_line(mapping=aes(x=1:nrow(weatherData), y=minTemp),
            color="lawngreen") +
    geom_line(mapping=aes(x=1:nrow(weatherData), y=maxTemp), 
              color=rgb(red=1, green=1, blue=1)) +   
    theme_bw() +
    geom_smooth(mapping=aes(x=1:nrow(weatherData), y=minTemp),
                method="loess",
                color=rgb(red=.3, green=.3, blue=.3),
                linetype=3,
                size=4, 
                fill="lightsalmon") +
    labs(title = "Minimum Temperature vs. Maximum Temperature",
         subtitle = "Lansing, Michigan: 2016",
         x = "Temperature (F)",
         y = "Temperature (F)");
  plot(plot4);
  
  #Make fifth unique plot making modifications to 4 unique element_text subcomponents (other 4 will be later)
  
  plot5 = ggplot( data=weatherData ) +
    geom_point( mapping=aes(x=maxTemp, y=precip2),
                color="lightseagreen",
                size=3,
                shape=24,
                alpha = 0.9 ) +
    theme_bw() +
    labs(title = "Max Temperature vs. Precipitation",
         subtitle = "Lansing, Michigan: 2016",
         x = "Temperature (F)",
         y = "Precipitation (in)") +
    theme(axis.title.x=element_text(size=15, color="mediumspringgreen"),
          axis.title.y=element_text(size=15, color="lightcoral"), 
          plot.title=element_text(size=19, face="bold", 
                                  color ="navyblue"),
          plot.subtitle=element_text(size=12, face="italic", 
                                     color ="black", family="serif"));
  plot(plot5);
  
##Modifications to 4 unique element_line() subcomponents
  
  plot6 = ggplot( data=weatherData ) +
    geom_point( mapping=aes(x=maxTemp, y=precip2),
                color="lightseagreen",
                size=3,
                shape=24,
                alpha = 0.9 ) +
    theme_bw() +
    labs(title = "Max Temperature vs. Precipitation",
         subtitle = "Lansing, Michigan: 2016",
         x = "Temperature (F)",
         y = "Precipitation (in)") +
    theme(axis.ticks = element_line(color="pink", size=2),
          panel.grid.minor = element_line(color="grey95", linetype=3),
          panel.grid.minor.x = element_line(color="grey93", linetype=3),
          panel.grid.major.x = element_line(color="grey92", linetype=3),
          panel.grid.major = element_line(color="grey90", lineend = "square"));
  plot(plot6);
  
  #Modifications to 4 unique element_rect() subcomponents, plus the other 4 element_text subcomponents
  
  plot7 = ggplot( data=weatherData ) +
    geom_point( mapping=aes(x=minTemp, y=relHum, color=season, size=precip2)) +
    theme_minimal() +
    labs(title = "Humidity vs. Minimum Temperature",
         subtitle = "Lansing, Michigan: 2016",
         x = "Temperature (F)",
         y = "Humidity (%)") +
    theme( axis.text.x=element_text(angle=90, vjust=0.5) ,
           legend.title = element_text(size=19, face="bold", 
                                       color ="navyblue"),
           legend.text = element_text(size=10, face="bold", 
                                      color ="navyblue"),
           plot.caption = element_text(size=19, face="bold", 
                                       color ="navyblue"),
           plot.tag = element_text(size=19, face="bold", 
                                   color ="navyblue"),
           legend.background = element_rect(color="purple", fill="grey75",
                                            size=3, linetype = 4),
           panel.border = element_rect(fill=NA),
           plot.background = element_rect(color = "red"),
           panel.background = element_rect(fill="grey20", color="orange")); 
  plot(plot7);
  
  #Using Unicode 1st time and more RGB
  
  plot8 = ggplot( data=weatherData ) +
    geom_point( mapping=aes(x=minTemp, y=relHum),
                color=rgb(red=0, green=0, blue=0.3),
                size=4,
                shape="\u04F3" ) +
    theme_bw() +
    labs(title = "Humidity vs. Minimum Temperature",
         subtitle = "Lansing, Michigan: 2016",
         x = "Temperature (F)",
         y = "Humidity (%)");
  plot(plot8);
  
  #different unicode use
  
  plot9 = ggplot( data=weatherData ) +
    geom_point( mapping=aes(x=minTemp, y=relHum),
                color=rgb(red=0, green=0, blue=0.3),
                size=4,
                shape="\u04F6" ) +
    theme_bw() +
    labs(title = "Humidity vs. Minimum Temperature",
         subtitle = "Lansing, Michigan: 2016",
         x = "Temperature (F)",
         y = "Humidity (%)");
  plot(plot9);

  #another unicode change 
  plot10 = ggplot( data=weatherData ) +
    geom_point( mapping=aes(x=minTemp, y=relHum),
                color=rgb(red=0, green=0, blue=0.3),
                size=4,
                shape="\u04C6" ) +
    theme_bw() +
    labs(title = "Humidity vs. Minimum Temperature",
         subtitle = "Lansing, Michigan: 2016",
         x = "Temperature (F)",
         y = "Humidity (%)");
  plot(plot10);
    
  #another unicode change
  
  plot11 = ggplot( data=weatherData ) +
    geom_point( mapping=aes(x=minTemp, y=relHum),
                color=rgb(red=0, green=0, blue=0.3),
                size=4,
                shape="\u04BC" ) +
    theme_bw() +
    labs(title = "Humidity vs. Minimum Temperature",
         subtitle = "Lansing, Michigan: 2016",
         x = "Temperature (F)",
         y = "Humidity (%)");
  plot(plot11);
  
  #last unicode experimentation
  
  plot12 = ggplot( data=weatherData ) +
    geom_point( mapping=aes(x=minTemp, y=relHum),
                color=rgb(red=0, green=0, blue=0.3),
                size=4,
                shape="\u03A6" ) +
    theme_bw() +
    labs(title = "Humidity vs. Minimum Temperature",
         subtitle = "Lansing, Michigan: 2016",
         x = "Temperature (F)",
         y = "Humidity (%)");
  plot(plot12);
  
  
#### REPORT ###
  
# (1) #6 modifications to plot points using at least 3 unique properties (color, size...)
  
  # I did step 1 in plots 1 and 2 by changing color, size, shape, fill of plot points. I also changed opacity
  #by using alpha.
  
  
# (2) #6 modifications to plot lines using at least 3 unique properties (linetype, color...)
  
  #Did this in plots 3 and 4 to alter color, linetype, size, and fill of the plot lines
  
  
# (3) #Modifications to 8 unique element_text() subcomponents (DONE)
  
    #Did this in plot 5 AND plot 7 to change the text appearance/style of plot and axes titles.
  
  
# (4) #Modifications to 4 unique element_line() subcomponent (DONE)
  # Did this in plot 6 to change panel grids (major and minor) and to modify axis ticks/lines/gridlines.
  
  
# (5) #Modifications to 4 unique element_rect() subcomponent (DONE) -- can be found in plot 7
  
  # Did this in plot7 to alter legend characteristics and panel backgrounds (can change linetype, fill, etc.)
  
# (6) 5 uses of unicode
   # plots 8-12 have different unicodes to code for different characters and change the appearance of the
  # plot points.
  
  
  # (7) 4 uses of RGB colors.
    # Did this several times throughout many plots to alter color using specific RGB code.
  
  
  # (8) 1 use of alpha - this was also done many times to change opacity of different plot properties, whether
  #points or something else
  
  
  # (9) Grey scale used in plot 7 (for example) to choose color of select elements on the plot, which will
  #range from dark to light.
  

  # Level of comfort: mostly new to me, but it wasn't too bad! Just took a while.
  # Nothing right now!
  # I can definitely use this lesson to help me craft publication-worthy figures for my upcoming GSO presentation.
  # This was pretty thorough!

  