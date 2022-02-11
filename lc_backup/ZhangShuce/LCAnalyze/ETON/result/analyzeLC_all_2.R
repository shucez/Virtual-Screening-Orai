#!/export/panfs02/home/zhengsisi/softwares/R/R-3.2.5/bin/Rscript  --vanilla --default-packages=utils
# Shuce Zhang v1.2 20171125
library(plyr)
rm(list=ls())
ts <- 1e-2                                                                      #specify the cutoff value here
##############set working directory
setwd("~/ZhangShuce/LCAnalyze/Nexus/result/all")                            #use this workdir on 59.64.59.110
#setwd("~/wkdir/dOraiMNexus/test")                                                 #use this workdir on 202.112.87.52
#setwd("G:/Docking/Orai_project/Analysis/LCAnalysis/test")                          #use this workdir on SZ-HP
print(paste("Current wkdir=",getwd()))

##############reaing files
print("Reading files...")
files <- dir(".", pattern = "*.txt")
print(files[1])
raw <- read.delim(files[1], header = F)
for (file in files[-1]) {
  print(file)
  raw <- rbind(raw, read.delim(file, header = F))
}
names(raw) <- c("Rec","Lig","Num","ene")
print("Reading completed!")

###############calculating thresholds
print("calculating thresholds...")
thres <- ddply(raw, .(Rec), summarise,                                             #calculate cut-off thresholds and export to file
      q5 = quantile(ene, 0.00001), 
      q4 = quantile(ene, 0.0001), 
      q3 = quantile(ene, 0.001), 
      q2 = quantile(ene, 0.01))
write.table(thres, file = "thres.tab")
print(thres)
# f5<- ddply(raw, .(Rec), subset, ene<quantile(ene, 0.00001))                        #filter results according to cut-offs
# f4<- ddply(raw, .(Rec), subset, ene<quantile(ene, 0.0001))
# f3<- ddply(raw, .(Rec), subset, ene<quantile(ene, 0.001))
# f2<- ddply(raw, .(Rec), subset, ene<quantile(ene, 0.01))

###########################################Filtering for ACE
print(paste("Filtering results for ACE...\n","cutoff quantile = ", ts))
raw <- ddply(raw, .(Rec), subset, ene < quantile(x = ene, probs = ts))
df1<- ddply(raw, .(Lig), subset,                                                    #filter hits with triplicates above threshold
           any(Rec == "A") &&
           any(Rec == "C") &&
           any(Rec == "E"))
write.table(ddply(df1[grep("[ACE]",df1$Rec,perl = TRUE),],.(Lig),summarise,A=ene[Rec=="A"],C=ene[Rec=="C"],E=ene[Rec=="E"]),
           file = paste("ACE",ts,"tab",sep = "."))
rm(df1)

print(paste("Filtering results for BDF...\n","cutoff quantile = ", ts))
df2<- ddply(raw, .(Lig), subset,                                                    #filter hits with triplicates above threshold
           any(Rec == "B") &&
           any(Rec == "D") &&
           any(Rec == "F"))
write.table(ddply(df2[grep("[BDF]",df2$Rec,perl = TRUE),],.(Lig),summarise,B=ene[Rec=="B"],D=ene[Rec=="D"],F=ene[Rec=="F"]),
           file = paste("BDF",ts,"tab",sep = "."))
rm(df2)
# for(i in c(1e-5,1e-4,1e-3,1e-2)) {
#   filter.ACE(df=raw, ts=i)
# }
#filter.ACE(df=raw, ts=1e-4)

