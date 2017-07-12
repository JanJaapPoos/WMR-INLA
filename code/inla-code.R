rm(list=ls()); gc()

library(INLA); library(fields); library(lattice); library(latticeExtra); library(grid); library(gridExtra);library(rgdal) 
setwd("d://WMR-INLA/data")

cpue_IBTS <- read.csv("CPUE per length per haul_2017-07-12 11_18_36.csv", stringsAsFactors = F)
cpue_IBTS$NoPerHaul <- round(cpue_IBTS$CPUE_number_per_hour*(cpue_IBTS$HaulDur/60))
cpue_IBTS <- cpue_IBTS[!(names(cpue_IBTS) %in% c("DateofCalculation", "Area", "SubArea", "DayNight","Species","Sex","DateTime","CPUE_number_per_hour"))]

cpue_BTS  <- read.csv("CPUE per length per Hour and Swept Area_2017-07-12 11_29_36.csv", stringsAsFactors = F)
cpue_BTS <- cpue_BTS[!(names(cpue_BTS) %in% c("Country","DoorType","HaulLat","HaulLong","StatRec","DataType","Rigging","Tickler","Distance","Warplngt","TowDir","WindDir","WindSpeed","SwellDir","SwellHeight","StNo","Month","Day","TimeShot","Stratum","ICESArea","DateofCalculation", "Area", "SubArea", "DayNight","Species", "Sex","SpecVal","SubFactor","GearExp","SweepLngt","Netopening","BycSpecRecCode","StdSpecRecCode","HaulVal","CPUE_number_per_hour","CPUE_number_per_km2","SweptArea_km2","DistanceDerived","BeamWidth", "HLNoAtLngt"))]
cpue_BTS <- cpue_BTS[!is.na(cpue_BTS$LngtClass),]

cpue <- rbind(cpue_BTS,cpue_IBTS)
