# Importing Data in R

library("readr")

setwd("F:/Workspace/Working With R/DataSets") # TO set a Working Dir

getwd() # To get the working directory


# Imporing text docs with space separated values

Titanic = read.table("Titanic_space_separated-1.txt",header = TRUE)
class(Titanic)

# To view the Dataset
View(Titanic)


# To view data of the first 10 rows (Head means from begining)
head(Titanic,10)


# To view the last 5 rows
tail(Titanic, 5)


# To see the Overview
str(Titanic)


Titanic$Sex # To access the Sex column as factor (factor means any type of character variable)

Titanic$Sex = as.character(Titanic$Sex) # To treat it like chars in R
Titanic$Sex


# To get the summary of the dataset
summary(Titanic)

# Lets convert the Sex from character variable to factor
Titanic$Sex = as.factor(Titanic$Sex)

summary(Titanic)


# Imporing .txt with comma separated value
Orange = read.table("Orange_comma_separated.txt",header = TRUE, sep = ",") # sep to declare the comma seperated value
View(Orange)
class(Orange)
summary(Orange)

Orange$Tree = as.factor(Orange$Tree)
summary(Orange)


# Importing .csv file
library('readr')
Countires = read_csv("Countries+Population.csv")
summary(Countires)
Countires$`Country Name` = as.factor(Countires$`Country Name`)
Countires$`Country Code` = as.factor(Countires$`Country Code`)
summary(Countires)


# Import excel documents
install.packages('readxl')
library('readxl')
Countires_region = read_excel("Countries Region Mapping.xlsx")
class(Countires_region)
Countires_region = as.data.frame(Countires_region) #To Convert into a dataframe
