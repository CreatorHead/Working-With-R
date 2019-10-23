### Data Frame
# It has the ability to store different basic types of data
# The only thing that will be common is there length

my_vector = c(3,7,11,13) # Creating Vector 
my_str_vector = c("Hello", "World", "From", "R") # Creating Vector


my_data_frame = data.frame(my_vector, my_str_vector) 
# Variables are the two vector and the components in each vector is called as observation


my_data_frame   # in the result the vector name becomes the column name


class(my_data_frame)  # The class of a data frame is "data.frame"

my_data_frame$my_vector # To access a column in a data frame

class(my_data_frame$my_vector)  # Prints the column type of the data frame, in this case its 'numeric'

class(my_data_frame$my_str_vector)  # It returns factor, is like character variable, it can contain any text


# Note: A Data Frame can have different data type of column 

# Accessing Data Frame by using index position
my_data_frame[,1]
my_data_frame[,2]
my_data_frame[1,2] # Returns 'Hello'
my_data_frame[1:2,2] # Returns 'Hello World'
