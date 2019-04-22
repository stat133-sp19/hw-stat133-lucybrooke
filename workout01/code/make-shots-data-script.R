
col_types = c('character', 'character', 'double', 'double', 'double', 'double', 'factor', 'factor', 'character', 'integer', 'character', 'integer', 'integer')

a_iguodala <- read.csv("./data/andre-iguodala.csv", header = TRUE, colClasses = col_types)
   
d_green <- read.csv("./data/draymond-green.csv", header = TRUE, colClasses = col_types)

k_durant <- read.csv("./data/kevin-durant.csv", header = TRUE, colClasses = col_types)

kl_thompson <- read.csv("./data/klay-thompson.csv", header = TRUE, colClasses = col_types)

s_curry <- read.csv("./data/stephen-curry.csv", header = TRUE, colClasses = col_types)