# h5 <- ddply(f5, .(Lig), subset,                                                    #filter hits with triplicates above threshold
#             any(Rec == "A") && 
#               any(Rec == "C") && 
#               any(Rec == "E"))
# ACE5 <- h5[grep("[ACE]",h5$Rec,perl = TRUE),]                                      #filter hits according to receptor
# write.table(ddply(ACE5,.(Lig),summarise,A=ene[Rec=="dOraiMNexusA.pdbqt"],C=ene[Rec=="dOraiMNexusC.pdbqt"],E=ene[Rec=="dOraiMNexusC.pdbqt"]),
#             file = "ACE5.tab")
# 
# 
# h4 <- ddply(f4, .(Lig), subset, 
#             any(Rec == "dOraiMNexusA.pdbqt") && 
#               any(Rec == "dOraiMNexusC.pdbqt") && 
#               any(Rec == "dOraiMNexusE.pdbqt"))
# ACE4 <- h4[grep("[ACE]",h4$Rec,perl = TRUE),]
# h3 <- ddply(f3, .(Lig), subset, 
#             any(Rec == "dOraiMNexusA.pdbqt") && 
#               any(Rec == "dOraiMNexusC.pdbqt") && 
#               any(Rec == "dOraiMNexusE.pdbqt"))
# ACE3 <- h3[grep("[ACE]",h3$Rec,perl = TRUE),]
# h2 <- ddply(f2, .(Lig), subset, 
#            any(Rec == "dOraiMNexusA.pdbqt") && 
#              any(Rec == "dOraiMNexusC.pdbqt") && 
#              any(Rec == "dOraiMNexusE.pdbqt"))
# ACE2 <- h2[grep("[ACE]",h2$Rec,perl = TRUE),]
# 
# #re-organize the table and export
# 
# write.table(ddply(ACE4,.(Lig),summarise,A=ene[Rec=="dOraiMNexusA.pdbqt"],C=ene[Rec=="dOraiMNexusC.pdbqt"],E=ene[Rec=="dOraiMNexusC.pdbqt"]),
#             file = "ACE4.tab")
# write.table(ddply(ACE3,.(Lig),summarise,A=ene[Rec=="dOraiMNexusA.pdbqt"],C=ene[Rec=="dOraiMNexusC.pdbqt"],E=ene[Rec=="dOraiMNexusC.pdbqt"]),
#             file = "ACE3.tab")
# write.table(ddply(ACE2,.(Lig),summarise,A=ene[Rec=="dOraiMNexusA.pdbqt"],C=ene[Rec=="dOraiMNexusC.pdbqt"],E=ene[Rec=="dOraiMNexusC.pdbqt"]),
#             file = "ACE2.tab")
# 
# 
# ###########################################Filtering for BDF
# b5 <- ddply(f5, .(Lig), subset, 
#             any(Rec == "dOraiMNexusB.pdbqt") && 
#               any(Rec == "dOraiMNexusD.pdbqt") && 
#               any(Rec == "dOraiMNexusF.pdbqt"))
# BDF5 <- b5[grep("[BDF]",b5$Rec,perl = TRUE),]
# b4 <- ddply(f4, .(Lig), subset, 
#             any(Rec == "dOraiMNexusB.pdbqt") && 
#               any(Rec == "dOraiMNexusD.pdbqt") && 
#               any(Rec == "dOraiMNexusF.pdbqt"))
# BDF4 <- b4[grep("[BDF]",b4$Rec,perl = TRUE),]
# b3 <- ddply(f3, .(Lig), subset, 
#             any(Rec == "dOraiMNexusB.pdbqt") && 
#               any(Rec == "dOraiMNexusD.pdbqt") && 
#               any(Rec == "dOraiMNexusF.pdbqt"))
# BDF3 <- b3[grep("[BDF]",b3$Rec,perl = TRUE),]
# b2 <- ddply(f2, .(Lig), subset, 
#             any(Rec == "dOraiMNexusB.pdbqt") && 
#               any(Rec == "dOraiMNexusD.pdbqt") && 
#               any(Rec == "dOraiMNexusF.pdbqt"))
# BDF2 <- b2[grep("[BDF]",b:q2$Rec,perl = TRUE),]
# write.table(ddply(BDF5,.(Lig),summarise,B=ene[Rec=="dOraiMNexusB.pdbqt"],D=ene[Rec=="dOraiMNexusD.pdbqt"],F=ene[Rec=="dOraiMNexusD.pdbqt"]),
#             file = "BDF5.tab")
# write.table(ddply(BDF4,.(Lig),summarise,B=ene[Rec=="dOraiMNexusB.pdbqt"],D=ene[Rec=="dOraiMNexusD.pdbqt"],F=ene[Rec=="dOraiMNexusD.pdbqt"]),
#             file = "BDF4.tab")
# write.table(ddply(BDF3,.(Lig),summarise,B=ene[Rec=="dOraiMNexusB.pdbqt"],D=ene[Rec=="dOraiMNexusD.pdbqt"],F=ene[Rec=="dOraiMNexusD.pdbqt"]),
#             file = "BDF3.tab")
# write.table(ddply(BDF2,.(Lig),summarise,B=ene[Rec=="dOraiMNexusB.pdbqt"],D=ene[Rec=="dOraiMNexusD.pdbqt"],F=ene[Rec=="dOraiMNexusD.pdbqt"]),
#             file = "BDF2.tab")
