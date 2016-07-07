getwd()
setwd("/Users/denismaciel/Documents/fiscalfreelunch")

df <- read.csv("denis.csv")

dfseq(0,50, 0.1)



j <- c()
for (i in 1:length(df)) {
  j <- paste0(j, ",","'",  df[i] ,"'")
}
j

k <- c()
for (i in 1:length(df)) {
  k <- paste0(k, ",",  df[i])
}
k




# j <- c()
# for (i in 1:nrow(df)) {
#   j <- paste0(j, ",","'",  df[i,] ,"'")
# }
# j

# k <- c()
# for (i in 1:nrow(df)) {
#   k <- paste0(k, ",",  df[i,])
# }
# k
