install.packages("foreign")

library(foreign)
library(dplyr)
library(ggplot2)
library(readxl)

raw_welfare <- read.spss(file="Koweps_hpc10_2015_beta1.sav", to.data.frame = T)
welfare<-raw_welfare

welfare <- rename(welfare,
                  birth = h10_g4,
                  education = p1007_3aq1,
                  sex = h10_g3,
                  marriage = h10_g10)

welfare

welfare$age <- 2019 - welfare$birth + 1
summary(welfare$age)

welfare <- welfare %>%
  mutate(ageg = ifelse(30<=age<40,"30",
                       ifelse(40<=age<50,"40",
                              ifelse(50<=age<60,"50","60"))))

table(welfare$ageg)
