rm(list=ls());                         # clear Environment tab
options(show.error.locations = TRUE);  # show line numbers on error
library(package=ggplot2);              # get the GGPlot package
library(package=ggforce);              # for geom_circle, geom_ellipse

# read in CSV file and save the content to weatherData
weatherData = read.csv(file="Data/Lansing2016Data.csv");
janTemps = read.csv(file="data/LansingJanTemps.csv");

plotA1 = ggplot(data=weatherData) + 
  theme_bw() +
  annotate(geom = "curve", 
           x = 67, y = 90, xend = 82, yend = 82, 
    curvature = -.6, arrow = arrow(length = unit(5, "mm"))) +
  annotate(geom = "curve", 
           x = 37, y = 50, xend = 20, yend = 48, 
           curvature = -.6, arrow = arrow(length = unit(5, "mm"))) +
  geom_point(mapping=aes(x=avgTemp, y=relHum)) +
  geom_smooth(mapping=aes(x=avgTemp, y=relHum),
              method = "lm",
              fill = "red");
plot(plotA1)


plotA2 = ggplot(data=weatherData) +
  geom_point(mapping=aes(x=avgTemp, y=relHum)) +
  geom_abline(intercept = 30, slope = 0.78) +
  geom_abline(intercept = 100, slope = -0.78) +
  geom_smooth(mapping=aes(x=avgTemp, y=relHum),
              method = "lm",
              fill = "red");
plot(plotA2)

#practice GitHub commit and push changes
##new changes to the script