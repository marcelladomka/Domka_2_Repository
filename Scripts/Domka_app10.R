#Marcella Domka
#March 27th, 2022
# FW 891: Lesson 10

# Part 2:

#Question 1: How does False Northing and False Easting prevent the use of negative numbers when setting coordinates?  
#Note: "prevent" is the wrong word as you still can use negative number – but, if you are using negative 
#numbers for coordinates, then you are probably using the wrong CRS/Datum. 

#When using False Easting, you're representing the x coordinates on a mapping. If you want to avoid negative values
#for False Easting, you would set the point of origin to be the intersection of the equator and central meridian (per
#zone). You would set the central meridian (per zone) to be 500,000 meters East. The idea here is to add values to
#your x coordinates so that no point will be negative.

#For False Northing, you're representing the y coordinates on a mapping. If you want to avoid negative values
#for False Northing, you set the northing at the equator to be 10,000,000 meters. Essentially, you add values to the
#y-coordinate INITIAL values so that no point will be negative.

  rm(list=ls());  options(show.error.locations = TRUE);

  # sp needs to be installed before sf package but you will still
  # get an error about sp not being installed -- this can be ignored
  library(package = "sp");       # old Simple Features (but still needed)
  library(package = "rgeos");    # getting/converting crs
  library(package = "rgdal");    # getting/converting crs
  library(package = "ggplot2");
  library(package = "sf");       # Simple Features
  library(package = "rnaturalearth");     # for getting coord data
  library(package = "rnaturalearthdata"); # for getting coord data
  
  lakes110 = ne_download(scale = 110, type = 'lakes', category = 'physical')
  
  # read in data from a csv file with spatial data
  cities = st_read(dsn="Scripts/cities.csv", header = TRUE);
  cities_SF1 = st_as_sf(cities, 
                         coords = c("Lon", "Lat")); 
  
  cities_SF2 = st_as_sf(cities, 
                         coords = c("Lon", "Lat"),
                         crs = 4326);
  
  lakeMichigan = st_read(dsn="data/Lake_Michigan_shoreline.kml");
  lakeMI_SF = st_as_sf(lakeMichigan); 
  
  lakes = st_read(dsn="Data/lakes/ne_10m_lakes.shp");  
  lakes_SF = st_as_sf(lakes); 
  
  install.packages("devtools")
  
  devtools::install_github("ropensci/rnaturalearthhires");
  
  states = ne_states(country = "United States of America");
  states_SF = st_as_sf(states);
  
  #### https://www.naturalearthdata.com/  (can get shapefiles from here)
  #### https://rdrr.io/cran/rnaturalearth/api/ (R interface to naturalearth website)
  #### https://gis-michigan.opendata.arcgis.com (Michigan shapefiles)

  
  canada <- ne_states(country="Canada")
  canada_SF = st_as_sf(canada);
  lake_erie = st_read(dsn="Data/Lake_Erie_Shoreline.kml");  
  lake_erie_SF = st_as_sf(lake_erie);
  
  
  # Remember that later component layer on top of earlier components
  plot1 = ggplot() +
    geom_sf(data = canada_SF,
            mapping = aes(geometry = geometry),
            color = "blue",
            fill = "grey") +
    # geom_sf(data=cities_SF2, aes(geometry = geometry), 
    #              fill="grey", 
    #              color="white", 
    #              size=0.35) +
    geom_sf(data = states_SF,
            mapping = aes(geometry = geometry),
            color = "black",
            fill = "grey") +
    geom_sf(data = lakes_SF,
            mapping = aes(geometry = geometry),
            color = "lightblue",
            fill = "lightblue") +
    # geom_sf(data = cities_SF2,
    #         mapping = aes(geometry = geometry),      
    #         color = "red", 
    #         fill = "red") +
    geom_sf(data = lakeMI_SF,
            mapping = aes(geometry = geometry),
            color = "blue",
            fill = "blue") +
  geom_sf(data = lake_erie_SF,
          mapping = aes(geometry = geometry),
          color = "pink",
          fill = "pink") +
    geom_sf_label(data = cities_SF2,
                  mapping = aes(geometry=geometry, label=City_Name),
                  color="purple",
                  fill = "yellow");
  
  plot2 = plot1 +
    coord_sf(crs = 4326,    
             xlim = c(-120, -70),  
             ylim = c(20, 60),
             expand = TRUE);
  plot(plot2);
  
  ### Often need to click Zoom button in Plot window to see full map
  plot3 = plot1 +
    coord_sf(crs = 26914,   
        xlim = c(500000, 2500000),
        ylim = c(4500000, 6000000),
        expand = TRUE);
  plot(plot3);
  
  #6 Using my own data:
  
  rsvr = st_read(dsn="Data/rsvr_891_v3.csv", header = TRUE);
  lakes110 = ne_download(scale = 110, type = 'lakes', category = 'physical')
  rsvr_SF1 = st_as_sf(rsvr, 
                        coords = c("lake_lon_decdeg", "lake_lat_decdeg"),
                      crs = 4326);
  
  plot4 = ggplot() +
    geom_sf(data=rsvr_SF1,
            mapping = aes(geometry = geometry), 
               fill="grey", 
               color="white") +
    geom_sf(data = states_SF,
            mapping = aes(geometry = geometry),
            color = "black",
            fill = "grey") +
    geom_sf(data = lakes_SF,
            mapping = aes(geometry = geometry),
            color = "lightblue",
            fill = "lightblue");
  plot(plot4)
  
  plot5 = plot4 +
    coord_sf(crs = 4326,   
             xlim = c(-73.19187, -69.9829),
             ylim = c(41.68435, 42.69828),
             expand = TRUE);
  plot(plot5)
  
  
  # I could not figure out how to zoom to my plotted lake points (from rsvr_SF1). Obviously the map
  #is not focused on the correct part of the US, so the lake points are not visible. I will meet with you and 
  #make corrections for this! Everything else should be correct.