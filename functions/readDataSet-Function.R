#Write File
write.data.work <- function(dataSetObject.in)
{
  num_TimeStart <- max(dataSetObject.in$TimeStart,na.rm = FALSE)
  #Create Frame
  #frame_data.Table <<- data.frame()
  
  #Gerenerate Files gml
  for (i in 1:num_TimeStart)
  {
    dir_name <<- paste(GRAPHS_PATH,"Results_", name.file ,"_", i, "_to_", num_TimeStart, sep="")
    #file_name.write = paste(dir_name,".dat", sep="");
    file_name.write.gml = paste(dir_name,".gml", sep="");
    cat("Generate output files about input file\n");
    select_work <- filter(dataSetObject.in, TimeStart == i & TimeStop == i)
    cat("TimeStart = ", i, " \n");
    #TXT File
    #write.table(select_work, file=file_name.write ,sep=' ',na="",quote=FALSE)
    #Graph File
    select_work_graph <- graph.data.frame(select_work)
    write.graph(select_work_graph, file=file_name.write.gml , format = c("gml"))
  }
}

#Select File
search.file <- function ()
  {
    #Windows File Choose
    #default.search = paste(getwd(),"/datasets/*.txt",sep="")
    #infile2 <- file.choose(default.search,filters = Filters[c("txt","All"),], caption = "Escolha o arquivo!")
    
    #Mac and Windows File Choose
    setwd(DATASETS_PATH) #Set PATH to read file
    file.search <- file.choose() #Select file
    name.file <<- basename(file.search) #Isolate FileName - Global
    cat("File Choosed: ", file.search, "\n") #Print File Choosed
    dataSetObjFULL <<- read.table(file.search,sep = " ", header = T, quote = ".")
    #dir.create() criar pasta com o nome do arquivo aqui!
    write.data.work(dataSetObjFULL)
  }