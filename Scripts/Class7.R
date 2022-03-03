rm(list=ls());                         # clear Environment tab
options(show.error.locations = TRUE);  # show line numbers on error
library(package=ggplot2);              # get the GGPlot package
library(package=ggforce);              # for geom_circle, geom_ellipse

#BREAKOUT ROOM 1

# METHOD 1
weatherData = read.csv(file="Data/Lansing2016Data.csv")

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

#METHOD 2

plot1 = ggplot(data=weatherData, 
               mapping=aes(x=windDirOrdered, y=changeMaxTemp)) +
  theme_bw() +
  geom_boxplot() +
  labs(title = "Change in Temperature vs. Wind Direction",
       subtitle = "Lansing, Michigan: 2016",
       x = "Wind Direction",
       y = "Change in Temperature (\u00B0F)");
plot(plot1)

#METHOD 3

plot1 = ggplot() +
  theme_bw() +
  geom_boxplot(data=weatherData,
               mapping=aes(x=windDirOrdered, y=changeMaxTemp)) +
  labs(title = "Change in Temperature vs. Wind Direction",
       subtitle = "Lansing, Michigan: 2016",
       x = "Wind Direction",
       y = "Change in Temperature (\u00B0F)");
plot(plot1)

#METHOD 4

plot1 = ggplot() +
  theme_bw() +
  geom_boxplot(mapping=aes(x=weatherData$windDirOrdered, y=weatherData$changeMaxTemp)) +
  labs(title = "Change in Temperature vs. Wind Direction",
       subtitle = "Lansing, Michigan: 2016",
       x = "Wind Direction",
       y = "Change in Temperature (\u00B0F)");
plot(plot1)

#BREAKOUT ROOM 2
#facet_wrap and facet_grid

plot2 = ggplot(data=weatherData) +
  geom_point(mapping=aes(x=stnPressure, y=relHum)) +
  theme_bw() +
  labs(title = "Pressure vs. Humidity",
       subtitle = "Lansing, Michigan: 2016",
       x = "Pressure (mmHg)",
       y = "Relative Humidity (%)") +
  facet_wrap(facets = vars(season, windSpeedLevel), ncol = 5, labeller = "label_both")
plot(plot2)
### labeller controls how labels are printed on the plots. "label_both" gives us overall 
#name of category and the level within the categorical variable. 
#Ex. "season" is labeled, along with the type of season ("Fall) on each plot.


plot3 = ggplot(data=weatherData) +
  geom_point(mapping=aes(x=stnPressure, y=relHum)) +
  theme_bw() +
  labs(title = "Pressure vs. Humidity",
       subtitle = "Lansing, Michigan: 2016",
       x = "Pressure (mmHg)",
       y = "Relative Humidity (%)") +
  facet_grid(facets = vars(season, windSpeedLevel))
plot(plot3)