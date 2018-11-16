library(hflights)
library(shiny)
library(dplyr)
library(ggplot2)
library(plotly)
library(lubridate)

# Importing the dataset
olympics <- read.csv(file = "athlete_events.csv", header = TRUE, sep = ",")

# Replacing Medal NA's with "None"
levels <- levels(olympics$Medal)
levels[length(levels) + 1] <- "None"
olympics$Medal <- factor(olympics$Medal, levels = levels)
olympics$Medal[is.na(olympics$Medal)] <- "None"

# Getting # of medals by country

medals_by_demographic <- olympics %>%
  filter(Medal=="Gold" | Medal=="Silver" | Medal=="Bronze") %>%
  select(Name, Year, Event, Sex, Age, Medal)