library("ggplot2")
library(dplyr)

data1 <- read.csv("separatedData.csv")

data1_fixed <- data1 %>%
  mutate(timeToCrash = ifelse(timeToCrash == -30, 65, timeToCrash))

ggplot(data1_fixed, aes(xPos, yPos, fill= timeToCrash)) + 
  geom_tile() + 
  scale_fill_gradientn(colors = c("black", 
                                  "#2b5884", #Note, I wanted the black and white sections to be small at the ends, so I had to add a bunch of middle points to make that work
                                  "#305d8a",
                                  "#366390",
                                  "#3b6895",
                                  "#3f6d9b",
                                  "#4372a0",
                                  "#4877a5",
                                  "#4b7caa",
                                  "#5182af",
                                  "#5788b4",
                                  "#5c8db8",
                                  "#6293bd",
                                  "#6899c2",
                                  "#6d9ec6",
                                  "#73a4cb",
                                  "#78a9cf",
                                  "#7fafd4",
                                  "#85b5d8",
                                  "#8cbbdd",
                                  "#92c0e0",
                                  "#9bc7e5",
                                  "#a2cde8",
                                  "#aad3ec",
                                  "#b3d9ef",
                                  "#BCE4D8",
                                  "white"),
                        space = "Lab")

ggsave(path = "C:\\code\\Julia\\3-body\\tmpPlots\\", filename = "rheatmap.png", width = 9, height = 8, device='png', dpi=350)

