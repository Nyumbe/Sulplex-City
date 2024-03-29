##### MEMO SCRIPT ASSIGNMENT 1 ##

library(ggplot2)
library(tidyverse)
library(dplyr)
library(readxl)

#set working directory
setwd("C:/Users/hp/Desktop/Data Science")

#Import Dataset
library(readxl)
dataset <- read_excel("Group Assignment_1.xlsx")
View(dataset)

####QUESTION 1: DESCRIPTIVE STATISTICS"
# Define dataset
#Define pops (origin), samples(varieties), observations (traits about varieties, 10 variables).

##Set research hypotheses and research questions
# Does performance of varieties vary in different districts? 
#Research goal: To determine The performance of varieties across districts 
#Performance is based on the 10 observations (frangrance to overall score)
#Focusing on overall score
#Compute descriptive statistics
summary(dataset)
sum1 <- summary(dataset$OVERALL)

#Calculate the mode of the dataset and "overall"
getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
} 
# Create the vector (v) with overall. 
v <- c(dataset$OVERALL)
# Calculate the mode using the user function. 
Mode_Overall <- getmode(v)

## Breaking down means, medians in to districts to answer the question.
##Transform the dataset by first combining observations in groupings of district (origin)
Ibanda <- dataset[dataset$ORIGIN == "Ibanda",]
View(Ibanda)

Mityana <- dataset[dataset$ORIGIN == "Mityana",]
View(Mityana)

Mukono <- dataset[dataset$ORIGIN == "Mukono",]
View(Mukono)
summary(Ibanda$OVERALL)
# Mean =7.59, Median = 7.50. 
# overall performance in Ibanda is positively skewed.
#You can plot the frequencies of "overall" performance in Ibanda
hist(Ibanda$OVERALL, main = "Ibanda overall variety performance", xlab = "Overall performance", ylab = NULL)
#The histogram is right-skewed.
summary(Mityana$OVERALL)
#Mean = 7.402, Median = 7.500. Negatively skewed
hist(Mityana$OVERALL, main = "Mityana overall variety performance", xlab = "Overall performance", ylab = NULL)
summary(Mukono$OVERALL)
#Median = 7.50, Mean = 7.524. Implies positive skewdness
hist(Mukono$OVERALL, main = "Mukono overall variety performance", xlab = "Overall performance", ylab = NULL)

##### QUESTION 2: RELATIONSHIP BETWEEN VARIABLES###
##Based on the research question posed, I will investigate the contribution of;
# Flavour, aroma, acidity etc to the overall performance across districts
#Looking at flavour and overall
ggplot(dataset, aes(x = dataset$"FLAVOR", y = dataset$"FLAVOR")) + 
  geom_point() + labs(title = "Effect of flavor on overall coffee performance", x = "Overall performance", y = "Flavor")
#Looking at effect of flavor on performance per district
ggplot(Ibanda, aes(x = Ibanda$"FLAVOR", y = Ibanda$"FLAVOR")) + 
  geom_point() + labs(title = "Effect of flavor on coffee performance in Ibanda", x = "Overall performance", y = "Flavor")

ggplot(Mityana, aes(x = Mityana$"FLAVOR", y = Mityana$"FLAVOR")) + 
  geom_point() + labs(title = "Effect of flavor on coffee performance in Mityana", x = "Overall performance", y = "Flavor")

ggplot(Mukono, aes(x = Mukono$"FLAVOR", y = Mukono$"FLAVOR")) + 
  geom_point() + labs(title = "Effect of flavor on coffee performance in Mukono", x = "Overall performance", y = "Flavor")



### QUESTION 3: PERFORMANCE BY VARIETY AND DISTRICT###
## Across districts
# Compute medians of districts to show performance.
#Medians are most suitable rather than the means which were skewed
Ibanda_mean <- mean(Ibanda$OVERALL)
Mityana_mean <- mean(Mityana$OVERALL)
Mukono_mean <- mean(Mukono$OVERALL)

Ibanda_median <- median(Ibanda$OVERALL)
Mityana_median <- median(Mityana$OVERALL)
Mukono_median <- median(Mukono$OVERALL)

