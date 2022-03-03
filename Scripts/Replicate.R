### Marcella Domka
### February 21st, 2022
### HOMEWORK EXTENSION DUE TO ILLNESS (*** NOTE: I'm not sure if this was officially "due" last week, since the
#homework document just said to let you know where we were/if we were having issues, but I thought
#I'd label this as having an extension just in case).

rm(list=ls());                         # clear Environment tab
options(show.error.locations = TRUE);  # show line numbers on error
library(package=ggplot2);              # get the GGPlot package

# read in CSV file and save the content to weatherData
weatherData = read.csv(file="Data/Lansing2016Data.csv")

windDir_2 = factor(weatherData$windDir,
                              levels=c("North", "East", "South", "West"));

plot1 = ggplot( data=weatherData ) +
  geom_point( mapping=aes(x=relHum, y=avgTemp, color=windSpeed, shape=windDir_2),
              size = 3) +
  theme_minimal() +
  scale_shape_manual(values=c("~", "%", "@", "*")) +
  scale_x_continuous(breaks =c(50,60,70,80,90)) +
  scale_y_continuous(breaks =c(0,25,50,75,100)) +
  theme( axis.text.x=element_text(angle=90, vjust=0.5, face = "bold", colour = "dark red"),
         axis.text.y=element_text(angle=90, vjust=0.5),
         legend.title = element_text(color = "dark red", face="bold"),
         plot.subtitle = element_text(hjust = 0.5, face = "italic"),
         panel.grid.minor = element_line(colour = "grey95", size = 0.2),
         panel.grid.major = element_line(colour = "grey95", linetype = 2, size = 0.2),
         plot.title = element_text(hjust = 0.5, colour = "dark green"),
         legend.background = element_rect(color="green", linetype= 2, fill="grey90",
         size=1),
         plot.background = element_rect(fill = "lightyellow1"),
         legend.key = element_rect(colour = "blue", fill = "light blue"),
         legend.position = ("bottom"),
         panel.background = element_rect(fill="grey10", color="blue", size = 3)) +
  labs(title = "Humidity vs. Temperature",
       subtitle = "Lansing, Michigan: 2016",
       y = "Temperature (F)",
       x = "Humidity (\u0025)"); #I used unicode for the x-axis symbol 
plot(plot1)

plot2 = plot1 + 
  scale_color_gradientn(colors=c("green", "yellow", "orange", "purple")); 
plot(plot2)

#4) change grid lines correctly?
#5) check that four scale_* are used (only 3)?