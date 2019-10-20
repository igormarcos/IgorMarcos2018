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
    NameFile.Degree <- paste("Distribution of Degree (log-log)\n",name.file, sep="");
    # Now, plot it!
    ggplot(G.degree.histogram, aes(x = log(G.degrees), y = log(Freq))) +
      geom_point(colour = "red", size = 2) +
      scale_x_continuous("Degrees\n(number of Connected Vertices)",
                         #breaks = c(1, 3, 10, 30, 100, 300, 1000),
                         trans = "log10") +
      scale_y_continuous("Frequency\n(Number of Vertices)",
                         #breaks = c(1, 3, 10, 30, 100, 300, 1000, 3000, 10000),
                         trans = "log10") +
      ggtitle(NameFile.Degree) +
      theme_bw()
  
    graph_to.work = paste(GRAFICS_PATH, name.file,"-DegreeDistribution","-FULL.png", sep="");
    cat("Saving: ",graph_to.work," \n");
    ggsave(graph_to.work, device = "png")
}


plot.AverageMinimumPath <- function ()
{
  
  NameFile.AverageMinimumPath <- paste("Average Length\n of Minimal Paths\n",name.file, sep="");
  
  frame_data.Table$PositionFile <<- as.numeric(frame_data.Table$PositionFile)
  frame_data.Table$MeanDistance <<- as.numeric(frame_data.Table$MeanDistance)
  
  ggplot(data=frame_data.Table, aes(x=PositionFile, y=MeanDistance, group=1)) + geom_path(colour = "blue") + geom_point(colour = "blue", size = 2) +
  ggtitle(NameFile.AverageMinimumPath) +
  scale_x_continuous("Collect Time Instant") +
  scale_y_continuous("Average Length \n of Minimal Paths")+theme_bw()
  
  graph_to.work = paste(GRAFICS_PATH, name.file,"-AverageMinimumPath","-FULL.png", sep="");
  cat("Saving: ",graph_to.work," \n");
  ggsave(graph_to.work, device = "png")
}

plot.AverageMinimumPathAndCAgroupment <- function ()
{
  
#  NameFile.AverageMinimumPathandAgroupment <- paste("Average Length\n of Minimal Paths\n",name.file, sep="");
  
  frame_data.Table$PositionFile <<- as.numeric(frame_data.Table$PositionFile)
  frame_data.Table$MeanDistance <<- as.numeric(frame_data.Table$MeanDistance)
  frame_data.Table$CoefficientAgroupment <<- as.numeric(frame_data.Table$CoefficientAgroupment)
  
  ggplot(data=frame_data.Table, aes(x=PositionFile, y=MeanDistance, group=1)) + 
    geom_point(aes(colour="MeanDistance"), shape=1) +
    stat_function(fun = MeanDistance, geom = "line", aes(colour="MeanDistance")) +
    geom_point(aes(colour="CoefficientAgroupment"), shape=2) +
    stat_function(fun = CoefficientAgroupment, geom = "line", aes(colour="CoefficientAgroupment")) +
    labs(x="Eixo X", y="f(x)", colour="Legenda")
    
    
#    ggtitle(NameFile.AverageMinimumPath) +
#    scale_x_continuous("Collect Time Instant") +
#    scale_y_continuous("Average Length \n of Minimal Paths")+theme_bw()
  
  graph_to.work = paste(GRAFICS_PATH, name.file,"-Teste","-FULL.png", sep="");
  cat("Saving: ",graph_to.work," \n");
  ggsave(graph_to.work, device = "png")
}

plot.CoefficienteAgroupment <- function ()
{
    NameFile.CoefficienteAgroupment <- paste("Grouping Coefficient\n",name.file, sep="");
  
    frame_data.Table$PositionFile <<- as.numeric(frame_data.Table$PositionFile)
    frame_data.Table$CoefficientAgroupment <<- as.numeric(frame_data.Table$CoefficientAgroupment)
  
    ggplot(data=frame_data.Table, aes(x=PositionFile, y=CoefficientAgroupment, group=1)) + geom_path(colour = "Orange") + geom_point(colour = "Orange", size = 2) +
    ggtitle(NameFile.CoefficienteAgroupment) +
    scale_x_continuous("Collection Time Instant") +
    scale_y_continuous("Grouping Coefficient")+theme_bw()
    
    graph_to.work = paste(GRAFICS_PATH, name.file,"-CoefficientAgroupment","-FULL.png", sep="");
    cat("Saving: ",graph_to.work," \n");
    ggsave(graph_to.work, device = "png")
}