##Combine the districts, means or medians
Districts <- c("Ibanda", "Mityana", "Mukono")
Means <- c(Ibanda_mean, Mityana_mean, Mukono_mean)
##OR
Median <- c(Ibanda_median, Mityana_median, Mukono_median)

#Make a dataframe of the districts and means
Districts_means <- data.frame(Districts,Means)

#OR #Make a dataframe of the districts and medians
Districts_medians <- data.frame(Districts,Median)

#Plot the result
ggplot(Districts_means, aes(Districts,Means,group=1)) +
  geom_line() + geom_point() + labs(title = "Mean overall performance of varieties across districts")

#OR Using median
ggplot(Districts_medians, aes(Districts, Median,group=1)) +
  geom_line() + geom_point() + labs(title = "Median overall performance of varieties across districts")

###Performance of each variety
## Transform the dataset to subselect varieties individually
KR3 <- dataset[dataset$VARIETY == "KR3",]
KR4 <- dataset[dataset$VARIETY == "KR4",]
KR5 <- dataset[dataset$VARIETY == "KR5",]
KR6 <- dataset[dataset$VARIETY == "KR6",]
KR7 <- dataset[dataset$VARIETY == "KR7",]

#Compute overall means of each variety
mean_KR3 <- mean(KR3$OVERALL)
mean_KR4 <- mean(KR4$OVERALL)
mean_KR5 <- mean(KR5$OVERALL)
mean_KR6 <- mean(KR6$OVERALL)
mean_KR7 <- mean(KR7$OVERALL)

#OR Compute overall medians of each variety
median_KR3 <- median(KR3$OVERALL)
median_KR4 <- median(KR4$OVERALL)
median_KR5 <- median(KR5$OVERALL)
median_KR6 <- median(KR6$OVERALL)
median_KR7 <- median(KR7$OVERALL)

##Combine the varieties, means or medians
Varieties <- c("KR3", "KR4", "KR5", "KR6", "KR7")
Variety_means <- c(mean_KR3,mean_KR4,mean_KR5,mean_KR6,mean_KR7)
Variety_median <- c(median_KR3, median_KR4, median_KR5, median_KR6, median_KR7)

#Create a dataframe of Varieties and Variety_means
Dataframe_1 <- data.frame(Varieties, Variety_means)

#OR #Create a datframe of Varieties and Variety_median
Dataframe_2 <- data.frame(Varieties, Variety_median)

##Plot the results
ggplot(Dataframe_1, aes(Varieties, Variety_means, group=1)) +
  geom_line() + geom_point() + labs (title = "Mean overall variety performance")

#### QUESTION 4: CENTRAL TENDENCY/DISTRIBUTION OF EACH VARIABLE.
## Using a boxplot
#Distribution of overall
boxplot(dataset$OVERALL, main = "OVERALL PERFORMANCE OF VARIETIES", ylab = "overall scores")

### QUESTION 5: NORMAL DISTRIBUTION TESTS
#Test the overall variable for normal distribution using the Shapiro-wilk test
#Null hypothesis based on research question: The overall performance of varieties across districts is normally distributed. p-value >= 0.05 
#Alternative hypothesis: Overall performance is not normally distributed across districts. p-value =<0.05 
shapiro.test(dataset$OVERALL)
#W = 0.95674, p-value = 0.01189

## Distribution can also be visualised using a  Q-Q plots (quantile-quantile plots). 
#Q-Q plots draw the correlation between a given sample and the normal distribution.
ggqqplot(dataset$OVERALL, ylab = "Overall scores",
         ggtheme = theme_minimal())
qqnorm(dataset$OVERALL)
qqline(dataset$OVERALL, col = "steelblue", lwd = 2)

# The data is not normally distributed, it’s recommended to use the non parametric one-sample Wilcoxon rank test.
#### WILCOXON ONE-SAMPLE TEST####
#The one-sample Wilcoxon signed rank test is a non-parametric 
#alternative to one-sample t-test when the data cannot be 
#assumed to be normally distributed. 
#Used to determine whether the median of the sample is equal to a known standard value (i.e. theoretical value).
#Looking at the article m =0.8
res <- wilcox.test(dataset$OVERALL, mu = 0.8)
res
