#     Highcontent_64plate_drug_GCaMP-RCEPIA-mix.R
#      by Shuce Zhang Feb 19, 2017
#This script is to analyze high-content imaging data with mixed GCaMP and RCEPIA 
#cells to simultaneously monitor the [Ca2+]i and [Ca2+]ER and thus to assess the
#effects of drug being tested.
#Should you have any questions please contact Shuce: zhangsc@mail.bnu.edu.cn

library(ggplot2)
rm(list = ls())
Neg_ctrl <- 3   #Please specify the DMSO negative control here.
raw_G_F0 <- read.table("G_F0.txt", header = FALSE)   #input file
raw_G_F <- read.table("G_F.txt", header = FALSE)     #input file
raw_R_F0 <- read.table("R_F0.txt", header = FALSE)   #input file
raw_R_F <- read.table("R_F.txt", header = FALSE)     #input file
names.plates <- read.table("names.txt", header = TRUE)
raw_G_ratio = (raw_G_F - raw_G_F0) / raw_G_F0
raw_R_ratio = (raw_R_F - raw_R_F0) / raw_R_F0

TransMat <- function(raw_matrix) {
  new_matrix <- matrix(,4,24)
  new_matrix[1:4,1:8] <- t(raw_matrix)[1:4,1:8]
  new_matrix[1:4,9:16] <- t(raw_matrix)[5:8,1:8]
  new_matrix[1:4,17:24] <- t(raw_matrix)[9:12,1:8]
  new_matrix
  return(new_matrix)
}

G_ratio <- TransMat(raw_G_ratio)
R_ratio <- TransMat(raw_R_ratio)
Out_ratio <- cbind(t(G_ratio),t(R_ratio))
write.table(Out_ratio, 
            file = "0signal_R_ratio.txt",         #output file
            sep = ",", 
            row.names = FALSE, 
            col.names = FALSE)
p_G <- vector(mode="numeric",length=0)
p_R <- vector(mode="numeric",length=0)
for (i in 1:24) {
  p_G[i] = t.test(G_ratio[,i], G_ratio[,Neg_ctrl])$p.value
  p_R[i] = t.test(R_ratio[,i], R_ratio[,Neg_ctrl])$p.value
}
df.G <- data.frame(Drug = names.plates$Plate3,      #Please change the drug names here!!!  
                   type = 'GCaMP', 
                   mean = apply(G_ratio,2,mean), 
                   sd = apply(G_ratio,2,sd),
                   p = p_G)
df.R <- data.frame(Drug = names.plates$Plate3,      #Please change the drug names here!!!
                   type = 'RCEPIA', 
                   mean = apply(R_ratio,2,mean), 
                   sd = apply(R_ratio,2,sd),
                   p = p_R)
plot.df <- rbind(df.G, df.R)
plot.df <- data.frame(plot.df, se = plot.df$sd/2)
plot.df$star <- ""
plot.df$star[plot.df$p <= .05] <- "*"
plot.df$star[plot.df$p <= .01] <- "**"
plot.df$star[plot.df$p <= .001] <- "***"
bp <- ggplot(plot.df, aes(x = Drug, y = mean, fill = type)) +
  geom_bar(stat="identity", position = "dodge") +
  geom_errorbar(aes(ymin = mean-se/2, ymax = mean+se/2), position = 'dodge') +
  scale_fill_manual(values=c("green4", "orangered2"), name = NULL, labels = c("GCaMP6m","RCEPIA1er")) +
  geom_text(aes(label=star, y=mean+sign(mean)*max(0.05, se)), position = position_dodge(width = 1)) +
  labs(y = expression(Delta(F) / F[0]), x = "Compounds") +
  theme(legend.justification = c(1,1),legend.position = c(1,1), 
        axis.text.x = element_text(size = 15, vjust = 0.5, hjust = 0.5, angle = 45),
        axis.text.y = element_text(size = 15),
        legend.text = element_text(size = 15, ))
show(bp)
