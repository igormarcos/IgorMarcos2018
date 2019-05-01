plot.DegreeDisribution <- function ()
  {

    G <- graph.data.frame(dataSetObjFULL)

    # List of degrees
    G.degrees <- degree(G)

    # Let's count the frequencies of each degree
    G.degree.histogram <- as.data.frame(table(G.degrees))

    # Need to convert the first column to numbers, otherwise
    # the log-log thing will not work (that's fair...)
    G.degree.histogram[,1] <- as.numeric(G.degree.histogram[,1])

    # Now, plot it!
    ggplot(G.degree.histogram, aes(x = G.degrees, y = Freq)) +
      geom_point(colour = "red", size = 2) +
      scale_x_continuous("Degrees\n(Number of Connected Vertices)",
                         breaks = c(1, 3, 10, 30, 100, 300, 1000),
                         trans = "log10") +
      scale_y_continuous("Frequency\n(Number of Vertices)",
                         breaks = c(1, 3, 10, 30, 100, 300, 1000, 3000, 10000),
                         trans = "log10") +
      ggtitle("Distribution of Degree (log-log)") +
      theme_bw()
    
    graph_to.work = paste(GRAFICS_PATH, name.file,"-DegreeDistribution","-FULL.png", sep="");
    cat("Saving: ",graph_to.work," \n");
    ggsave(graph_to.work, device = "png")
}


plot.AverageMinimumPath <- function ()
{
  frame_data.Table$PositionFile <<- as.numeric(frame_data.Table$PositionFile)
  frame_data.Table$MeanDistance <<- as.numeric(frame_data.Table$MeanDistance)
  
  ggplot(data=frame_data.Table, aes(x=PositionFile, y=MeanDistance, group=1)) + geom_path(colour = "blue") + geom_point(colour = "blue", size = 2) +
  ggtitle("Average Length\n of Minimal Paths") +
  scale_x_continuous("Collect Time Instant") +
  scale_y_continuous("Average Length \n of Minimal Paths")+theme_bw()
  
  graph_to.work = paste(GRAFICS_PATH, name.file,"-AverageMinimumPath","-FULL.png", sep="");
  cat("Saving: ",graph_to.work," \n");
  ggsave(graph_to.work, device = "png")
}

plot.CoefficienteAgroupment <- function ()
{
    frame_data.Table$PositionFile <<- as.numeric(frame_data.Table$PositionFile)
    frame_data.Table$CoefficientAgroupment <<- as.numeric(frame_data.Table$CoefficientAgroupment)
  
    ggplot(data=frame_data.Table, aes(x=PositionFile, y=CoefficientAgroupment, group=1)) + geom_path(colour = "Orange") + geom_point(colour = "Orange", size = 2) +
    ggtitle("Grouping Coefficient") +
    scale_x_continuous("Collection Time Instant") +
    scale_y_continuous("Grouping Coefficient")+theme_bw()
    
    graph_to.work = paste(GRAFICS_PATH, name.file,"-CoefficientAgroupment","-FULL.png", sep="");
    cat("Saving: ",graph_to.work," \n");
    ggsave(graph_to.work, device = "png")
}

plot.Betweenness <- function ()
{
  frame_data.Table$PositionFile <<- as.numeric(frame_data.Table$PositionFile)
  frame_data.Table$BetweennessMedium <<- as.numeric(frame_data.Table$BetweennessMedium)
  
  ggplot(data=frame_data.Table, aes(x=PositionFile, y=BetweennessMedium, group=1)) + geom_path(colour = "Green") + geom_point(colour = "Green", size = 2) +
    ggtitle("Middle Betweenness") +
    scale_x_continuous("Collection Time Instant") +
    scale_y_continuous("Middle Betweenness")+theme_bw()
  
  graph_to.work = paste(GRAFICS_PATH, name.file,"-BetweennessMedium","-FULL.png", sep="");
  cat("Saving: ",graph_to.work," \n");
  ggsave(graph_to.work, device = "png")
}

plot.Diameter <- function ()
{
  frame_data.Table$PositionFile <<- as.numeric(frame_data.Table$PositionFile)
  frame_data.Table$DiameterNetwork <<- as.numeric(frame_data.Table$DiameterNetwork)
  
  ggplot(data=frame_data.Table, aes(x=PositionFile, y=DiameterNetwork, group=1)) + geom_path(colour = "Gray") + geom_point(colour = "Gray", size = 2) +
    ggtitle("Diameter (L Distance)") +
    scale_x_continuous("Collection Time Instant") +
    scale_y_continuous("Diameter (L Distance)")+theme_bw()
  
  graph_to.work = paste(GRAFICS_PATH, name.file,"-DiameterNetwork","-FULL.png", sep="");
  cat("Saving: ",graph_to.work," \n");
  ggsave(graph_to.work, device = "png")
}

#Not Function
plot.TransitivityVsDistance <- function ()
{
  frame_data.Table$CoefficientAgroupment <<- as.numeric(frame_data.Table$CoefficientAgroupment)
  frame_data.Table$MeanDistance <<- as.numeric(frame_data.Table$MeanDistance)
  
  ggplot(data=frame_data.Table, aes(x=MeanDistance, y=CoefficientAgroupment, group=1)) + geom_path(colour = "Gray") + geom_point(colour = "Gray", size = 2) +
    ggtitle("Diametro (Distancia L)") +
    scale_x_continuous("Instante de Tempo\n de Coleta") +
    scale_y_continuous("Diametro (Distancia L)")+theme_bw()
  
  graph_to.work = paste(GRAFICS_PATH, name.file,"-TransitivityVsDistance","-FULL.png", sep="");
  cat("Saving: ",graph_to.work," \n");
  ggsave(graph_to.work, device = "png")
}