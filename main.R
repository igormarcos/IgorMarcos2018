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
packages(MASS)
packages(poweRlaw)

#turn-off scientific notation like 1e+48
options(scipen=999)

#Load Library
library(igraph) 
library(dplyr)
library(utils)
library(ggplot2)
library(statip)
library(gtools)
library(MASS)
library(poweRlaw)

#Set and Load Path
runningpath <- function(Path) {
  if (Path == "WORK")
  {
    # Set path WORK 
    #CURRENT_VERSION_PATH <<- "C:/Users/igormarcos/Dropbox/Mestrado UFAL/TCC/IgorMarcos2018/";
    CURRENT_VERSION_PATH <<- "C:/Users/Igor/Dropbox/Mestrado UFAL/TCC/IgorMarcos2018/";
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
    #CURRENT_VERSION_PATH <<- "/Users/igoroliveira/Dropbox/Mestrado UFAL/TCC/IgorMarcos2018/";
    CURRENT_VERSION_PATH <<- "C:/Users/Igor Oliveira/Dropbox/Mestrado UFAL/TCC/IgorMarcos2018/";
    FUNCTIONS_PATH <<- paste(CURRENT_VERSION_PATH,"functions/",sep="");
    DATASETS_PATH <<- paste(CURRENT_VERSION_PATH,"datasets/",sep="");
    GRAFICS_PATH <<- paste(CURRENT_VERSION_PATH,"grafics/",sep="");
    GRAPHS_PATH <<- paste(CURRENT_VERSION_PATH,"graphs/",sep="");
    RESULTS_PATH <<- paste(CURRENT_VERSION_PATH,"results/",sep="");
    TEMP_PATH <<- paste(CURRENT_VERSION_PATH,"temp/",sep="");
    UTIL_PATH <<- paste(CURRENT_VERSION_PATH, "util/",sep="");
  }

  
  # Load functions
  file_list <- list.files(path=FUNCTIONS_PATH, pattern="*.R") # create list of all .R files in folder
  
  # read in each .R file in file_list and create a data frame with the same name as the .R file
  for (i in 1:length(file_list)){
    assign(file_list[i], source(paste(FUNCTIONS_PATH,file_list[i],sep="")))
    }
}

#Define running PATH

runningpath("HOME")
#Log CMD R on File
#sink(paste(RESULTS_PATH, "prompt",".txt", sep=""))
#Create RESULTS_PATH if not exists
#ifelse(!dir.exists(file.path(CURRENT_VERSION_PATH, RESULTS_PATH)), dir.create(file.path(CURRENT_VERSION_PATH, RESULTS_PATH), FALSE))
#Create GRAFICS_PATH if not exists
#ifelse(!dir.exists(file.path(CURRENT_VERSION_PATH, GRAFICS_PATH)), dir.create(file.path(CURRENT_VERSION_PATH, GRAFICS_PATH), showWarnings = FALSE))

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
summaryFile <- paste(RESULTS_PATH, name.file,".csv", sep="")
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

#calculate.hellinger.frame(frame_data.Table)
calculate.hellinger.frame.new(frame_data.Table)
#generate.histogramsHellinger(frame_data.Hellinger)
generate.histogramsHellinger.new(frame_data.Hellinger)

#Write DataFrame-Hellinger
setwd(RESULTS_PATH)
summaryFile <- paste(RESULTS_PATH, name.file,"-Hellinger",".csv", sep="")
write.csv(frame_data.Hellinger, summaryFile, row.names = FALSE)

#Plot DegreeDistribution
cat("Plot DegreeDistribution for Full DataSet\n");
plot.DegreeDisribution()

cat("Plot Average Minimum Path\n");
plot.AverageMinimumPath()

cat("Plot Coefficient Agroupment\n");
plot.CoefficienteAgroupment()

cat("Plot Betweenness Medium\n");
plot.Betweenness()

cat("Plot Diameter (L Distance)\n");
plot.Diameter()

cat("Plot Average Minimum Path And CA Groupment\n");
plot.AverageMinimumPathAndCAgroupment ();

cat("Plot AverageMinimum Path VS Betweenness Medium\n");
plot.AverageMinimumPathVSBetweennessMedium()

#Plot Hellinger<-in construction
#plot.hellinger(frame_data.Hellinger)
#Write DataFrame-DataTable
summaryFile <- paste(RESULTS_PATH, name.file,"-ResultDataTable",".csv", sep="")
write.csv(frame_data.Table, summaryFile, row.names = FALSE)
#Write DataFrame-dataSetObjFull
summaryFile <- paste(RESULTS_PATH, name.file,"-ResultObjFULL",".csv", sep="")
write.csv(dataSetObjFULL, summaryFile, row.names = FALSE)
#=======Algoritm=========#

#Load DataSet Vanet - Done
#Convert Graph to gml - Done
#Calculate Metrics - Done
#Calculate Histograms - Done
#Calculate Helinger's Distance - Done
#Plot grafics - Done

#========================#
