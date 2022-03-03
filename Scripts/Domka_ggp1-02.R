# Marcella Domka
# UPDATED January 21st, 2022
# Advanced Topics in R

#Section 10.0

# Part A Completed

# Part B

# 1) geom_label or geom_text would allow you to add text to a plot
# 2) You would use scale_*_date for this.

# Part C

#Read in data
LansingWeather2016 = read.csv(file="C:/Users/Marcella Domka/Documents/Advanced Topics in R/Domka_RProject/Data/LansingWeather2016.csv")

library(ggplot2)
weather_plot = ggplot( data=LansingWeather2016 ) +
  geom_point( mapping=aes(x= stnPressure, y=windSpeed) ) +
  labs( title="StnPressure Vs. WindSpeed",
        subtitle="Lansing, MI -- 2016",
        x = "StnPressure (psi)",
        y = "Windspeed (mph)") +
  theme_light() +
  theme(axis.text.x = element_text(angle = 45)) + 
  scale_y_continuous(breaks = c(3,12,21), 
                     limits = c(0, 21)) +
  scale_x_continuous(breaks= c(28.6,28.85, 29.1, 29.35, 29.6), 
                     limits = c(28.6, 29.5))
plot(weather_plot)

#Section 10.1

# 1) I was decently comfortable with this lesson, since I have some ggplot2 experience. I did struggle
#with a few parts.

# 2) I am having trouble with scale_y_continuous and scale_x_continuous. I didn't understand how to
#change the x-axis breaks to go up by 0.1, so I tried to code for a break sequence. I've also used limits
#before and was a little rusty there, because I don't feel like they did what I want.

# 3) This lesson was pretty thorough, which I liked. Maybe learning more about positions and aesthetics!
