### Plot Combination

setwd("/media/user/Alpha/Workspace/Working With R/DataSets") # TO set a Working Dir

# Import RDS file
Countries_All = readRDS("As_RDS_Countries_All_Data_2017.RDS")
summary(Countries_All)
View(Countries_All)

# Import ggplot2 package for graph
library(ggplot2)

## Categorical against categorical

# Colored bar plot
qplot(Region,fill=IncomeGroup,data=Countries_All, geom= "bar",
      main = "Income Group Distribution per Region",
      xlab = "Region",
      ylab = "Frequency")

## Numerical against numerical

# Default: Dot plot
qplot(GDP.per.capita.2017, Under.5.Mortality.Rate.2017,data=Countries_All,
      main = "Mortality Rate Distribution against Countries' GDP per Capita in 2017",
      xlab = "GDP per Capita",
      ylab = "Under 5 Mortality Rate")


## Three variables

#Colored Dot plot
qplot(GDP.per.capita.2017, Under.5.Mortality.Rate.2017, color = Region, data=Countries_All,
      main = "Mortality Rate Distribution against Countries' GDP per Capita in 2017",
      xlab = "GDP per Capita",
      ylab = "Under 5 Mortality Rate")

## Save last plot as an image
ggsave('Mortality_Rate_GDP_Region.jpeg', width = 9, height = 6)

## Save any plot from global environment as an image
ggsave('GDP_per_Capita_Distrib.jpeg',p, width = 9, height = 6)
