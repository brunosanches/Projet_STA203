# Projet STA203
# Auteurs: Bruno MACEDO SANCHES
#          Cynthia LACROIX HERKENHOFF

library("readxl")
library("dplyr")
library("ggplot2")
library("cowplot")
library("GGally")
rm(list=objects()); graphics.off()

# Changer pour le directoire src du projet
setwd("c:/Users/bruno/Projet_STA203/src/")

data = read_excel("../data/Raisin.xlsx")
head(data)

data %>%
  group_by(Class) %>%
  count()
# Les données sont equilibrées

data %>%
  group_by(Class) %>%
  summarise_each(mean)
# On remarque que l'aire différencie le plus les deux variétés de raisins, suivi du grand axe et du perimetre

data %>%
  group_by(Class) %>%
  summarise_each(sd)

boxplot(data[,-8])

plot_density <- function(column) {
  ggplot(data, aes_string(x=column, fill="Class")) +
    geom_density(kernel="gaussian", alpha=0.3) +
    labs(xlab=column)
}


lapply(colnames(data)[-8], FUN=plot_density)

do.call("plot_grid", as.list(plots))
plot_grid(plots, nrow=3)

ggpairs(data, columns=1:7, aes(color=Class, alpha=0.3), 
        upper = list(continuous = wrap("cor", size=2))) +
  theme_grey(base_size=8)
