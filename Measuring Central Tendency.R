############## MEASURES OF CENTRAL TENDENCY AND DISPERSION ############
### 1. Described by Mode, Median and Mean
## 2. A form of surmising the data
## 3. Statistical tests for comparing means (central tendency) (T-test, Wilcoxon, ANOVA and Kruskal-Wallis test)
setwd()
library(tidyverse)
library(tidyr)
library(dplyr)
library(nycflights13)
ggplot2::diamonds
### Calculating mean and weighted mean
# Consider the following example of a list of temperatures:
Temperature <- c(24, 26, 34, 27, 37, 22)
mean <- mean(Temperature)
# The above gives the arithmetic mean
#However, if we have class intervals of these temperatures e.g.(<20, 20-25, 25-30, 30-35, 35-40),
# And the frequencies of the temperatures, (Absolute frequencies: 0, 2, 2, 1, 1) and relative frequencies (0/6, 2/6, 2/6, 1/6, 1/6)
# The R function for calculating weighted means requires the middle values of the class intervals and relative frequencies
weightmean <- weighted.mean(c(22.5,27.5,32.5, 37.5),c(2/6, 2/6, 1/6, 1/6))

## Calculating Median ###
# Divides the observations into two equal parts such that at least 50% of the values >= to the median and 50% =< median
median <-median(Temperature)

#Comparing mean and median
# If mean = median, then we have normal distribution of data
?diamonds
#Calculating the mean and median of the variable "price" in the diamonds dataset
mean(diamonds$price)
median(diamonds$price)
# This can be recalculated removing any missing data
mean(diamonds$price, na.rm = TRUE)
median(diamonds$price, na.rm = TRUE)
# The results show that the mean > that median (they differ), showed skewdness in the data
#Therefore, you'd have to use the median and not the mean as it's sensitive to outliers

## 2. SURMISING THE DATA

################### 3. STATISTICALLY TESTING MEANS  ##############
#####3.1. Comparing one-sample mean to a standard known mean
###3.1.1 One-sample T-test (parametric)
#What is one-sample t-test?
# Research questions and statistical hypotheses
# Formula of one-sample t-test
# Visualize data and compute one-sample t-test in R
#R function to compute one-sample t-test
# Visualize data using box plots
###Preliminary test to check one-sample t-test assumptions
###Compute one-sample t-test
###Interpretation of the result
install.packages("ggpubr")
library(ggpubr)