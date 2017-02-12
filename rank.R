#ranking
library(jsonlite)

liste <- read.csv("liste.csv", stringsAsFactors = FALSE, fileEncoding="UTF-8")

band <- sort(unique(liste[,1]))
ant.band <- length(band)
dato <- Sys.Date()
dato <- as.integer(substring(dato,3,4))

##Algoritme for en enkelt poengberegning
##Siddis-poeng er 80% av NM-poeng
poeng <- function(rad){
  konk <- ifelse(liste[rad,4] == "NM", 1, ifelse(liste[rad,4] == "Siddis", 0.8, 0))
  (liste[rad,2]^4) / (dato^4) * (11-(2*liste[rad,3])) * (22 - liste[rad,5]) * konk
}

##Algoritme for poengberegning av ett korps
score <- function(navn) {
  rows <- subset(liste, liste[,1] == navn)
  rows <- as.integer(row.names(rows))
  res <- sum(poeng(rows))
  return(res)
}

## Lager rankinglisten
rank <- data.frame()
    for (i in 1:ant.band) {
        musikklag <- band[i]
        res <- score(band[i])
        korps <- t(data.frame(c(musikklag, res)))
        rank <- rbind(rank, korps)
    }

## Fikser rankinglisten
row.names(rank) <- NULL
rank[,2] <- round(as.numeric(as.character(rank[,2])), digits=2)
rank[,1] <- as.character(rank[,1])
rank <- rank[order(-rank[,2]),]
rank[,3] <- 1:ant.band
rank <- data.frame(rank[,3], rank[,1], rank[,2])
names(rank) <- c("plass", "korps", "poeng")

##Lagrer rankinglisten
write.csv(rank, "ranking/ranking.csv", row.names=FALSE, fileEncoding="UTF-8")

## Lage JSON
rank.js <- toJSON(rank)
rank.js <- prettify(rank.js)
write_json(rank.js, "ranking/rank.js", fileEncoding="UTF-8")