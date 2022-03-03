#Marcella Domka
#February 16th, 2022
#HOMEWORK EXTENSION DUE TO ILLNESS

rm(list=ls());                         # clear Environment tab
options(show.error.locations = TRUE);  # show line numbers on error
library(package=ggplot2);              # get the GGPlot package
  
  # read in CSV file and save the content to weatherData
  weatherData = read.csv(file="Data/Lansing2016Data.csv", 
                         stringsAsFactors = FALSE);
  
  #1) Make a scatterplot of temperature vs. humidity
  
  windspeedordered = factor(weatherData$windSpeedLevel,
                       levels=c("High", "Medium", "Low"));
  weatherData$windspeedordered = windspeedordered;
  
  winddirectionordered = factor(weatherData$windDir,
                                levels=c("North", "South", "East", "West"));
  weatherData$winddirectionordered = winddirectionordered;
  
  #facet by wind speed level in the x direction and have it go North, South, East, West
  #facet by wind direction in the y direction and have it descend from high, to medium, to low
  
  plot1 = ggplot( data=weatherData ) +
    geom_point( mapping=aes(x=avgTemp, y=relHum)) +
    theme_bw() +
    facet_grid( rows = vars(windspeedordered),
                cols = vars(winddirectionordered)) + 
    labs(title = "Humidity vs. Temperature",
         subtitle = "Lansing, Michigan: 2016",
         x = "Temperature (\u00B0F)",  
         y = "Humidity (\u0025)");     
  plot(plot1);

#2) Using the plot from fig 3:
  
  seasonOrdered = factor(weatherData$season,
                         levels=c("Spring", "Summer", "Fall", "Winter"));
  weatherData$seasonOrdered = seasonOrdered;
  
  plot2 = ggplot( data=weatherData ) +
    geom_histogram( mapping=aes(x=avgTemp, fill=seasonOrdered),
                    color= "black",
                    bins = 60) +
    theme_bw() +
    facet_grid( rows = vars(seasonOrdered) ) + 
    labs(title = "Temperature (\u00B0F)",
         subtitle = "Lansing, Michigan: 2016",
         x = "Temperature (\u00B0F)") +
    theme(strip.background = element_rect(fill = "yellow", colour = "red"),
          strip.text = element_text(colour = "grey2", size = rel(1.1), face = "bold"));
  plot(plot2);
  
  #appending plot
  
  plot3 = plot2 +    
    scale_x_continuous(limits=c(25,85),
                       breaks = c(25,35,45,55,65,75,85));
  plot(plot3);       
  
  #I cannot for the life of me figure out how to change the colors for each season. I tried creating a vector, using
  #scale_color_manual, adding colors to the code for seasonordered, etc. I cannot get anything to work.
  # the console also told me that bins was initially equal to 30, so I changed it to 60? But it seems sort of small.
  
#3) Using the plot from fig 13:
  
  windspeedordered2 = factor(weatherData$windSpeedLevel,
                            levels=c("Low", "Medium", "High"));
  weatherData$windspeedordered2 = windspeedordered2;
  
  winddirectionordered2 = factor(weatherData$windDir,
                                levels=c("North", "South", "East", "West"));
  weatherData$winddirectionordered2 = winddirectionordered2;
  
  
  boxColors = c(rep("blue", 3),
                rep("black", 9));
  
  
# I had to put the whole plot code as ##text because no matter how hard I tried, it would not stop giving me red x marks on the side 
  #of the code lines. I explained what I struggled with below. I know I will have to redo this for a better grade but I need help 
  #fixing these mistakes because I tried for hours and could not figure out what was wrong or how to do certain parts.
  
  #plot14 = ggplot(data=weatherData) +
    #geom_boxplot(mapping=aes(x=winddirectionordered2, y=changeMaxTemp),
                 #na.rm = TRUE, 
                 #outlier.color = rgb(red=0, green=0.3, blue=0),
                 #outlier.shape = "\u0026"),
                 #outlier.size = 6,
                 #color = boxColors,
                 #fill = "lightyellow") +
    #theme_bw() +
    #facet_grid( cols=vars(windSpeedLevel)) +
    #labs(title = "Change in Temperature vs. Wind Direction",
         #subtitle = "Lansing, Michigan: 2016",
         #x = "Wind Direction",
         #y = "Degrees (Fahrenheit)");
  #plot(plot4);


#4) How would you hide the outliers?  Give three ways (the easiest choices use the outlier.* subcomponents of geom_boxplot).
# You could use outlier.shape = NA, you could remove them from the dataset, or change the outlier size to 0. 

#What was your level of comfort with the lesson/application?
# 1) This lesson was once again very difficult in my opinion. It is hard to complete some of the tasks when they are not referenced
  #in the lesson for the week, unless I am missing things.
  
#Approximately how long did you work on this lesson?
# 2) I worked on this for 3 hours and I still can not get all of it correct/working.
  
#What areas of the lesson/application confused or still confuses you?
#3) I cannot get the season fill colors to work. I cannot get my unicode for ampersand to work, my outlier size will not
#change, my wind speed levels will not change to low medium high, I do not understand how to only get some of the
#boxplots to be light yellow and not others if we are not working with outline color, and I don't know how to figure
#out rgb if there is no key for colors online.
  
#What are some things you would like to know more about that is related to, but not covered in, this lesson?
#N/A right now until I understand how to do all parts of this lesson.