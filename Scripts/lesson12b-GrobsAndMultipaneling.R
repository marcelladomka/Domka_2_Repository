
  rm(list=ls());  options(show.error.locations = TRUE);
  source(file="Scripts/spatial-header.R"); # moved all package info to header.r

  ### Read in plot saved in last lesson -- puts the plot in the Environment
  plotInfo = readRDS(file="Data/plot4.RData");
  plot(plotInfo);  # same info but name has changed

  ### Let's get an images... and convert it to Grobs
  imgJPG = readJPEG("Data/alpaca.jpg");   # from the jpeg package
  imgGrobJPG = rasterGrob(imgJPG);
  
  # The above variables are raster data -- they are large!

  # Get Lake Michigan spatial data and save to an SF
  lakeMichigan = st_read(dsn="data/Lake_Michigan_shoreline.kml");
  lakeMI_SF = st_as_sf(lakeMichigan); 

  # A quick plot of Lake Michigan 
  plot_LakeMI = ggplot() +
    geom_sf(data = lakeMI_SF,
        mapping = aes(geometry = geometry),
        color = "blue",
        fill = "transparent") +
    theme_void() +   # remove all plot features
    theme(panel.background=element_rect(color = "black", fill="transparent", 
                                        size=3));
  plot(plot_LakeMI);
  
 
  ## multipaneling has to be done using grids
  #  https://cran.r-project.org/web/packages/gridExtra/vignettes/arrangeGrob.html
  
  ### Advantages:
  #   - maintains aspect ratio
  #   - bounding box not needed
  
  # The layout for the multipanel
  matrixLayout = matrix(nrow=4, ncol=3, 
                        byrow=TRUE,   # how the matrix is laid out
                        # this should visually match nrow and ncol!
                        data = c(1,   2,  3, 
                                 NA, NA, NA,
                                 NA, NA, NA,
                                 NA, NA,  1));
  
  #### Grobs and Multipaneling (mention ... argument)
  multi1=arrangeGrob(plotInfo, plot_LakeMI, imgGrobJPG,  # 1, 2, 3
                     top = textGrob(label = "Llamas",
                                    gp=gpar(fontsize=25,# (G)raphical (P)arameters
                                            col="blue")), 
                     right="Alpaca",
                     layout_matrix = matrixLayout);
  plot(multi1)
  
  
  
  
 #Steps 3 and 4
  
  plotInfo = readRDS(file="Data/plot4.RData");
  plot(plotInfo);  # same info but name has changed
  
  ### Let's get an images... and convert it to Grobs
  imgJPG2 = readJPEG("Data/Toucan2.jpg");   # from the jpeg package
  imgGrobJPG2 = rasterGrob(imgJPG2);
  
  # The above variables are raster data -- they are large!
  
  # A quick plot of Lake Michigan 
  plot_LakeMI = ggplot() +
    geom_sf(data = lakeMI_SF,
            mapping = aes(geometry = geometry),
            color = "blue",
            pad_x = unit(2.7, "in"),
            fill = "transparent") +
    theme_void() +   # remove all plot features
    theme(panel.background=element_rect(color = "black", fill="transparent", 
                                        size=3));
  plot(plot_LakeMI);
  
  matrixLayout = matrix(nrow=4, ncol=3, 
                        byrow=TRUE,   # how the matrix is laid out
                        # this should visually match nrow and ncol!
                        data = c(1,   2,  3, 
                                 NA, NA, NA,
                                 NA, NA, NA,
                                 NA, NA,  1));
  
  #### Grobs and Multipaneling (mention ... argument)
  multi2=arrangeGrob(plotInfo, plot_LakeMI, imgGrobJPG2,  # 1, 2, 3
                     top = textGrob(label = "Toucan",
                                    gp=gpar(fontsize=25,# (G)raphical (P)arameters
                                            col="blue")), 
                     right="Toucan",
                     layout_matrix = matrixLayout);
  plot(multi2)
  
  
  ### I couldn't figure out how to finish some of these tasks but I will figure it out for
  # the corrections.
