write.graph.parameters <- function (graph_to_calculate)
  {
  #Define Name of Graph
  graph_to.work = paste(GRAFICS_PATH, graph_work.now,".png", sep="");
  #Set Path
  setwd(GRAFICS_PATH)
  #Plot Graph
  layout <- layout.fruchterman.reingold(graph_to_calculate)
  plot.igraph(graph_to_calculate, layout=layout, vertex.size=2, vertex.label=NA, edge.arrow.size=0.2)
  #Save IMG Plot Graph
  cat("\n");
  cat("Graph:", positionStartRead,"about", positionEndRead,"\n");
  cat("=========================== \n");
  cat("\n");
  cat("Saving: ",graph_to.work," \n");
  dev.copy(png, graph_to.work)
  dev.off()
  #Degree distribution
  cat("Calculate Degree distribution \n");
  write.graph.parameters_DegreeDistribution(graph_to_calculate)
  #Vertices & Edges
  cat("Calculate Vertices & Edges \n");
  write.graph.parameters_VE(graph_to_calculate)
  #Diameter L
  cat("Calculate Diameter L \n");
  write.graph.parameters_Diameter(graph_to_calculate)
  #Transitivity CA
  cat("Calculate Transitivity CA \n");
  write.graph.parameters_CA(graph_to_calculate)
  #Betweenness
  cat("Calculate Betweenness \n");
  write.graph.parameters_Betweenness(graph_to_calculate)
  #Closeness
  cat("Calculate Closeness \n");
  write.graph.parameters_Closeness(graph_to_calculate)
  #Mean Distance
  cat("Calculate Mean Distance \n");
  write.graph.parameters_meanDistante(graph_to_calculate)
  #Write on dataframe
  writeDataFromGraph (graph_work.now, positionStartRead, edgesGraf, verticesGraf, meanD, MaxD, LDiameter, CAgroup, Betw, CLosen, MDistance)
  }