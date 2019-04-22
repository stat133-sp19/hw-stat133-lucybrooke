# Title: GSW Data Preparation
# Description: Contains the code for the preparation of raw data for project workout01: GSW Shot Charts
# Input: five .csv files containing raw data concerning five players for the Golden State Warriors
# Output: csv data file shots-data.csv containing necessary variables for visualization

library('rlang')
library('dplyr')
library('tibble')

# importing raw data 
col_types = c('character', 'character', 'double', 'double', 'double', 'double', 'character', 
              'factor', 'character', 'integer', 'character', 'integer', 'integer')

a_iguodala <- read.csv("./data/andre-iguodala.csv", header = TRUE, colClasses = col_types)
   
d_green <- read.csv("./data/draymond-green.csv", header = TRUE, colClasses = col_types)

k_durant <- read.csv("./data/kevin-durant.csv", header = TRUE, colClasses = col_types)

kl_thompson <- read.csv("./data/klay-thompson.csv", header = TRUE, colClasses = col_types)

s_curry <- read.csv("./data/stephen-curry.csv", header = TRUE, colClasses = col_types)

a_iguodala <- add_column(a_iguodala, .before = 'team_name', name = 'Andre Iguodala')

head(a_iguodala)

type_of(a_iguodala$shot_made_flag)

d_green <- add_column(d_green, .before = 'team_name', name = 'Draymond Green')

k_durant <- add_column(k_durant, .before = 'team_name', name = 'Kevin Durant')

kl_thompson <- add_column(kl_thompson, .before = 'team_name', name = 'Klay Thompson')

s_curry <- add_column(s_curry, .before = 'team_name', name = 'Stephen Curry')

a_iguodala$shot_made_flag[a_iguodala$shot_made_flag == "n"] <- "shot_no"
a_iguodala$shot_made_flag[a_iguodala$shot_made_flag == "y"] <- "shot_yes"

head(a_iguodala)

d_green$shot_made_flag[d_green$shot_made_flag == "n"] <- "shot_no"
d_green$shot_made_flag[d_green$shot_made_flag == "y"] <- "shot_yes"

head(d_green)

k_durant$shot_made_flag[k_durant$shot_made_flag == "n"] <- "shot_no"
k_durant$shot_made_flag[k_durant$shot_made_flag == "y"] <- "shot_yes"

head(k_durant)

kl_thompson$shot_made_flag[kl_thompson$shot_made_flag == "n"] <- "shot_no"
kl_thompson$shot_made_flag[kl_thompson$shot_made_flag == "y"] <- "shot_yes"

head(kl_thompson)

s_curry$shot_made_flag[s_curry$shot_made_flag == "n"] <- "shot_no"
s_curry$shot_made_flag[s_curry$shot_made_flag == "y"] <- "shot_yes"

head(s_curry)

a_iguodala <- mutate(a_iguodala, minute = (a_iguodala$period*12) - (a_iguodala$minutes_remaining))

d_green <- mutate(d_green, minute = (d_green$period*12) - (d_green$minutes_remaining))

k_durant <- mutate(k_durant, minute = (k_durant$period*12) - (k_durant$minutes_remaining))

kl_thompson <- mutate(kl_thompson, minute = (kl_thompson$period*12) - (kl_thompson$minutes_remaining))

s_curry <- mutate(s_curry, minute = (s_curry$period*12) - (s_curry$minutes_remaining))

sink("./output/andre-iguodala-summary.txt")
summary(a_iguodala)
sink()

sink("./output/draymond-green-summary.txt")
summary(d_green)
sink()

sink("./output/kevin-durant-summary.txt")
summary(k_durant)
sink()

sink("./output/klay-thompson-summary.txt")
summary(kl_thompson)
sink()

sink("./output/stephen-curry-summary.txt")
summary(s_curry)
sink()

shots_data <- rbind(a_iguodala, d_green, k_durant, kl_thompson, s_curry)

write.csv(shots_data, file = "./data/shots-data.csv")


sink("./data/shots-data-summary.txt")
summary(shots_data)
sink()


