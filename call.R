library(Rcpp)
library(tidyverse)
library(colourlovers)
library(reshape2)

# Import C++ code
sourceCpp("src/abstractions_funs.cpp")
source("R/plot_physarium.R")

# Default aesthetics of the ggplot
opt <-  theme(panel.border = element_rect(color="black", fill = NA),
              legend.position = "none",
              axis.ticks       = element_blank(),
              panel.grid       = element_blank(),
              axis.title       = element_blank(),
              axis.text        = element_blank())


P <- plot_physarium(
  imageW = 300, # image width (pixels)
  imageH = 300, # image heigth (pixels)
  decayT = 0.1, # Trail-map chemoattractant diffusion decay factor
  FL =  22.5 * pi / 180, # FL sensor angle from forward position (degrees, 22.5 - 45)
  FR = -22.5 * pi / 180, # FR sensor angle from forward position (degrees, 22.5 - 45)
  RA =  45 * pi / 180, # Agent rotation angle (degrees)
  SO = 6, # Sensor offset distance (pixels)
  SS = 1, # Step size—how far agent moves per step (pixels) 
  depT = 30, # Chemoattractant deposition per step
  iters = 2000, # Number if iterations
  agents = 1000 # Number of agents
)

P