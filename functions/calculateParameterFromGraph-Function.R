# Calculate Parameters
write.graph.parameters_DegreeDistribution <- function (graph_to_calculate)
{
  graph_to.work_D = paste(GRAFICS_PATH, graph_work.now,"DegreeDistribution",".png", sep="");
  #Degree Distribution
  d1 = degree.distribution(graph_to_calculate, cumulative=FALSE)
  #Gen PNG Grafic
  len = length(d1)
  png(filename= graph_to.work_D, height=500, width=500, bg="white")
  barplot(d1, main="Degree Distribution",xlab="Graus", ylab="PDF", names.arg=c(0:(len-1)))
  dev.off()
  #Average Degree
  meanD <<- mean(degree(graph_to_calculate))
  #Max Degree
  MaxD <<- max(degree(graph_to_calculate))
}

write.graph.parameters_VE <- function (graph_to_calculate)
{
  #Vertices
  verticesGraf <<- vcount(graph_to_calculate)
  #Edges
  edgesGraf <<- ecount(graph_to_calculate)
}

write.graph.parameters_Diameter <- function (graph_to_calculate)
{
  #Diameter L
  LDiameter <<- diameter(graph_to_calculate)
}

write.graph.parameters_CA <- function (graph_to_calculate)
{
  #Diameter Coefficient Agroupment CA
  #CAgroup <<- transitivity(graph_to_calculate)
  CAgroup <<- transitivity(graph_to_calculate, type="average")
}

write.graph.parameters_Betweenness <- function (graph_to_calculate)
{
  #Diameter betweenness B
  #Betw <<- betweenness(graph_to_calculate)
  #Betw <<- 2
  Betw <<- median(betweenness(graph_to_calculate))
}

write.graph.parameters_Closeness <- function (graph_to_calculate)
{
  #Diameter Closeness
  #CLosen <<- closeness(graph_to_calculate)
  CLosen <<- median(closeness(graph_to_calculate))
}

write.graph.parameters_meanDistante <- function (graph_to_calculate)
{
  #Diameter Closeness
  #CLosen <<- closeness(graph_to_calculate)
  MDistance <<- mean_distance(graph_to_calculate)
}