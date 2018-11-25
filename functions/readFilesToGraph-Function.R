#Load File GML
load.data.work <- function ()
 {
    # Load files
    file_list <- list.files(path=RESULTS_PATH, pattern="*.gml") # create list of all .gml files in folder
    file_list <- mixedsort(sort(file_list))
    #Data Frame - Network,Edges,Vertices,AverageDegree,MaxDegree,DiameterNetwork,CoefficientAgroupment,BetweennessMedium,ClosenessNetwork
    frame_data.Table <<-data.frame(NetworkFile=character(0), Edges=numeric(0), Vertices=numeric(0), AverageDegree=numeric(0), MaxDegree=numeric(0), DiameterNetwork=numeric(0), CoefficientAgroupment=numeric(0), BetweennessMedium=numeric(0), ClosenessNetwork=numeric(0),stringsAsFactors=FALSE)
    # read in each .gml file in file_list and create a data frame with the same name as the .R file
    for (i in 1:length(file_list)){
        cat("=========================== \n");
        cat("\n");
        ReadFileOrder= paste(RESULTS_PATH,file_list[i], sep="");
        cat("Read file: ", ReadFileOrder, "\n");
        setwd(RESULTS_PATH) #Set PATH to read file
        graph.read <- read.graph(file_list[i], format = c("gml"))
        
        #Calculate Parameter
        graph_work.now <<- file_list[i]
        positionStartRead <<- i
        positionEndRead <<- length(file_list)
        write.graph.parameters (graph.read)
        #Write Parameter
      }
}