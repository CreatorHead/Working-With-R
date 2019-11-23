### Plots
# Plots (Graphs, Visualisation,...) are very powerful tools. They allow you to
# quickly grasp trends and patterns in data sets, some of which could not be 
# spotted by analysing summery tables only

# In R, 'ggplot2' package gives you endless posibilites to create visualisation

# In this video, we focus on qplot() function (from 'ggplot2'), which can provide
# high quality graphs with very little effort.

# setwd("F:/Workspace/Working With R/DataSets") # TO set a Working Dir
setwd("/media/user/Alpha/Workspace/Working With R/DataSets") # TO set a Working Dir

# Import RDS file
Countries_All = readRDS("As_RDS_Countries_All_Data_2017.RDS")
summary(Countries_All)
View(Countries_All)

# Import ggplot2 package for graph
install.packages('ggplot2')
library(ggplot2)

# Default: Histogram
qplot(GDP.per.capita.2017, data=Countries_All)

# Add title and labels: 
qplot(GDP.per.capita.2017, data=Countries_All,
      main="GDP per Capita Distributation in 2017",
      xlab="GDP per Capita",
      ylab="Frequency")

# Save plot in global environment
p = qplot(GDP.per.capita.2017, data=Countries_All,
          main="SAVED- GDP per Capita Distributation in 2017",
          xlab="GDP per Capita",
          ylab="Frequency")

# Call object
p

# Density
qplot(GDP.per.capita.2017, data=Countries_All, geom="density",
      main="GDP per Capita Distributation in 2017",
      xlab="GDP per Capita",
      ylab="Density")
