#Summary Graph
writeDataFromGraph <- function (NetworkFile, position, Ed, Ve, d, D, L, CA, B, CLos, MDist)
  {
    cat("\n");
    cat("=========Parameters======== \n");
    cat("Network: ", NetworkFile, "\n");
    Network <- NetworkFile
    #Network = as.character(levels(Network))[Network]
    cat("Edges: ", Ed, "\n");
    Edges <- Ed
    #Edges = as.numeric(levels(Edges))[Edges]
    cat("Vertices: ", Ve, "\n");
    Vertices <- Ve
    #Vertices = as.numeric(levels(Vertices))[Vertices]
    cat("Average Degree: ", d, "\n");
    AverageDegree <-d
    #AverageDegree = as.numeric(levels(AverageDegree))[AverageDegree]
    cat("Max Degree: ", D, "\n");
    MaxDegree <- D
    #MaxDegree = as.numeric(levels(MaxDegree))[MaxDegree]
    cat("Diameter: ", L, "\n");
    DiameterNetwork <- L
    #DiameterNetwork = as.numeric(levels(DiameterNetwork))[DiameterNetwork]
    cat("Transitivity: ", CA, "\n");
    CoefficientAgroupment <- CA
    #CoefficientAgroupment = as.numeric(levels(CoefficientAgroupment))[CoefficientAgroupment]
    cat("Betweenness: ", B, "\n");
    BetweennessMedium <- B
    #BetweennessMedium = as.numeric(levels(BetweennessMedium))[BetweennessMedium]
    cat("Closeness: ", CLos, "\n");
    ClosenessNetwork <- CLos
    #ClosenessNetwork = as.numeric(levels(ClosenessNetwork))[ClosenessNetwork]
    #cat("=========================== \n");
    cat("Mean Distance: ", MDist, "\n");
    MeanDistance <- MDist
    cat("Position: ", position, "\n");
    PositionFile <- position
    cat("Write on dataframe \n");
    frame_data.Table<<-rbind(frame_data.Table,data.frame(setNames(as.list(c(Network,PositionFile,Edges,Vertices,AverageDegree,MaxDegree,DiameterNetwork,CoefficientAgroupment,BetweennessMedium,ClosenessNetwork,MeanDistance)),names(frame_data.Table)),stringsAsFactors = FALSE))
}