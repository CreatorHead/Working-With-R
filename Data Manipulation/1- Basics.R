
## Setting up the Working directory
setwd("F:/Workspace/Working With R/DataSets") # TO set a Working Dir


## Importing the dataset
library('readr')
Countries = read_csv("Countries+Population.csv")
summary(Countries)

## Get info about functions
?colnames
?make.names()


colnames(Countries) ## Retrieve or set the row or column names of a matrix-like object.
colnames(Countries) = make.names(colnames(Countries))


## Set columns in the proper format
Countries$Country.Name = as.factor(Countries$Country.Name)
Countries$Country.Code = as.factor(Countries$Country.Code)


## Summary of the data set
summary(Countries)


## Filtering/Subsetting   
# Focusing on the first 10 rows
First.Countries.Pop = head(Countires$Total.Population.2017, 10)
First.Countries.Pop


# Create a logical vector
Big.First.Countires.Flag = First.Countries.Pop > 10000000 ## Condition: More than 10 Million
Big.First.Countires.Flag


# Use logical statement to filter data
Big.Countries = Countires[Countries$Total.Population.2017 > 10000000,] # Condition: More than 10 Milliion
Big.Countries

Small.Countires = Countires[Countires$Total.Population.2017 <= 2000000,] # Condition: Less or Equal to 2 Million
Small.Countires

# 2 logical Conditions
# Using AND Operator
Between.6.And.10.Million.Countries = Countires[Countires$Total.Population.2017 > 6000000 &
                                                 Countires$Total.Population.2017 < 10000000,]
Between.6.And.10.Million.Countries

# Using OR Operator
Population.Equals.Divisble.By.2.Or.5 = Countires[(Countires$Total.Population.2017 %% 2) == 0 | 
                                                   (Countires$Total.Population.2017 %% 5) == 0,]
Population.Equals.Divisble.By.2.Or.5
