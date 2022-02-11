#     Highcontent_64plate_drug_hor.R
#      by Shuce Zhang Feb 5, 2017
#This script is to analyze high-content imaging data with GCaMP cells to
# monitor the [Ca2+]i change and thus to assess the effects of drug being tested.
#Should you have any questions please contact Shuce: zhangsc@mail.bnu.edu.cn

rm(list = ls())
Neg_ctrl <- 3
raw_F0 <- read.table("F0.txt", header = FALSE)
raw_F <- read.table("F.txt", header = FALSE)
raw_ratio = (raw_F - raw_F0) / raw_F0

TransMat <- function(raw_matrix) {
  new_matrix <- matrix(,4,24)
  new_matrix[1:4,1:8] <- t(raw_matrix)[1:4,1:8]
  new_matrix[1:4,9:16] <- t(raw_matrix)[5:8,1:8]
  new_matrix[1:4,17:24] <- t(raw_matrix)[9:12,1:8]
  new_matrix
  return(new_matrix)
}

error.bar <- function(x, y, upper, lower=upper, length=0.1,...){
  if(length(x) != length(y) | length(y) !=length(lower) | length(lower) != length(upper))
    stop("vectors must be same length")
  arrows(x,y+upper, x, y-lower, angle=90, code=3, length = 0.05)
}

ratio <- TransMat(raw_ratio)
F0 <- TransMat(raw_F0)
mean_ratio <- apply(ratio,2,mean)
sd_ratio <- apply(ratio,2,sd)
se_ratio <- sd_ratio / sqrt(4)
p_ratio <- vector(mode="numeric",length=0)
for (i in 1:24) {
  p_ratio[i] = t.test(ratio[,i], ratio[,Neg_ctrl])$p.value
}
write.table(F0, file = "0signal_R_F0.txt", sep = ",", row.names = FALSE, col.names = FALSE)
write.table(ratio, file = "0signal_R_ratio.txt", sep = ",", row.names = FALSE, col.names = FALSE)
write.table(p_ratio, file = "0signal_R_p.txt", sep = ",", row.names = FALSE, col.names = FALSE)
bp <- barplot(mean_ratio, ylim=c(-0.5,max(mean_ratio)+2), names.arg = c(1:24))
error.bar(bp,mean_ratio, se_ratio)
text(bp, mean_ratio, labels = symnum(p_ratio, cutpoints = c(0, 0.001, 0.01, 0.05, 1), symbols = c("***", "**","*","")), pos = 3)