plot.Betweenness <- function ()
{
  NameFile.Betweenness <- paste("Middle Betweenness\n",name.file, sep="");
  
  frame_data.Table$PositionFile <<- as.numeric(frame_data.Table$PositionFile)
  frame_data.Table$BetweennessMedium <<- as.numeric(frame_data.Table$BetweennessMedium)
  
  ggplot(data=frame_data.Table, aes(x=PositionFile, y=BetweennessMedium, group=1)) + geom_path(colour = "Green") + geom_point(colour = "Green", size = 2) +
    ggtitle(NameFile.Betweenness) +
    scale_x_continuous("Collection Time Instant") +
    scale_y_continuous("Middle Betweenness")+theme_bw()
  
  graph_to.work = paste(GRAFICS_PATH, name.file,"-BetweennessMedium","-FULL.png", sep="");
  cat("Saving: ",graph_to.work," \n");
  ggsave(graph_to.work, device = "png")
}

plot.Diameter <- function ()
{
  NameFile.Diameter <- paste("Diameter (L Distance)\n",name.file, sep="");
  
  frame_data.Table$PositionFile <<- as.numeric(frame_data.Table$PositionFile)
  frame_data.Table$DiameterNetwork <<- as.numeric(frame_data.Table$DiameterNetwork)
  
  ggplot(data=frame_data.Table, aes(x=PositionFile, y=DiameterNetwork, group=1)) + geom_path(colour = "Gray") + geom_point(colour = "Gray", size = 2) +
    ggtitle(NameFile.Diameter) +
    scale_x_continuous("Collection Time Instant") +
    scale_y_continuous("Diameter (L Distance)")+theme_bw()
  
  graph_to.work = paste(GRAFICS_PATH, name.file,"-DiameterNetwork","-FULL.png", sep="");
  cat("Saving: ",graph_to.work," \n");
  ggsave(graph_to.work, device = "png")
}

plot.CoefficienteAgroupmentVsAverageMinimumPath <- function ()
{
  NameFile.CoefficienteAgroupmentVsAverageMinimumPath <- paste("Coefficient Agroupmet VS AverageMinimumPath\n",name.file, sep="");
  
  frame_data.Table$PositionFile <<- as.numeric(frame_data.Table$PositionFile)
  frame_data.Table$MeanDistance <<- as.numeric(frame_data.Table$MeanDistance)
  frame_data.Table$CoefficientAgroupment <<- as.numeric(frame_data.Table$CoefficientAgroupment)
  
  ggplot(data=frame_data.Table) + 
    geom_point(colour="red", aes(x=PositionFile, y=log(MeanDistance))) +
    geom_point(colour="orange", aes(x=PositionFile, y=log(CoefficientAgroupment))) +
    ggtitle(NameFile.CoefficienteAgroupmentVsAverageMinimumPath) +
    scale_x_continuous("Collection Time Instant") +
    scale_y_continuous("Log by Metric2")+theme_bw()
  
  graph_to.work = paste(GRAFICS_PATH, name.file,"-CoefficienteAgroupmentVsAverageMinimumPath","-FULL.png", sep="");
  cat("Saving: ",graph_to.work," \n");
  ggsave(graph_to.work, device = "png")
}

#Not Function -> Review
plot.TransitivityVsDistance <- function ()
{
  NameFile.TransitivityVsDistance <- paste("Transitivity vs Diatance\n",name.file, sep="");
  
  frame_data.Table$CoefficientAgroupment <<- as.numeric(frame_data.Table$CoefficientAgroupment)
  frame_data.Table$MeanDistance <<- as.numeric(frame_data.Table$MeanDistance)
  
  ggplot(data=frame_data.Table, aes(x=MeanDistance, y=CoefficientAgroupment, group=1)) + geom_path(colour = "Gray") + geom_point(colour = "Gray", size = 2) +
    ggtitle(NameFile.TransitivityVsDistance) +
    scale_x_continuous("Instante de Tempo\n de Coleta") +
    scale_y_continuous("Diametro (Distancia L)")+theme_bw()
  
  graph_to.work = paste(GRAFICS_PATH, name.file,"-TransitivityVsDistance","-FULL.png", sep="");
  cat("Saving: ",graph_to.work," \n");
  ggsave(graph_to.work, device = "png")
}

plot.AverageMinimumPathVSBetweennessMedium <- function ()
{
  NameFile.AverageMinimumPathVSBetweennessMedium <- paste("Average Minimum Path VS Betweenness Medium\n",name.file, sep="");
  
  ggplot(frame_data.Table, aes(x = PositionFile, y = MeanDistance)) + 
    ggtitle(NameFile.AverageMinimumPathVSBetweennessMedium) +
    geom_line(aes(y=MeanDistance), col="#00AFBB", size = 1) +
    geom_line(aes(y=BetweennessMedium), col="#E7B800", size = 1) +
    scale_x_continuous(name="Time Stemps", limits=c(1, 25), expand = c(0, 0), breaks = seq(1, 25, by = 1)) +
    scale_y_continuous(name="Value Metric", limits=c(0, 100), expand = c(0, 0), breaks = seq(0, 100, by = 10)) +
    theme_minimal()
  
  graph_to.work = paste(GRAFICS_PATH, name.file,"-AverageMinimumPathVSBetweennessMedium","-FULL.png", sep="");
  cat("Saving: ",graph_to.work," \n");
  ggsave(graph_to.work, device = "png")
}
