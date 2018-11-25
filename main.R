# Install function for packages    
packages<-function(x){
  x<-as.character(match.call()[[2]])
  if (!require(x,character.only=TRUE)){
    install.packages(pkgs=x,repos="http://cran.r-project.org")
    require(x,character.only=TRUE)
  }
}

#Check Packages
packages(igraph)    #For Calculate parameters complex network
packages(dplyr)     #For ??
packages(utils)     #For use write files
packages(ggplot2)   #For use graphic plot
packages(statip)    #For use Hellinger Distance
packages(gtools)    #Sort Files

#Load Library
library(igraph) 
library(dplyr)
library(utils)
library(ggplot2)
library(statip)
library(gtools)

#Set and Load Path
runningpath <- function(Path) {
  if (Path == "WORK")
  {
    # Set path WORK
    CURRENT_VERSION_PATH <<- "C:/Users/igormarcos/Dropbox/Mestrado UFAL/TCC/IgorMarcos2018/";
    FUNCTIONS_PATH <<- paste(CURRENT_VERSION_PATH,"functions/",sep="");
    DATASETS_PATH <<- paste(CURRENT_VERSION_PATH,"datasets/",sep="");
    GRAFICS_PATH <<- paste(CURRENT_VERSION_PATH,"grafics/",sep="");
    GRAPHS_PATH <<- paste(CURRENT_VERSION_PATH,"graphs/",sep="");
    RESULTS_PATH <<- paste(CURRENT_VERSION_PATH,"results/",sep="");
    TEMP_PATH <<- paste(CURRENT_VERSION_PATH,"temp/",sep="");
    UTIL_PATH <<- paste(CURRENT_VERSION_PATH, "util/",sep="");
  }
  if (Path == "HOME")
  {
    #Set path HOME
    CURRENT_VERSION_PATH <<- "/Users/igoroliveira/Dropbox/Mestrado UFAL/TCC/IgorMarcos2018/";
    FUNCTIONS_PATH <<- paste(CURRENT_VERSION_PATH,"functions/",sep="");
    DATASETS_PATH <<- paste(CURRENT_VERSION_PATH,"datasets/",sep="");
    GRAFICS_PATH <<- paste(CURRENT_VERSION_PATH,"grafics/",sep="");
    GRAPHS_PATH <<- paste(CURRENT_VERSION_PATH,"graphs/",sep="");
    RESULTS_PATH <<- paste(CURRENT_VERSION_PATH,"results/",sep="");
    TEMP_PATH <<- paste(CURRENT_VERSION_PATH,"temp/",sep="");
    UTIL_PATH <<- paste(CURRENT_VERSION_PATH, "util/",sep="");
  }
  #else
   # {
   # cat("Only answer HOME or WORK, run again!\n");
  #  quit("yes")
  #}
  
  # Load functions
  file_list <- list.files(path=FUNCTIONS_PATH, pattern="*.R") # create list of all .R files in folder
  
  # read in each .R file in file_list and create a data frame with the same name as the .R file
  for (i in 1:length(file_list)){
    assign(file_list[i], source(paste(FUNCTIONS_PATH,file_list[i],sep="")))
    }
}

#Define running PATH
#cat("Define running path\n");
#cat("HOME\n");
#cat("WORK\n");
#path.de <- readline(prompt="Where are you?\n");
runningpath("HOME")
#Log CMD R on File
#sink(paste(GRAFICS_PATH, "prompt",".txt", sep=""))

#Define frame
#frame_data.Table <<- data.frame("NetworkFile" = character(40), "Ed" = numeric(10), "Ve" = numeric(10), "d" = numeric(10), "D" = numeric(5), "L" = numeric(4), "CA" = numeric(10), "B" = numeric(4), "CLos" = numeric(4), stringsAsFactors=F)

#Read txt Files
cat("Invoke file object txt\n");
search.file()

#cat("Modifi file object gml graph\n");
#mod.data.work()

#Read gml Files
cat("Invoke file object gml graph\n");
load.data.work()

#Write DataFrame
setwd(RESULTS_PATH)
summaryFile <- paste(GRAFICS_PATH, name.file,".csv", sep="")
write.csv(frame_data.Table, summaryFile, row.names = FALSE)

#Generete Histograms
convert.data.frame()

generate.histogramsEdges(frame_data.Table)
generate.histogramsVertices(frame_data.Table)
generate.histogramsAverageDegree(frame_data.Table)
generate.histogramsMaxDegree(frame_data.Table)
generate.histogramsDiameterNetwork(frame_data.Table)
generate.histogramsCoefficientAgroupment(frame_data.Table)
generate.histogramsBetweennessMedium(frame_data.Table)
generate.histogramsClosenessNetwork(frame_data.Table)


#Calculate Helinger

calculate.hellinger.frame(frame_data.Table)
generate.histogramsHellinger(frame_data.Hellinger)

#=======Algoritm=========#

#Load DataSet Vanet - Done
#Convert Graph to gml - Done
#Calculate Metrics - Done
#Calculate Histograms - Done
#Calculate Helinger's Distance - Doing
#Plot grafics

#========================#
