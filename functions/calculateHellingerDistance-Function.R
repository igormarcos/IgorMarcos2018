#Hellinger Distance

calculate.hellinger.frame <- function (frameTable) 
  {
  #Number of rows of dataframe
  num.rowsFrame <- nrow(frameTable)
  idRow <- 0
  frame_data.Hellinger <<- data.frame(NetworkFile1=character(0), NetworkFile2=character(0), resultCalculateHelingerDefault=numeric(0), resultCalculateHelingerOthermethod=numeric(0), logDataSetCompair=numeric(0), idRow=numeric(0) ,stringsAsFactors=FALSE)
  for (i in 1:num.rowsFrame)
  {
    #Normalize network 1
    network1 <- rnorm(frameTable$Edges[i])
    NetworkFile1 <- frameTable$NetworkFile[i]
    for (j in 1:num.rowsFrame )
    {
      #Normalize network 2
      network2 <- rnorm(frameTable$Edges[j])
      NetworkFile2 <- frameTable$NetworkFile[j]
      if (NetworkFile1 != NetworkFile2)
      {
      resultCalculateHelingerDefault <- hellinger(network1, network2, -Inf, Inf)
      resultCalculateHelingerOthermethod <- hellinger(network1, network2, -Inf, Inf, method = 2)
      logDataSetCompair <- log(frame_data.Table$Edges[i] + frame_data.Table$Edges[j]/2)
      idRow <- (idRow + 1)
      #Write DataFrame
      frame_data.Hellinger <<- rbind(frame_data.Hellinger,data.frame(setNames(as.list(c(as.character(NetworkFile1),as.character(NetworkFile2),as.numeric(resultCalculateHelingerDefault),as.numeric(resultCalculateHelingerOthermethod), as.numeric(logDataSetCompair), as.numeric(idRow))),names(frame_data.Hellinger)),stringsAsFactors = FALSE))
      }
    }
  }
}
generate.histogramsHellinger <- function (frameTable)
{
  frame_data.Hellinger$resultCalculateHelingerDefault <<- as.numeric(frame_data.Hellinger$resultCalculateHelingerDefault)
  frame_data.Hellinger$resultCalculateHelingerOthermethod <<- as.numeric(frame_data.Hellinger$resultCalculateHelingerOthermethod)
  frame_data.Hellinger$logDataSetCompair <<- as.numeric(frame_data.Hellinger$logDataSetCompair)
  frame_data.Hellinger$idRow <<- as.numeric(frame_data.Hellinger$idRow)
  #frame_data.Hellinger$resultCalculateHelingerDefault <<- as.numeric(frame_data.Hellinger$resultCalculateHelingerDefault)
  #HellingerNetwork = paste(frameTable$NetworkFile1,"\n" ,frameTable$NetworkFile2, sep="");
  #ggplot(data=frameTable, aes(x=HellingerNetwork, y=resultCalculateHelingerDefault)) +geom_bar(stat = "identity") + theme(axis.text.x = element_text(angle = 90, hjust = 1))
  #ggplot(frameTable, aes(HellingerNetwork, logDataSetCompair, shape = factor(NetworkFile1))) + geom_point(aes(colour = factor(NetworkFile1)), size = 4) + geom_point(colour = "grey90", size = 1.5) + theme(axis.title.x=element_blank(), axis.text.x=element_blank(), axis.ticks.x=element_blank())
  #ggplot(frameTable, aes(resultCalculateHelingerDefault, logDataSetCompair)) + geom_point() + xlim(NA, 1)
  
  ggplot(frameTable, aes(idRow, resultCalculateHelingerDefault)) + geom_point()
  histogramsHellinger = paste(GRAFICS_PATH, name.file,"Hellinger",".png", sep="");
  ggsave(histogramsHellinger, device = "png")
}