#title: Data Chart
#description: Creation of shot charts using the data created in data preparation phase
#input(s): data created in Data Prep phase
#outputs():


library(readr)
library(ggplot2)
library(dplyr)
library(grid)
library(jpeg)


#PART 4
#sactter plot
thompson_scatterplot <- ggplot(data = thompson) + 
  geom_point(aes(x=x, y=y, color = shot_made_flag))

#court image (background) 
court_file <- "./images/nba-court.jpg" 

#create raster object 
court_image <- rasterGrob(readJPEG(court_file), 
                          width = unit(1,"npc"),
                          height = unit(1,"npc"))

#shot chart with court background 
thompson_shot_chart <- ggplot(data = thompson) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x,y = y, color = shot_made_flag)) + 
  ylim(-50,420) + 
  ggtitle("Shot Chart: Klay Thompson (2016 Season)") + 
  theme_minimal()

durant_shot_chart <- ggplot(data = durant) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x,y = y, color = shot_made_flag)) + 
  ylim(-50,420) + 
  ggtitle("Shot Chart: Kevin Durat (2016 Season)") + 
  theme_minimal()

green_shot_chart <- ggplot(data = green) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x,y = y, color = shot_made_flag)) + 
  ylim(-50,420) + 
  ggtitle("Shot Chart: Draymond Green (2016 Season)") + 
  theme_minimal()

curry_shot_chart <- ggplot(data = curry) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x,y = y, color = shot_made_flag)) + 
  ylim(-50,420) + 
  ggtitle("Shot Chart: Stephen Curry (2016 Season)") + 
  theme_minimal()

iguodala_shot_chart <- ggplot(data = iguodala) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x,y = y, color = shot_made_flag)) + 
  ylim(-50,420) + 
  ggtitle("Shot Chart: Andre Iguodala (2016 Season)") + 
  theme_minimal()

#PART 4.1
pdf(file = "./images/andre-iguodala-shot-chart.pdf", 6.5, 5)
iguodala_shot_chart
dev.off()

pdf(file = "./images/draymond-green-shot-chart.pdf", 6.5, 5)
green_shot_chart
dev.off()

pdf(file = "./images/kevin-durant-shot-chart.pdf", 6.5, 5)
durant_shot_chart
dev.off()

pdf(file = "./images/klay-thompson-shot-chart.pdf", 6.5, 5)
thompson_shot_chart
dev.off()

pdf(file = "./images/stephen-curry-shot-chart.pdf", 6.5, 5)
curry_shot_chart
dev.off()

gsw_shot_chart <- ggplot(data = shots_data) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50,420) + 
  theme_minimal() +
  facet_wrap(~name)
ggsave(file = "./images/gsw-shot-charts.pdf", 
       width = 8, height = 7)


#For Part 7.2
mutate(shots_data, shots_minutes = (shots_data$period*12) - shots_data$minutes_remaining)

