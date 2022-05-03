# Project: Pollen columns and a wax canopy in a first nest description of Bombus (Cullumanobombus) morrisoni (Apidae)
# R code for simple analysis of cocoon volumes from expired B. morrisoni nest

# load library
library(dplyr)

# data
df <- read.csv("morrisoni_cells_v2.csv", header = TRUE)
attach(df)

# test
t.test(df$Water.weight.for.volume..g.~df$Caste, var.equal = TRUE) # t = 17.247, df = 38.809, p-value < 2.2e-16
var.test(df$Water.weight.for.volume..g.~df$Caste) # t = 17.247, df = 38.809, p-value < 2.2e-16

# visualization
boxplot(df$Water.weight.for.volume..g.~df$Caste)

# data summaries
mtcars %>%
  group_by(cyl) %>%
  summarise(mean = mean(disp), n = n())

df %>%
  group_by(Caste) %>%
  dplyr::summarise(mean = mean(Water.weight.for.volume..g.), n = n(), sd = sd(Water.weight.for.volume..g.),
                   max.v = max(Water.weight.for.volume..g.), min.v = min(Water.weight.for.volume..g.),
                   median = median(Water.weight.for.volume..g.), se = sd(Water.weight.for.volume..g.)/sqrt(n()))
