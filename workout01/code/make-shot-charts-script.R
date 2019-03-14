# Title: GSW Workout01 Shot Charts
# Description: contains code for the creation of charts mapping the shots of five GSW players
# Input: the data frame shots_data and jpeg/raster graphical object court_image 
# Output: Five shot charts as a PDF file, one for each player (dim: width = 6.5, height = 5 in); one facetted shot 
# chart as a PDF(dim: w = 8, h = 7); the same facetted chart in PNG format(dim: w = 8, h = 7)

library("jpeg")
library("grid")
library("ggplot2")
library("dplyr")

# court image (to be used as background of plot)
court_file <- "./images/nba-court.jpg"



# create raste object
court_image <- rasterGrob(
  readJPEG(court_file),
  width = unit(1, "npc"),
  height = unit(1, "npc"))


# andre iguodala shot chart
ai_shot_chart <- ggplot(data = a_iguodala) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag), size = 1.5) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Andre Iguodala (2016 season)') + 
  scale_color_manual(values = c("red", "blue")) +
  theme_minimal()
ai_shot_chart

# save ai_shot_chart as pdf and png
ggsave("andre-iguodala-shot-chart.pdf", width = 6.5, height = 5)
ggsave("andre-iguodala-shot-chart.png", width = 6.5, height = 5)

# draymond green shot chart
dg_shot_chart <- ggplot(data = d_green) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag), size = 1.5) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Draymond Green (2016 season)') + scale_color_manual(values = c("red", "blue"))
  theme_minimal()
dg_shot_chart

# save dg_shot_chart as pdf and png
ggsave("draymond-green-shot-chart.pdf", width = 6.5, height = 5)
ggsave("draymond-green-shot-chart.png", width = 6.5, height = 5)


# kevin durant shot chart
kd_shot_chart <- ggplot(data = k_durant) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag), size = 1.5) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Kevin Durant (2016 season)') + scale_color_manual(values = c("red", "blue"))
  theme_minimal()
kd_shot_chart

# save kd_shot_chart as pdf and png
ggsave("kevin-durant-shot-chart.pdf", width = 6.5, height = 5)
ggsave("kevin-durant-shot-chart.png", width = 6.5, height = 5)

# klay thompson shot chart
kt_shot_chart <- ggplot(data = kl_thompson) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag), size = 1.5) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Klay Thompson (2016 season)') + scale_color_manual(values = c("red", "blue"))
  theme_minimal()
kt_shot_chart

# save kt_shot_chart as pdf and png
ggsave("klay-thompson-shot-chart.pdf", width = 6.5, height = 5)
ggsave("klay-thompson-shot-chart.png", width = 6.5, height = 5)


# stephen curry shot chart and png
sc_shot_chart <- ggplot(data = s_curry) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag), size = 1.5) +
  ylim(-50, 420) + 
  ggtitle('Shot Chart: Stephen Curry (2016 season)') + scale_color_manual(values = c("red", "blue"))
  theme_minimal()
sc_shot_chart

# save sc_shot_chart as pdf and png
ggsave("stephen-curry-shot-chart.pdf", width = 6.5, height = 5)
ggsave("stephen-curry-shot-chart.png", width = 6.5, height = 5)

# facetted shot chart

gsw_shot_chart <- ggplot(data = shots_data) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag), size = 1.5) +
  ylim(-50, 420) + 
  facet_wrap(~name) +
  ggtitle('Shot Charts: GSW (2016 season)') + 
  scale_color_manual(labels = c("Missed", "Made"), values = c("red", "blue")) + 
  labs(color = "Shots") +
  theme_minimal()
  
gsw_shot_chart <- gsw_shot_chart + theme(plot.title = element_text(hjust = 0.5))

gsw_shot_chart

# save as PDF
ggsave("gsw-shot-charts.pdf", width = 8, height = 7)

# save as PNG
ggsave("gsw-shot-charts.png", width = 8, height = 7)



