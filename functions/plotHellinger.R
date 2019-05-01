plot.hellinger <- function (FrameData.Hellinger) {
  
  frame_data.MeanHellinger <<- data.frame(NetworkFile=character(0), meanResultCalculateHelingerDefault=numeric(0), idRow=numeric(0), stringsAsFactors = FALSE)
  
  #Cria lista de nomes da redes
  frameListHellinger <<- FrameData.Hellinger[!duplicated(FrameData.Hellinger$NetworkFile1),]
  num.rowsFrame <- nrow(frameListHellinger)
  idRow <- 0
  
  mean_col <- function( frameCalc, col ) {
    mean( get(frameCalc)[[ col ]] )
  }
  
  for (i in 1:num.rowsFrame){
    frameSelectHellinger <- subset(FrameData.Hellinger, FrameData.Hellinger$NetworkFile1== frameListHellinger$NetworkFile1[i])
    
    cat("Result Mean of: ", frameListHellinger$NetworkFile1[i], "\n");
    NetworkFile <- frameListHellinger$NetworkFile1[i];
    
    cat(mean_col("frameSelectHellinger", "resultCalculateHelingerDefault"), "\n");
    meanResultCalculateHelingerDefault = as.numeric(meanResultCalculateHelingerDefault <- mean_col("frameSelectHellinger", "resultCalculateHelingerDefault"))
    
    frame_data.MeanHellinger <<- rbind(frame_data.MeanHellinger,data.frame(setNames(as.list(c(as.character(NetworkFile),as.numeric(meanResultCalculateHelingerDefault),as.numeric(idRow))),names(frame_data.MeanHellinger)),stringsAsFactors = FALSE))
    idRow <- (idRow + 1)
  }
    
    frame_data.MeanHellinger <<- transform(frame_data.MeanHellinger, meanResultCalculateHelingerDefault = as.numeric(meanResultCalculateHelingerDefault), idRow = as.numeric(idRow))
    
    ggplot(frame_data.MeanHellinger, aes(x=frame_data.MeanHellinger$idRow, y=frame_data.MeanHellinger$meanResultCalculateHelingerDefault)) + 
      geom_point(size=2, colour="darkred", shape=15) +
      labs(subtitle="Edges", y="Valor de Hellinger", x="Instante de Tempo da Coleta", title="Hellinger Distance", caption = name.file) + 
      geom_line(size=1, colour="darkred")
    
    MeanHellinger = paste(RESULTS_PATH, name.file,"ResultMeanHellinger",".png", sep="");
    ggsave(MeanHellinger, device = "png")
    
    str(frame_data.MeanHellinger)
    
    #MeanHellinger = paste(RESULTS_PATH, name.file,"ResultMeanHellinger2",".png", sep="");
    #ggsave(MeanHellinger, device = "png")
}