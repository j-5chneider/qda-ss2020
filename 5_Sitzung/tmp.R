library(tidyverse)

freiheitsgrade <- 10

t1_data <- data.frame(x = rt(100000, df=freiheitsgrade))
# n_data <- data.frame(x = rnorm(100000))

ggplot(t1_data, aes(x=x)) + 
  geom_density(color = "red") + 
  # geom_density(aes(x=n_data$x), color = "blue") +
  scale_x_continuous(limits = c(-7,7))

s <- 1.5
mu <- 2

t2_data <- data.frame(x = rt(100000, df=freiheitsgrade)*s + mu)

ggplot(t1_data, aes(x=x)) + 
  geom_density(color = "red") + 
  geom_density(aes(x=t2_data$x), color = "blue") +
  scale_x_continuous(limits = c(-7,7))
