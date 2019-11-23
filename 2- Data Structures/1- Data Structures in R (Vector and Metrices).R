### Data Structures in R

  # Vector: It's like list, sequence of the same data types. Elements in vector are called as Components
my_vector = c(3,7,11,13)
my_str_vector = c("Hello", "World", "From", "R")

  # If you mix string and numberics, the whole vector becomes string vector
mix_vector = c(3,7,11,"hello")
class(mix_vector)


  # Accessing components in a vector
mix_vector[3] # Indexing in R starts with 1


# R matrix (It's line n dimensional array)
my_matrix = matrix(my_vector, nrow = 2, ncol = 2) # It creates a vector of 2x2 and inserts the values from the given vector (my_vector)

1:9 # Creates a vector with 9 Values

my_matrix2 = matrix(1:9,nrow = 3,ncol = 3) # Creates a matrix of 3x3 and inserts values from 1 to 9
my_matrix2

# To Access two dimensional vectors
my_matrix2[2,2]

  # If you provide only the row, it gives the entire row values   
my_matrix2[3,]

  # If you provide only the column, it gives the entire column values
my_matrix2[,3]


# Sub-Set of a matrix
my_matrix2[1:2,1:2]
  # Or we can substract the rows and columns to get the same output
my_matrix2[-3,-3]

# Note: Matices can only work with on same basic type

# How ever data frame is a good alternative