# setwd("F:/Workspace/Working With R/DataSets") # TO set a Working Dir
setwd("/media/user/Alpha/Workspace/Working With R/DataSets") # TO set a Working Dir

# Import RDS file
Countries_All = readRDS("As_RDS_Countries_All_Data_2017.RDS")
summary(Countries_All)
View(Countries_All)

# Import ggplot2 package for graph
library(ggplot2)

### Categorial Distribution 
qplot(Region, data=Countries_All,
      main="Region Distribution",
      xlab="Region",
      ylab="Frequency")

## Numerical against Categorical

# Default: Dot plot
qplot(Region,Under.5.Mortality.Rate.2017,data=Countries_All,
      main = "Mortality Rate Distribution per Region",
      xlab = "Region",
      ylab = "Under 5 Mortality Rate")

# Box plot
qplot(Region, Under.5.Mortality.Rate.2017,data=Countries_All, geom= "boxplot",
      main = "Mortality Rate Distribution per Region",
      xlab = "Region",
      ylab = "Under 5 Mortality Rate")

# Colored Density plot
qplot( Under.5.Mortality.Rate.2017,fill = Region, data=Countries_All, geom= "density", alpha=I(.8),
       main = "Mortality Rate Distribution per Region",
       xlab = "Under 5 Mortality Rate",
       ylab = "Density")

