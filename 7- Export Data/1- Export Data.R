### Export Data
# Export data to use outside of R: You can export your datasets as .csv file
# using the write.csv() function

# Export data for later use in R: You can export your datasets as R objects called .RDS file
# using saveRDS(). You can import them into R using readRDS(). These execute a lot faster.

# Note: See the botton of the file for Exporting Data
# Import Libraries
library(readr)
library(readxl)

## Setting up the Working directory
# setwd("F:/Workspace/Working With R/DataSets") # TO set a Working Dir
setwd("/media/user/Alpha/Workspace/Working With R/DataSets") # TO set a Working Dir
# Import first dataset
Countries = read_csv("Countries+Population.csv")
summary(Countries)

# Clean column names and set right data types
colnames(Countries) = make.names(colnames(Countries))
Countries$Country.Name = as.factor(Countries$Country.Name)
Countries$Country.Code = as.factor(Countries$Country.Code)
summary(Countries)


# Import second dataset
Countries_Map = readxl::read_excel("Countries Region Mapping.xlsx")
View(Countries_Map)

# Set right data types
Countries_Map$Country.Code = as.factor(Countries_Map$Country.Code)
Countries_Map$Region = as.factor(Countries_Map$Region)
Countries_Map$IncomeGroup = as.factor(Countries_Map$IncomeGroup)
summary(Countries_Map$IncomeGroup)

# Set to ordered factor, and give order
Countries_Map$IncomeGroup = ordered(Countries_Map$IncomeGroup, levels = c("Low income",
                                                                          "Lower middle income",
                                                                          "Upper middle income",
                                                                          "High income"))

class(Countries_Map$IncomeGroup)
summary(Countries_Map$IncomeGroup)

# Import Third Dataset
Countries_Info = read_csv("Countries+Indicators.csv")
colnames(Countries_Info) = make.names(colnames(Countries_Info))
Countries_Info$Country.Code = as.factor(Countri)
summary(Countries_Info)


# Correct Inner Join
Countries_All = merge(Countries, Countries_Map, by = "Country.Code")

# Correct Left Join 
Countries_All = merge(Countries_All, Countries_Info, by = "Country.Code", all.x = TRUE)

## table()
Region_vs_Income_Cat = table(Countries_All$Region, Countries_All$IncomeGroup)
Region_vs_Income_Cat

prop.table(Region_vs_Income_Cat, 1) # Row Total is equal to 1
prop.table(Region_vs_Income_Cat, 2) # Column Total is equal to 1


## %>% group_by()
install.packages("dplyr")
library(dplyr)

# Extract the different Regions
Region_sum = Countries_All %>% group_by(Region) %>% summarise()
View(Region_sum)

# Extract different combination of Regions and Income Groups
Region_Income_Sum = Countries_All %>% group_by(Region, IncomeGroup) %>% summarise()
View(Region_Income_Sum)

# Same with amount of countries in each categories
# Region_Income_Sum = Countries_All %>% group_by(Region, IncomeGroup) %>% summarise(Count = n())
Region_Income_Sum = Countries_All %>% group_by(Region, IncomeGroup) %>% summarise(Number.Of.Countries = n())
View(Region_Income_Sum)

# Amount of different income groups per region
Region_sum = Countries_All %>% group_by(Region) %>% summarise(Different.Income.Groups = n_distinct(IncomeGroup))
View(Region_sum)


## Big Summary about each region
Region_sum= Countries_All %>% group_by(Region) %>% summarise(Number.of.Countries = n(),
                                                             Total.Population.In.Million = sum (Total.Population.2017)/1000000,
                                                             Countries.With.Low.Income = sum(IncomeGroup == "Low income"),
                                                             Average.GDP.per.Capita= mean(GDP.per.capita.2017, na.rm= TRUE),
                                                             Median.GDP.per.Capita= median(GDP.per.capita.2017, na.rm= TRUE),
                                                             Std.Deviation.GDP.per.Capita = sd(GDP.per.capita.2017, na.rm= TRUE),
                                                             Min.Under.5.Mortality.Rate = min(Under.5.Mortality.Rate.2017,na.rm=TRUE),
                                                             Max.Under.5.Mortality.Rate = max(Under.5.Mortality.Rate.2017,na.rm=TRUE))

# As csv file
write.csv(Region_sum,"/home/user/Desktop/RegionSum.csv", row.names = FALSE )

# As RDS object
saveRDS(Countries_All, "As_RDS_Countries_All_Data_2017.RDS")

# Re-import RDS
View(readRDS("As_RDS_Countries_All_Data_2017.RDS"))
