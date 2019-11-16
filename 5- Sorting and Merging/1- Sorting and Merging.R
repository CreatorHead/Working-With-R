## Sorting and Merging

# Import Libraries
library(readr)
library((readxl))

## Setting up the Working directory
setwd("F:/Workspace/Working With R/DataSets") # TO set a Working Dir

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



### Merging
# Joining or Merging consists in combining 2 or more datasets' rows based on a 
# a common column/field between them 

# For a join to happen, 2 datasets need at least one same column. It matches rows that have
# that have identical values in this column.

# There are 4 types of Joins: Left Join, Full Outer Join, Inner Join, Right Join


# Left Join
temp = merge(Countries, Countries_Map, by = "Country.Code", all.x = TRUE)

# Correct Inner Join
Countries_All = merge(Countries, Countries_Map, by = "Country.Code")

# Full Outer Join
temp2 = merge(Countries_All, Countries_Info, by = "Country.Code", all = TRUE)

# Correct Left Join 
Countries_All = merge(Countries_All, Countries_Info, by = "Country.Code", all.x = TRUE)

## Remove unwanted object from global environment 
rm(temp,temp2)
