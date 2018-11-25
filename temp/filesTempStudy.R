#temp Study


#Save a data frame to .csv file using the write.csv command

data(mtcars) 

# use the write.csv command followed by the file path (i.e. where you would like to save the file)
write.csv(mtcars, '/Users/majerus/Desktop/R/intro/data/cars.csv', row.names=T)

# remove the cars data from the workspace
rm(mtcars) 


#Load data from a .csv file using the read.csv command

# use the read.csv command followed by the file path
# row.names=1 tells R that the data in the first column are the names of the rows
cars <- read.csv('/Users/majerus/Desktop/R/intro/data/cars.csv', row.names=1)


#Loading multiple .csv files as separate data frames

folder <- "/Users/majerus/Desktop/R/intro/data/"      # path to folder that holds multiple .csv files
file_list <- list.files(path=folder, pattern="*.csv") # create list of all .csv files in folder

# read in each .csv file in file_list and create a data frame with the same name as the .csv file
for (i in 1:length(file_list)){
  assign(file_list[i], 
         read.csv(paste(folder, file_list[i], sep=''))
  )}


#Loading multiple .csv files into the same data frame

folder <- "/Users/majerus/Desktop/R/intro/data/"      # path to folder that holds multiple .csv files
file_list <- list.files(path=folder, pattern="*.csv") # create list of all .csv files in folder

# read in each .csv file in file_list and rbind them into a data frame called data 
data <- 
  do.call("rbind", 
          lapply(file_list, 
                 function(x) 
                   read.csv(paste(folder, x, sep=''), 
                            stringsAsFactors = FALSE)))



# To study


degg2 <- barabasi.game(node)
deg <- degree(graph_work.now, mode="all")

plot(graph_work.now, vertex.size=deg*3)

graph_work.now

