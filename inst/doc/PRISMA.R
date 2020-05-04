## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>", 
  dpi = 200, 
  warning = FALSE
)
library(prismadiagramR)
library(dplyr)

## ----setup---------------------------------------------------------------
library(prismadiagramR)
library(dplyr)

## ------------------------------------------------------------------------

set.seed(25)
N <- 100
studyStatus <- data.frame(Pub.ID = seq(1:N),
                          Source = sample(letters[1:3], N, replace = TRUE),
                          Filter = sample(letters[1:5], N, replace = TRUE))
studyStatus$Filter[studyStatus$Filter=="e"] <- NA
getPrisma(studyStatus) %>% DiagrammeR::grViz(.)


## ------------------------------------------------------------------------
studyStatus$Source <- ordered(studyStatus$Source , levels = c("c", "b", "a"))
studyStatus$Filter <- ordered(studyStatus$Filter , levels = c("d", "c", "b", "a"))

getPrisma(studyStatus) %>% DiagrammeR::grViz(.)

## ------------------------------------------------------------------------
prismaFormat <- getPrismaFormat(studyStatus)
flextable::flextable(prismaFormat)


## ------------------------------------------------------------------------
prismaFormat$prismaTxt[1] <- "Medline"
getPrisma(studyStatus = NULL, prismaFormat = prismaFormat) %>% DiagrammeR::grViz(.)


## ------------------------------------------------------------------------
prismaFormat$fontSize <- 15
prismaFormat$fontSize[1] <- 10
getPrisma(studyStatus = NULL, prismaFormat = prismaFormat) %>% DiagrammeR::grViz(.)

## ------------------------------------------------------------------------
prismaFormat <-
  data.frame(
    prismaLvl = c(1,2,3,3,4),
    nodeType =  c("Source", "Node", "Node", "Filter", "End"),
    prismaTxt = letters[1:5]
  )

getPrisma(studyStatus = NULL, prismaFormat = prismaFormat) %>% DiagrammeR::grViz(.)

