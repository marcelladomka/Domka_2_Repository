# Marcella Domka
# 13b, 13c Homework Applications
# April 19th, 2022

install.packages("gganimate")
install.packages("ggrepel")
install.packages("av")
install.packages("gifski")
install.packages("transformr")
install.packages("ggsflabel")


library(package = "gifski");
library(package = "av");
library(package = "sp");       
library(package = "rgeos");    
library(package = "rgdal");    
library(package = "ggplot2");
library(package = "dplyr");
library(package = "sf");       
library(package = "rnaturalearth");
library(package = "rnaturalearthdata");
library(package = "ggrepel"); 
library(package = "gganimate");
library(package = "ggsflabel");

#13b Application:

rm(list=ls());  options(show.error.locations = TRUE);

pseudoData = read.csv("Data/pseudoData.csv");

stnDate2 = as.Date(pseudoData$date2,
                  format="%b %d, %Y")
stnDate3 = as.Date(pseudoData$date3,
                  format="%b %d, %Y")

stnDateTime2 = as.POSIXct(pseudoData$dateTime2,
                         format="%Y-%m-%d %I:%M%p")
stnDateTime3 = as.POSIXct(pseudoData$dateTime3,
                         format="%Y-%m-%d %I:%M%p")

date_formatted_1 = format(stnDate2, format="%d-%m, %y")
pseudoData$date_formatted_1 = date_formatted_1

date_formatted_2 = format(stnDateTime2,
                          format = "I%:%M:%S on %a %m/%d/%y")

date_formatted_3 = format(stnDateTime3,
                          format = "%s")
pseudoData$epoch = date_formatted_3

#My code is running, but data columns showing up as NA. I am clearly making a mistake in the code, but
#I am confused as to what I need to change.

# 13c Application:

Fish_Tracks = read.csv("Data/Two_Interpolated_Fish_Tracks.csv");
LakeErie = st_read(dsn="data/Lake_Erie_Shoreline.kml");

Fish_Tracks_SF = st_as_sf(Fish_Tracks, 
                         coords=c("longitude", "latitude"), 
                         crs=4326)

plot3 = ggplot() +
  geom_sf(data = LakeErie,
          mapping = aes(geometry = geometry)) +
  geom_sf(data = Fish_Tracks_SF,
          mapping = aes(geometry = geometry, 
                        color= record_type,
                        shape= as.factor(animal_id))) +
  coord_sf(crs = 4326,    
           xlim = c(-83.3, -80),
           ylim = c(41.28, 42.46));
plot(plot3)

stn_time_format = as.POSIXct(Fish_Tracks_SF$bin_timestamp,    
                     format="%m/%d/%Y %H:%M");
plot4 = plot3 +
  labs(title = "Fish Movement within Lake Erie",
       subtitle = "Timestamp: {format(frame_time, '%d-%b @ %I:%M%p')}") +
  theme(plot.title = element_text(color="purple", size=12)) +
  transition_time(time=stn_time_format);

animate(plot=plot4, 
        nframes = 300, 
        fps=10)

anim_save(filename = "Data/lakeErieAnimation.gif",   
          animation = plot4,
          nframes = 300,      
          fps = 10)

#Why are there many frames without any movement?
#The frames without movement fall under the 'detection' record type, showing that the fish location
#was detected in one spot for a long period. The blue color indicates interpolated data, showing that
#the fish movement was predicted, and not an exact detection

#Why are there so many points in each of the frames?
#I'm not totally sure...I think it's showing movement of multiple individual fish? That could be completely
#wrong, I'm not entirely sure of the context of the fish motion depicted here.