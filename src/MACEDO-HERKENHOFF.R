# Projet STA203
# Auteurs: Bruno MACEDO SANCHES
#          Cynthia LACROIX HERKENHOFF

library("readxl")
rm(list=objects()); graphics.off()

# Changer pour le directoire src du projet
setwd("c:/Users/bruno/Projet_STA203/src/")

data = read_excel("../data/Raisin.xlsx")
head(data)
