
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
First.Countries.Pop = head(Countries$Total.Population.2017, 10)
First.Countries.Pop


# Create a logical vector
Big.First.Countries.Flag = First.Countries.Pop > 10000000 ## Condition: More than 10 Million
Big.First.Countries.Flag


# Use logical statement to filter data
Big.Countries = Countries[Countries$Total.Population.2017 > 10000000,] # Condition: More than 10 Milliion
Big.Countries

Small.Countries = Countries[Countries$Total.Population.2017 <= 2000000,] # Condition: Less or Equal to 2 Million
Small.Countries

# 2 logical Conditions
# Using AND Operator
Between.6.And.10.Million.Countries = Countries[Countries$Total.Population.2017 > 6000000 &
                                                 Countries$Total.Population.2017 < 10000000,]
Between.6.And.10.Million.Countries

# Using OR Operator
Population.Equals.Divisble.By.2.Or.5 = Countries[(Countries$Total.Population.2017 %% 2) == 0 | 
                                                   (Countries$Total.Population.2017 %% 5) == 0,]
Population.Equals.Divisble.By.2.Or.5



# Binding Columns: 
# If 2 datasets, a dataset and a vector, or 2 vectors have the same number of 
# values (rows in the case of datasets), they can be placed together into one 
# same dataset using cbind()
# This is different from << merging >>, hence there is no row matching system: 
# rows need to be in the exact same order for the data to make sense.


# Binging Rows
# If 2 datasets have the same columns (order, data types, names), one can be 
# appended under the other using bind() 

## rbind()
Big.And.Small.Countries = rbind(Big.Countries,Small.Countries)
Big.And.Small.Countries



Big.Countries.Flag = Big.And.Small.Countries$Total.Population.2017 > 10000000
Big.Countries.Flag


## cbind()
Big.And.Small.Countries = cbind(Big.And.Small.Countries,Big.Countries.Flag)
Big.And.Small.Countries

View(Big.And.Small.Countries)

summary(Big.And.Small.Countries)
