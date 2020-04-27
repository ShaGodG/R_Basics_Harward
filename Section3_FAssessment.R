library(dslabs)
data(heights)
options(digits = 3)    # report 3 significant digits for all answers

#1st question
#First, determine the average height in this dataset. 
#Then create a logical vector ind with the indices for those individuals who are above average height.
#How many individuals in the dataset are above average height?

mean(heights$height)
ind <- filter(heights, height > mean(height))
count(ind)

#2nd Question
#How many individuals in the dataset are above average height and are female?

ind <- filter(heights, height > mean(height) & sex == "Female")
count(ind)

#3rd Question
#If you use mean() on a logical (TRUE/FALSE) vector, it returns the proportion of observations that are TRUE.
#What proportion of individuals in the dataset are female?

male <- heights$height[heights$sex == "Male"]
female <- heights$height[heights$sex == "Female"]
nof <- length(female)
nof/count(heights)

#4A Question
#Determine the minimum height in the heights dataset.

min_height <- min(heights$height)

#4B Question
#Use the match() function to determine the index of the first individual with the minimum height.

match(min_height, heights$height)

#4C Question
#Subset the sex column of the dataset by the index in 4b to determine the individual’s sex.

heights$sex[1032]

#5A Question
#Determine the maximum height.

max_height <- max(heights$height)

#5B Question
#Which integer values are between the maximum and minimum heights? For example, if the minimum height is 10.2 and the maximum height is 20.8, your answer should be x <- 11:20 to capture the integers in between those values. (If either the maximum or minimum height are integers, include those values too.)
#Write code to create a vector x that includes the integers between the minimum and maximum heights.

x <- 50:82

#5c Question
#How many of the integers in x are NOT heights in the dataset?

t <- x %in% heights$height
sum(!t)

#6A Question
#Using the heights dataset, create a new column of heights in centimeters named ht_cm. Recall that 1 inch =
#2.54 centimeters. Save the resulting dataset as heights2.

#What is the height in centimeters of the 18th individual (index 18)?

heights2 <- mutate(heights, ht_cm = height*2.54)
heights2$ht_cm[18]

#6B Question
#What is the mean height in centimeters?

mean(heights2$ht_cm)

#7A Question
#Create a data frame females by filtering the heights2 data to contain only female individuals.

#How many females are in the heights2 dataset?

no_of_female2 <- heights2$ht_cm[heights2$sex == "Female"]
length(no_of_female2)

#7B Question
#What is the mean height of the females in centimeters?

mean(no_of_female2)

#8 Question
library(dslabs)
data(olive)
head(olive)

#Plot the percent palmitic acid versus palmitoleic acid in a scatterplot. What relationship do you see?

plot(olive$palmitic/100,olive$palmitoleic)
ans <- c("There is a positive linear relationship between palmitic and palmitoleic.")

#9 Question
#Create a histogram of the percentage of eicosenoic acid in olive.
#Which of the following is true?

hist(olive$eicosenoic)
ans <- c("The most common value of eicosenoic acid is below 0.05%.")

#10 Question
#Make a boxplot of palmitic acid percentage in olive with separate distributions for each region.
#Which region has the highest median palmitic acid percentage?
#Which region has the most variable palmitic acid percentage?

boxplot(palmitic~region, data = olive)
ans1 <- c("Southern Italy")
ans2 <- c("Southern Italy")