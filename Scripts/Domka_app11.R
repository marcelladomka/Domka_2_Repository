library(package = "sp");
library(package = "rgeos");
library(package = "rgdal");    
library(package = "ggplot2");
library(package = "dplyr");
library(package = "sf");
library(package = "rnaturalearth");     
library(package = "rnaturalearthdata"); 

my_data = st_read(dsn="Data/rsvr_891_v3.csv");
my_data_SF = st_as_sf(my_data, 
                      coords = c("lake_lon_decdeg", "lake_lat_decdeg"),
                      crs = 4326);

plot1 = ggplot() +
  geom_sf(data = my_data_SF,
          mapping = aes(geometry = geometry),
          color = "red");
plot(plot1);

  st_write(my_data_SF, dsn = "my_data.kml", 
           driver = "kml");

  st_write(my_data_SF, dsn = "my_data.geojson", 
           driver = "GeoJSON");

mydata_KML = st_read(dsn="my_data.kml");
mydata_GEO = st_read(dsn="my_data.geojson");

mydata_KML_SF = st_as_sf(mydata_KML);
mydata_GEO_SF = st_as_sf(mydata_GEO);

plot2 = ggplot() +
  geom_sf(data = mydata_KML_SF,
          mapping = aes(geometry = geometry),
          color = "purple");
plot(plot2)

#or....

plot3 = ggplot() +
  geom_sf(data = mydata_GEO_SF,
          mapping = aes(geometry = geometry),
          color = "forestgreen");
plot(plot3)

