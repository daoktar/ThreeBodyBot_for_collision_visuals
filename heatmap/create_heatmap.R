library("ggplot2")
library(dplyr)

data1 <- read.csv("separatedData.csv")

m1=84.2 
m2=26.9 
m3=58.0 # (solar masses)
v1x=-1.673 
v1y=-4.038
v2x=-4.276
v2y=6.851
v3x=2.399
v3y=0.942 #(km/s)
#x1=[-60 to 60] y1=[-60 to 60] 
x2=8 
y2=-13 
x3=19 
y3=4 #(AU from center)

data1_fixed <- data1 %>%
  mutate(
    timeToCrash = ifelse(timeToCrash == -30, 65, timeToCrash)
  )

#data1_fixed <- data1_fixed %>% sample_n(10000)

ggplot(data1_fixed, aes(xPos, yPos, fill= timeToCrash)) + 
  geom_tile() + 
  labs(x="m1 Starting x Position",
       y ="m1 Starting y Position", fill = "Time to Collision") +
  coord_cartesian(xlim = c(-60, 60), clip="off") +
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
                       space = "Lab") +
  geom_segment(aes(x = x2, y = y2, xend = x2 + v2x, yend = y2 + v2y),
               color = "white",
               arrow = arrow(length = unit(0.2, "cm"))) +
  geom_point(aes(x = x2, y = y2),
             size=1,
             color = "white") +
  annotate("text", x=x2, y=y2 - 3, label= "m2", color="white") +
  geom_segment(aes(x = x3, y = y3, xend = x3 + v3x, yend = y3 + v3y),
               color = "white",
               arrow = arrow(length = unit(0.2, "cm"))) + 
  geom_point(aes(x = x3, y = y3),
             size=1,
             color = "white") +
  annotate("text", x=x3, y=y3 + 2, label= "m3", color="white") +
  geom_segment(aes(x = 90, y = 40, xend = 90 + v1x, yend = 40 + v1y),
               color = "black",
               arrow = arrow(length = unit(0.2, "cm"))) +
  geom_point(aes(x = 90, y = 40),
             size=1,
             color = "black") +
  annotate("text", x=90, y=40 + 2, label= "m1", color="black")

ggsave(path = "", filename = "rheatmap.png", width = 9, height = 8, device='png', dpi=350)

