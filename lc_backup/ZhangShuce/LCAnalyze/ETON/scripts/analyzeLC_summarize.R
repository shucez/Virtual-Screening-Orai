#!/export/panfs02/home/zhengsisi/softwares/R/R-3.2.5/bin/Rscript  --vanilla --default-packages=utils
# Shuce Zhang v1.2 20171128
library(plyr)
rm(list=ls())                                                                     #specify the cutoff value here
##############set working directory
#setwd("~/ZhangShuce/LCAnalyze/Nexus/result/filter_all")                            #use this workdir on 59.64.59.110
#setwd("~/wkdir/dOraiMNexus/test")                                                 #use this workdir on 202.112.87.52
#setwd("G:/Docking/Orai_project/Analysis/LCAnalysis/summarize")                          #use this workdir on SZ-HP
print(paste("Current wkdir=",getwd()))

##############Processing ACE
print("Reading files for ACE ...")
files <- dir(".", pattern = "^ACE*")
for (file in files) {
  print(paste("processing",file,"..."))
  raw <- read.delim(file, header = F, sep = " ")
  raw <- raw[,-5]
  names(raw) <- c("Rec","Lig","Num","ene","source")
  df1<- ddply(raw, .(Lig), subset,                                                    #filter hits with triplicates above threshold
              any(Rec == "A") &&
                any(Rec == "C") &&
                any(Rec == "E"))
  write.table(df1, sep = "\t", file = paste("df",file,"tab", sep = "."))
  write.table(ddply(df1,.(Lig),summarise,A=ene[Rec=="A"],C=ene[Rec=="C"],E=ene[Rec=="E"], SRC=source[Rec=="A"]),
              sep = "\t", 
              file = paste("summ",file,"tab",sep = "."))
}

##############Processing BDF
print("Reading files for BDF ...")
files <- dir(".", pattern = "^BDF*")
for (file in files) {
  print(paste("processing",file,"..."))
  raw <- read.delim(file, header = F, sep = " ")
  raw <- raw[,-5]
  names(raw) <- c("Rec","Lig","Num","ene","source")
  df1<- ddply(raw, .(Lig), subset,                                                    #filter hits with triplicates above threshold
              any(Rec == "B") &&
                any(Rec == "D") &&
                any(Rec == "F"))
  write.table(df1, sep = "\t", file = paste("df",file, sep = "."))
  write.table(ddply(df1,.(Lig),summarise,B=ene[Rec=="B"],D=ene[Rec=="D"],F=ene[Rec=="F"], SRC=source[Rec=="A"]),
              sep = "\t", 
              file = paste("summ",file,sep = "."))
}
