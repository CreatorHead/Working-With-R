
## Setting up the Working directory
setwd("F:/Workspace/Working With R/DataSets") # TO set a Working Dir


## Importing the dataset
library('readr')
Countires = read_csv("Countries+Population.csv")
summary(Countires)

## Get info about functions
?colnames
?make.names()


colnames(Countires) ## Retrieve or set the row or column names of a matrix-like object.
colnames(Countires) = make.names(colnames(Countires))


Countires$Country.Name = as.factor(Countires$Country.Name)
Countires$Country.Code = as.factor(Countires$Country.Code)
