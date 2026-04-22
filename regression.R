data <- read.csv("Rape_Data_clusters.csv")

names(data)
str(data)
head(data)

data$CLUSTER <- as.factor(data$CLUSTER)

library(dplyr)

data_counts <- data %>%
  group_by(CLUSTER, BORO_NM, SEASON, TIME_OF_DAY) %>%
  summarise(count = n(), .groups = "drop")

head(data_counts)

model <- lm(count ~ CLUSTER + BORO_NM + SEASON + TIME_OF_DAY, data = data_counts)
summary(model)