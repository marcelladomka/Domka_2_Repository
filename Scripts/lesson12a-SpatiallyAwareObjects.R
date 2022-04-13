   
  rm(list=ls());  options(show.error.locations = TRUE);
  source(file="Scripts/spatial-header.R"); # moved all package info to header.r

  # Get spatial data for all Lakes (downloaded from naturalearth) -- save to a SF
  lakes = st_read(dsn="Data/lakes/ne_10m_lakes.shp"); # can (usually) use this as an SF
  lakes_SF = st_as_sf(lakes); # on the safe side -- explicitly make into an SF
  
  # Get spatial data for the US using rnaturalearth package -- save to an SF
  states = ne_states(country = "United States of America");
  states_SF = st_as_sf(states);
  
  ## A decent webpage with a spatial example
  #  https://r-spatial.org/r/2018/10/25/ggplot2-sf.html
  
  # plot the US and the lakes 
  plot1 = ggplot() +
    geom_sf(data = states_SF,
            mapping = aes(geometry = geometry),
            color = "black",
            fill = "grey") +
    geom_sf(data = lakes_SF,
            mapping = aes(geometry = geometry),
            color = "lightblue",
            fill = "lightblue") +
    coord_sf(crs = 26917,  
        xlim = c(-3000000, 2000000),  # not the ideal CRS...
        ylim = c(3000000, 7000000),
        expand = TRUE);
  plot(plot1);
  
  install.packages("ggspatial")
  library(ggspatial)
  
  plot2 = plot1 +
    # These come from the ggspatial package...
    # They are "spatially aware" object (i.e., they adjust to the CRS)
    annotation_scale(location = "tl",  # options: tr, br, tl, bl
                   #  plot_unit ="m",  # needs to match CRS
                     width_hint = 0.2,
                     height = unit(0.7, "in"),
                     bar_cols = c("red", "orange"),
                     line_col = "gray20", 
                     pad_x = unit(2.7, "in"),
                     text_col = "blue") +
    annotation_spatial_hline(intercept = c(40,50), color = "red") +
    annotation_north_arrow(location = "bl", 
                  height = unit(0.85, "in"),
                  which_north = "true",
                  width = unit(1.25, "in"),
                  pad_x = unit(5.5, "in"), 
                  pad_y = unit(0, "in"),
                  style = north_arrow_fancy_orienteering(
                                      text_col = 'red',
                                      line_col = 'blue',
                                      fill = 'yellow'));
  plot(plot2);  
  
 
  my_data = st_read(dsn="Data/rsvr_891_v3.csv");
  my_data_SF = st_as_sf(my_data, 
                        coords = c("lake_lon_decdeg", "lake_lat_decdeg"),
                        crs = 4326);
  
  plot3 = ggplot() +
    geom_sf(data = my_data_SF,
            mapping = aes(geometry = geometry),
            color = "red");
  plot(plot3);

  plot4 = plot3 +
    # These come from the ggspatial package...
    # They are "spatially aware" object (i.e., they adjust to the CRS)
    annotation_scale(location = "tl",  # options: tr, br, tl, bl
                     #  plot_unit ="m",  # needs to match CRS
                     width_hint = 0.2,
                     height = unit(0.5, "in"),
                     bar_cols = c("blue", "green"),
                     line_col = "gray20", 
                     pad_x = unit(2.0, "in"),
                     text_col = "blue") +
    annotation_spatial_hline(intercept = c(42,71), color = "green") +
    annotation_spatial_hline(intercept = c(41.8, 72), color = "green") +
    annotation_north_arrow(location = "bl", 
                           height = unit(0.90, "in"),
                           which_north = "true",
                           width = unit(1.0, "in"),
                           pad_x = unit(5.5, "in"), 
                           pad_y = unit(0, "in"),
                           style = north_arrow_fancy_orienteering(
                             text_col = 'green',
                             line_col = 'orange',
                             fill = 'pink'));
  plot(plot4);
  
  saveRDS(plot4, file="Data/plot4.RData")
