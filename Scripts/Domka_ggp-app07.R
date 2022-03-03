### Marcella Domka
### February 21st, 2022
### GGPlot Lesson 7: Annotations

install.packages("ggforce")

  rm(list=ls());                         # clear Environment tab
  options(show.error.locations = TRUE);  # show line numbers on error
  library(package=ggplot2);              # get the GGPlot package
  library(package=ggforce);              # for geom_circle, geom_ellipse
  
  # read in CSV file and save the content to weatherData
  weatherData = read.csv(file="Data/Lansing2016Data.csv")
  
  # 1) Using the plot from fig 1:
  
  #Using annotate, add three outlier points to the East box (two above and one below).
  #Change the color, shape, and size of the points
  #Labels the points with their value
  #Put black boxes behind the labels
  
  #First, recreate the plot from figure 1 
  
  windDirOrdered = factor(weatherData$windDir,
                          levels=c("North", "East", "South", "West"));
  
  plot1 = ggplot(data=weatherData) +
    geom_boxplot(mapping=aes(x=windDirOrdered, y=changeMaxTemp)) +
    theme_bw() +
    labs(title = "Change in Temperature vs. Wind Direction",
         subtitle = "Lansing, Michigan: 2016",
         x = "Wind Direction",
         y = "Change in Temperature (\u00B0F)");
  plot(plot1)
  
  #Use ggbuild to retrieve outlier data and create vectors
  
  renderedData = ggplot_build(plot1)
  outliers = renderedData$data[[1]]$outliers
  
  xVector = c(2, 2, 2);
  yVector = c(18, 24, -25);
  pointSize = c(4,4,4);
  pointFill = c("purple", "green", "blue");
  
  # Create 3 outliers (2 above and 1 below) the 'East' box, change color/size/shape of outliers
  
  plot2 =  plot1 +
    annotate(geom="point",
             x = xVector,
             y = yVector,
             size = pointSize,
             color =rgb(red=0, green=.6, blue=.4),
             fill = pointFill,
             shape = 22);                          
  plot(plot2)
  
  # Write labeling code to label points with their values + put black boxes behind labels
  
  plot3 = plot2 + 
    annotate(geom="rect",   
             xmin = .7,    
             xmax = 1.1,    
             ymin = 21.8,   
             ymax = 26.5,   
             alpha = 1.0,
             linetype=2,
             color = "red",
             fill = "black") +
    annotate(geom="text",  
             x=.9,        
             y=24,    
             label="24",   
             color="red") +
    annotate(geom="segment",
             x=1.2, 
             xend=1.95,
             y=24, 
             yend=24,
             color = "red",
             linetype=2,
             size = 0.5,
             arrow = arrow());
  plot(plot3)
  
  plot4 = plot3 +
    annotate(geom="rect",   
             xmin = .7,    
             xmax = 1.1,    
             ymin = 14.8,   
             ymax = 20.5,   
             alpha = 1.0,
             linetype=2,
             color = "red",
             fill = "black") +
    annotate(geom="text",  
             x=.9,        
             y=18,    
             label="18",   
             color="red") +
    annotate(geom="segment",
             x=1.2, 
             xend=1.95,
             y=18, 
             yend=18,
             color = "red",
             linetype=2,
             size = 0.5,
             arrow = arrow());
  plot(plot4)
  
  plot5 = plot4 + 
    annotate(geom="rect",   
             xmin = .7,    
             xmax = 1.1,    
             ymin = -27.8,   
             ymax = -22.5,   
             alpha = 1.0,
             linetype=2,
             color = "red",
             fill = "black") +
    annotate(geom="text",  
             x=.9,        
             y=-25,    
             label="-25",   
             color="red") +
    annotate(geom="segment",
             x=1.2, 
             xend=1.95,
             y=-25, 
             yend=-25,
             color = "red",
             linetype=2,
             size = 0.5,
             arrow = arrow());
  plot(plot5)
  
# 2) Using annotate create a scatterplot of just the first 100 values of relative humidity vs. average temperature:
  
  first100_hum <- weatherData$relHum[1:100]
  first100_avg <- weatherData$avgTemp[1:100]
  
  plot6 = ggplot() +
    theme_bw() +
    annotate(geom="point",
             x = first100_avg, 
             y = first100_hum,
             size = 3,
             color = "blue",
             fill = "red",
             shape = 21) + 
    labs(title="Scatterplot using annotate",
         x = "Average Temperature",
         y = "Relative Humidity");
  plot(plot6)
  
#Create a 5-point polygon that covers all temperature points less than or equal to 20 degrees
  
  plot7 = plot6 +
    annotate(geom="polygon",
             x = c(21,5,.5,0,21),
             y = c(85,80,75,60,60),
             color = "blue",
             fill = "green",
             linetype = 4,
             alpha = 0.4);
  plot(plot7)
  
  #Add a horizontal and vertical line that represents the median temperature and 
  #median humidity for the 100 values
  
  medianTemp = median(first100_avg);
  medianHum = median(first100_hum)
  
  plot8 = plot7 +
    geom_vline(mapping=aes(xintercept = medianTemp),
               color = "pink",
               size= 2) +
    geom_hline(mapping=aes(yintercept = medianHum),
               color="yellow",
               size=2);
  plot(plot8)
  
  #Create an ellipse that covers the 9 points circled in grey below
  
  plot9 = plot8 + 
    coord_fixed() +
    geom_ellipse(mapping=aes(x0 = 45, y0 = 90, a = 15, b=9, angle=-10),
                 alpha=0.2,   
                 color = "pink",
                 fill = "blue",
                 size=3,
                 linetype=3);
  plot(plot9)
  
# 3) Using annotate, create a plot of y = sqrt(x), add arrow to the end of the curve
  
  y_values <- seq(1,1000)
  x_values_1 <- seq(1:1000)
  x_values_2 <- sqrt(x_values_1)
  x_values_2
  
  
  plot10 = ggplot() +
    theme_bw() +
    annotate(geom="line",
             x = x_values_2, 
             y = y_values,
             size = 3,
             color = "blue",
             fill = "red",
             shape = 21) + 
    annotate(geom="segment",
             x=30, 
             xend=32,
             y=900, 
             yend=1010,
             color = "blue",
             linetype=1,
             size = 3,
             arrow = arrow()) +
    labs(title="Scatterplot using annotate",
         x = "Square Root of 1-1000 Sequence",
         y = "1-1000 Sequence");
  plot(plot10)
  
  #10.1 Questions
  
  #This was all new to me, but I feel comfortable with it after going through the lesson + application.
  #I worked on this for 2-3 hours total.
  #There are no areas that I am still confused about.
  #Maybe how to rotate arrows within the plot (similar to changing the angles with ellipses).