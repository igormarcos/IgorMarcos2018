# Calculate Parameters
write.graph.parameters_DegreeDistribution <- function (graph_to_calculate)
{
  
  #Old Plot
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
  
  #New Plot
 # NameFile.Degree <- paste("Distribution of Degree (log-log)\n",graph_work.now, sep="");
#  Gra <- graph.data.frame(graph_to_calculate)
#  Gra.degrees <- degree(Gra)
#  Gra.degree.histogram <- as.data.frame(table(Gra.degrees))
#  Gra.degree.histogram[,1] <- as.numeric(Gra.degree.histogram[,1])
#  ggplot(Gra.degree.histogram, aes(x = log(Gra.degrees), y = log(Freq))) +
#    geom_point(colour = "purple", size = 2) +
#    scale_x_continuous("Degrees\n(number of Connected Vertices)",
#                       #breaks = c(1, 3, 10, 30, 100, 300, 1000),
#                       trans = "log10") +
#    scale_y_continuous("Frequency\n(Number of Vertices)",
#                       #breaks = c(1, 3, 10, 30, 100, 300, 1000, 3000, 10000),
#                       trans = "log10") +
#    ggtitle(NameFile.Degree) +
#    theme_bw()
#  
#  graph_to.work = paste(GRAFICS_PATH, graph_work.now,"-DegreeDistribution.","new.png", sep="");
#  cat("Saving: ",graph_to.work," \n");
#  ggsave(graph_to.work, device = "png")
  
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