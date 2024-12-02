
library(tidyverse)
library(glue)

wd <- getwd()

# first problem solving ----------

inputs <- read.table(glue("{wd}/1/inputs.txt"))

data <- inputs
data[,1] <- sort(data[,1], decreasing = F)
data[,2] <- sort(data[,2], decreasing = F)
data[,3] <- abs(data[,1] - data[,2])

result <- sum(data[,3])

# second problem solving ----------

inputs <- read.table(glue("{wd}/1/inputs.txt"))

data <- inputs

temp <- data.frame(table(sort(data[,2], decreasing = F)))
data <- data.frame(Var1 = sort(data[,1], decreasing = F))
data <- merge(data, temp)

for (i in 1:nrow(data)) {
    data[i,3] <- data$Var1[i] * data$Freq[i]
}
 
result <- sum(data[,3])


