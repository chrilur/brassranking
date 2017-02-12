setwd("C:\\Users\\n633164\\Documents\\R\\brassrank")
library(stringr)

fiks.nm <- function(navn, år, div, konk) {
  fil <- read.csv(navn, stringsAsFactors = FALSE, header=FALSE, fileEncoding="UTF-8")
  fil[,1] <- gsub("[0-9]", "", fil[,1])
  fil[,1] <- gsub("\\.", "", fil[,1])
  fil[,1] <- gsub("^\\s+|\\s+$", "", fil[,1])
  fil[,2] <- år
  fil[,3] <- div
  fil[,4] <- konk
  ant <- length(fil[,1])
  fil[,5] <- 1:ant
  names(fil) <- c("band", "år", "div", "konk", "plass")
  write.csv(fil, navn, row.names=FALSE, fileEncoding = "UTF-8")
  return(fil)
  }

comb <- function(liste1, liste2) {
  list <- rbind(liste1, liste2)
  write.csv(list, "liste.csv", row.names=FALSE, fileEncoding="UTF-8")
  return(list)
}