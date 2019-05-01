# Hellinger Metric (H)

#Hellinger Distance
he.distance <- function(p,q){
  
  D <- (1/sqrt(2))*(sqrt(sum((sqrt(p)-sqrt(q))^2)))
  
  return(D);
  
}

#Hellinger hist
he.distance.hist <- function(pi,qi){
  
  p <- get.probabilities(pi);q <- get.probabilities(qi);
  
  D <- he.distance(p,q);
  
  return(D);
  
}

# Generate probabilities
get.probabilities <- function(p_c){
  
  p <- p_c/sum(p_c); 
  
  return(p);
  
} 

calculate.hellinger.frame.new <- function (frameTable) 
{
  #Number of rows of dataframe
  num.rowsFrame <- nrow(frameTable)
  idRow <- 0
  
  frame_data.Hellinger <<- data.frame(NetworkFile1=character(0), 
                                      NetworkFile2=character(0), 
                                      resultBet=numeric(0),
                                      resultClo=numeric(0), 
                                      resultTrans=numeric(0), 
                                      idRow=numeric(0) ,stringsAsFactors=FALSE)
  for (i in 1:num.rowsFrame)
  {
    NetworkFile1 <- frameTable$NetworkFile[i]
    NetworkFile1 <- as.character(NetworkFile1)
    cat("Hellinger Calc","File1:",NetworkFile1, "- for i:",i, "\n")
    #Normalize network 1
    graph1 <- read.graph(paste(GRAPHS_PATH,NetworkFile1, sep=""),format = c("gml"))
  
    cat("File1:",NetworkFile1, "\n")
    #betweenness
    cat("Betweenness - \n")
    edgeBet <- data.frame(edge.betweenness(graph1))
    histInfoBet1 <- hist(edgeBet$edge.betweenness.graph1.)
    #closeness
    cat("Closeness - \n")
    edgeClo <- data.frame(closeness(graph1))
    histInfoClo1 <- hist(edgeClo$closeness.graph1.)
    #transitivity|Coeficient Agroupment
    cat("Transitivity|Coeficient Agroupment - \n")
    idvertex <- data.frame (vertex.attributes(graph1))
    idvertexNrow <- nrow(idvertex)
    edgeTrans <-data.frame(id=numeric(0),name=character(0), valueEdgeTrans=numeric(0))
    for (v in 1:idvertexNrow) {
      id <- v
      name <- idvertex$name[v]
      valueEdgeTrans <- transitivity(graph1, type="local", vids = name)
      edgeTrans<-rbind(edgeTrans,data.frame(setNames(as.list(c(id,name, valueEdgeTrans)),names(edgeTrans)),stringsAsFactors = FALSE))
    }
    edgeTrans <- data.frame(sapply(edgeTrans, function(x) ifelse(is.nan(x), 0, x)))
    as.numeric(edgeTrans$valueEdgeTrans)
    histInfoTrans1 <- hist(edgeTrans$valueEdgeTrans)
    
    for (j in 1:num.rowsFrame)
    {
      NetworkFile2 <- frameTable$NetworkFile[j]
      NetworkFile2 <- as.character(NetworkFile2)
      cat("Hellinger Calc","File2:",NetworkFile2, "- for i:",i ,"- for j:",j, "\n")
      #Normalize network 2
      graph2 <- read.graph(paste(GRAPHS_PATH,NetworkFile2, sep=""),format = c("gml"))
      
      cat("File2:",NetworkFile2, "\n")
      #betweenness
      cat("Betweenness - Doing\n")
      edgeBet2 <- data.frame(edge.betweenness(graph2))
      histInfoBet2 <- hist(edgeBet2$edge.betweenness.graph2.)
      #closeness
      cat("Closeness - Doing\n")
      edgeClo2 <- data.frame(closeness(graph2))
      histInfoClo2 <- hist(edgeClo2$closeness.graph2.)
      #transitivity|Coeficient Agroupment
      cat("Transitivity|Coeficient Agroupment - Doing\n")
      idvertex2 <- data.frame (vertex.attributes(graph2))
      idvertexNrow2 <- nrow(idvertex2)
      edgeTrans2 <-data.frame(id=numeric(0),name=character(0), valueEdgeTrans2=numeric(0))
      for (y in 1:idvertexNrow2) {
        id2 <- y
        name2 <- idvertex2$name[y]
        valueEdgeTrans2 <- transitivity(graph2, type="local", vids = name2)
        edgeTrans2<-rbind(edgeTrans2,data.frame(setNames(as.list(c(id2,name2, valueEdgeTrans2)),names(edgeTrans2)),stringsAsFactors = FALSE))
      }

      edgeTrans2 <- data.frame(sapply(edgeTrans2, function(x) ifelse(is.nan(x), 0, x)))
      as.numeric(edgeTrans2$valueEdgeTrans2)
      histInfoTrans2 <- hist(edgeTrans2$valueEdgeTrans2)
      #Calc Helinger
      
       if (NetworkFile1 != NetworkFile2)
      {
        cat("=======================================\n")
        resultBet <- he.distance.hist(histInfoBet1$counts,histInfoBet2$counts)
        cat("Helinger Calc Betweenness",NetworkFile1,"AND",NetworkFile2,":",resultBet, "\n")
        resultClo <- he.distance.hist(histInfoClo1$counts,histInfoClo2$counts)
        cat("Helinger Calc Closeness",NetworkFile1,"AND",NetworkFile2,":",resultClo, "\n")
        resultTrans <- he.distance.hist(histInfoTrans1$counts,histInfoTrans2$counts)
        cat("Helinger Calc Transitivity|Coeficient Agroupment",NetworkFile1,"AND",NetworkFile2,":",resultTrans, "\n")
        
        idRow <- (idRow + 1)
        frame_data.Hellinger <<- rbind(frame_data.Hellinger,data.frame(setNames(as.list(c(as.character(NetworkFile1),
                                                                                          as.character(NetworkFile2),
                                                                                          as.numeric(resultBet),
                                                                                          as.numeric(resultClo), 
                                                                                          as.numeric(resultTrans), 
                                                                                          as.numeric(idRow))),names(frame_data.Hellinger)),stringsAsFactors = FALSE))
        cat("rbind idRow:",idRow, "\n")
        cat("=======================================\n")
      }
      cat("Return loop!", "\n")
    }
    cat("End loop!", "\n")
  }
}
generate.histogramsHellinger.new <- function (frameTable)
{
  #PNG Betweenness
  cat("Saving PNG Betweenness!", "\n")
  frame_data.Hellinger$resultBet <<- as.numeric(frame_data.Hellinger$resultBet)
  frame_data.Hellinger$idRow <<- as.numeric(frame_data.Hellinger$idRow)
  theme_set(theme_bw())  # pre-set the bw theme.
  ggplot(frameTable, aes(x=idRow, y=resultBet)) +
    geom_point() +
    geom_smooth(method="loess", se=F) + 
    labs(subtitle="Result Calculate Betweenness", 
         y="Hellinger Value", 
         x="Id Row", 
         title="Hellinger", 
         caption = paste("Source: ", name.file, sep=""))
  
#  ggplot(frameTable, aes(x=idRow, y=resultBet)) + 
#  geom_point(size=2, colour="indianred4", shape=15) + stat_smooth(method="loess", se=F, colour="darkslategrey") +
#  labs(subtitle="", y="Valor de Hellinger", x="Tempo", title="Hellinger Distance", caption = "France 7h-9h") + 
#  geom_line(size=1, colour="indianred4")
  
  histogramsHellinger = paste(RESULTS_PATH, name.file,"Hellinger-Betweenness",".png", sep="");
  ggsave(histogramsHellinger, device = "png")
  
  #PNG Closeness
  cat("Saving PNG Closeness!", "\n")
  frame_data.Hellinger$resultTrans <<- as.numeric(frame_data.Hellinger$resultTrans)
  frame_data.Hellinger$idRow <<- as.numeric(frame_data.Hellinger$idRow)
  theme_set(theme_bw())  # pre-set the bw theme.
  ggplot(frameTable, aes(x=idRow, y=resultTrans)) +
    geom_point() +
    geom_smooth(method="loess", se=F) + 
    labs(subtitle="Result Calculate Closeness", 
         y="Hellinger Value", 
         x="Id Row", 
         title="Hellinger", 
         caption = paste("Source: ", name.file, sep=""))
  histogramsHellinger = paste(RESULTS_PATH, name.file,"Hellinger-Closeness",".png", sep="");
  ggsave(histogramsHellinger, device = "png")
  
  #PNG Transitivity
  cat("Saving PNG Result Calculate Transitivity|Coeficient Agroupment!", "\n")
  frame_data.Hellinger$resultClo <<- as.numeric(frame_data.Hellinger$resultClo)
  frame_data.Hellinger$idRow <<- as.numeric(frame_data.Hellinger$idRow)
  theme_set(theme_bw())  # pre-set the bw theme.
  ggplot(frameTable, aes(x=idRow, y=resultClo)) +
    geom_point() +
    geom_smooth(method="loess", se=F) + 
    labs(subtitle="Result Calculate Transitivity \n Coeficient Agroupment", 
         y="Hellinger Value", 
         x="Id Row", 
         title="Hellinger", 
         caption = paste("Source: ", name.file, sep=""))
  histogramsHellinger = paste(RESULTS_PATH, name.file,"Hellinger-Transitivity",".png", sep="");
  ggsave(histogramsHellinger, device = "png")
}