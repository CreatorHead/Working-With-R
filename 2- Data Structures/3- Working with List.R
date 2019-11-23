# Note on List

my_vector = c(3,7,11,13) # Creating Vector 
my_str_vector = c("Hello", "World", "From", "R") # Creating Vector
my_data_frame = data.frame(my_vector, my_str_vector) # Creating a Data Frame

my_list = list(my_vector,my_str_vector,my_data_frame) # Creating a List by using list() function

my_list

my_list[[3]] # To get the Data Frame
my_list[[3]][1,] # TO access the first row from the Data Frame
