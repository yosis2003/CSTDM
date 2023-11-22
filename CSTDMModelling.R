
library(stringi)
library(stringr)
library(readxl)
library(tidyverse)
library(writexl)
# Set the working directory to your folder containing files

setwd("D:/Documents - Beeg Drive/ITS/CSTDM/CSTDM Commercial Vehicle Output")

# Get a list of all files in the directory


Light <- list()
Medium <- list()
IVehicles <- list()
Heavy <- list()

file_list <- list.files()

# Load all files into a list
data_list <- lapply(file_list, read.csv)  # Assuming the files are CSV, adjust read function accordingly




for (i in 1:length(file_list)){
    rowsOfL = which(data_list[[i]][,14] == "L")
    rowsOfM = which(data_list[[i]][,14] == "M")
    rowsOfH = which(data_list[[i]][,14] == "H")
    rowsOfI = which(data_list[[i]][,14] == "I")
    lite = 0
    med = 0 
    iv = 0
    hev = 0
    for (x in 1:length(rowsOfL)){
        lite = lite + data_list[[i]][rowsOfL[x],22]
    }
    for (x in 1:length(rowsOfM)){
        med = med + data_list[[i]][rowsOfM[x],22]
    }
    for (x in 1:length(rowsOfH)){
        hev = hev + data_list[[i]][rowsOfH[x],22]
    }
    for (x in 1:length(rowsOfI)){
        iv = iv + data_list[[i]][rowsOfI[x],22]
    }
    Light[length(Light) + 1] = lite
    Medium[length(Medium) + 1] = med
    Heavy[length(Heavy) + 1] = hev
    IVehicles[length(IVehicles) + 1] = iv
}
data <- data.frame(
  LightTrucks = Light,
  MediumTrucks = Medium,
  HeavyTrucks = Heavy,
  ITrucks = IVehicles
)

file_path <- "output.xlsx"


write_xlsx(data, file_path)
