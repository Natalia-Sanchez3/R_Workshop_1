install.packages("tidyverse")
install.packages("janitor")
library(tidyverse)
library(janitor)

#we are using Starwars data set to understand the coding

data <- view(starwars)

# to view top & buttom variables  we use head and tail function

head(data,10)

tail(data,20)

#piping function %>%

#count the species
data %>% count(species, sort = TRUE)
data %>% count(homeworld, sort = TRUE)

#Filtering

data_filter <-data %>% filter(homeworld=="Tatooine", eye_color=="blue", sex=="male")

#Select Function

data_1 <-data %>% select(name, height, mass, gender, homeworld, species, sex)%>%
  filter(species == "Human")%>%
  arrange(desc(height))

#Slice_max function to find highest numerical value

data_1 %>% slice_max(height, n=10)

data_1 %>% slice_min(height, n=8)

#mutate function  to add a column  within the data set

data <- data %>% 
  filter(!is.na(height))%>%
  filter(!is.na(mass))%>%
  mutate(avg_height = mean(height), total_mass = sum(mass))

#add to