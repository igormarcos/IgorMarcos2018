convert.data.frame <- function()
{
  frame_data.Table$NetworkFile <<- factor(frame_data.Table$NetworkFile, levels=mixedsort(as.character(frame_data.Table$NetworkFile)))
}

generate.histogramsEdges <- function (frameTable)
{
  frame_data.Table$Edges <<- as.numeric(frame_data.Table$Edges)
  ggplot(data=frameTable, aes(x=NetworkFile, y=Edges)) +geom_bar(stat = "identity") + theme(axis.text.x = element_text(angle = 90, hjust = 1))
    
  histogramsEdges = paste(GRAFICS_PATH, name.file,"Edges",".png", sep="");
  ggsave(histogramsEdges, device = "png")
}

generate.histogramsVertices <- function (frameTable)
{
  frame_data.Table$Vertices <<- as.numeric(frame_data.Table$Vertices)
  ggplot(frameTable, aes(x = NetworkFile, y = Vertices)) + geom_bar(stat = "identity") + theme(axis.text.x = element_text(angle = 90, hjust = 1)) 
  
  histogramsVertices = paste(GRAFICS_PATH, name.file,"Vertices",".png", sep="");
  ggsave(histogramsVertices, device = "png")
}

generate.histogramsAverageDegree <- function (frameTable)
{
  frame_data.Table$AverageDegree <<- as.numeric(frame_data.Table$AverageDegree)
  ggplot(frameTable, aes(x = NetworkFile, y = AverageDegree)) + geom_bar(stat = "identity") + theme(axis.text.x = element_text(angle = 90, hjust = 1))
  
  histogramsAverageDegree = paste(GRAFICS_PATH, name.file,"AverageDegree",".png", sep="");
  ggsave(histogramsAverageDegree, device = "png")
}

generate.histogramsMaxDegree <- function (frameTable)
{
  frame_data.Table$MaxDegree <<- as.numeric(frame_data.Table$MaxDegree)
  ggplot(frameTable, aes(x = NetworkFile, y = MaxDegree)) + geom_bar(stat = "identity") + theme(axis.text.x = element_text(angle = 90, hjust = 1))
  
  histogramsMaxDegree = paste(GRAFICS_PATH, name.file,"MaxDegree",".png", sep="");
  ggsave(histogramsMaxDegree, device = "png")
}

generate.histogramsDiameterNetwork <- function (frameTable)
{
  frame_data.Table$DiameterNetwork <<- as.numeric(frame_data.Table$DiameterNetwork)
  ggplot(frameTable, aes(x = NetworkFile, y = DiameterNetwork)) + geom_bar(stat = "identity") + theme(axis.text.x = element_text(angle = 90, hjust = 1))
  
  histogramsDiameterNetwork = paste(GRAFICS_PATH, name.file,"DiameterNetwork",".png", sep="");
  ggsave(histogramsDiameterNetwork, device = "png")
}

generate.histogramsCoefficientAgroupment <- function (frameTable)
{
  frame_data.Table$CoefficientAgroupment <<- as.numeric(frame_data.Table$CoefficientAgroupment)
  ggplot(frameTable, aes(x = NetworkFile, y = CoefficientAgroupment)) + geom_bar(stat = "identity") + theme(axis.text.x = element_text(angle = 90, hjust = 1))
  
  histogramsCoefficientAgroupment = paste(GRAFICS_PATH, name.file,"CoefficientAgroupment",".png", sep="");
  ggsave(histogramsCoefficientAgroupment, device = "png")
}

generate.histogramsBetweennessMedium <- function (frameTable)
{
  frame_data.Table$BetweennessMedium <<- as.numeric(frame_data.Table$BetweennessMedium)
  ggplot(frameTable, aes(x = NetworkFile, y = BetweennessMedium)) + geom_bar(stat = "identity") + theme(axis.text.x = element_text(angle = 90, hjust = 1))
  
  histogramsBetweennessMedium = paste(GRAFICS_PATH, name.file,"BetweennessMedium",".png", sep="");
  ggsave(histogramsBetweennessMedium, device = "png")
}

generate.histogramsClosenessNetwork <- function (frameTable)
{
  frame_data.Table$ClosenessNetwork <<- as.numeric(frame_data.Table$ClosenessNetwork)
  ggplot(frameTable, aes(x = NetworkFile, y = ClosenessNetwork)) + geom_bar(stat = "identity") + theme(axis.text.x = element_text(angle = 90, hjust = 1))
  
  histogramsClosenessNetwork = paste(GRAFICS_PATH, name.file,"ClosenessNetwork",".png", sep="");
  ggsave(histogramsClosenessNetwork, device = "png")
}