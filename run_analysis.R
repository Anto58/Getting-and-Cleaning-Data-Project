setwd("~/Desktop/Coursera/RProgramming/UCI HAR Dataset")
install.packages("reshape2")
library(reshape2)

#  Read in the variable names and activity labels
vars <- read.table("features.txt")
act.labels <- read.table("activity_labels.txt")

#  Read in the text files
x.test <- read.table("x_test.txt")
y.test <- read.table("y_test.txt")
subject.test <- read.table("subject_test.txt")
#  Bind together the results with the cbind function and assign names 
#      to the two columns not covered by features.txt
test.data <- cbind(x.test, y.test, subject.test)
names(test.data)[[ncol(test.data)-1]] <- "activity"
names(test.data)[[ncol(test.data)]] <- "subject"

#  Repeat for the train files
x.train <- read.table("x_train.txt")
y.train <- read.table("y_train.txt")
subject.train <- read.table("subject_train.txt")

train.data <- cbind(x.train, y.train, subject.train)
names(train.data)[[ncol(train.data)-1]] <- "activity"
names(train.data)[[ncol(train.data)]] <- "subject"

#  Bind the test and train datasets together using rbind
all.data <- rbind(test.data, train.data)

#  Find the location of the means and standard deviations of the measurements
#  Note that only choose variables with both a mean and standard deviation

locn.mean <- grep("mean\\(\\)", vars$V2)
locn.std <- grep("std\\(\\)", vars$V2)

#  Need to include subject and activity columns
sel.cols <- c(locn.mean,locn.std,ncol(train.data)-1,ncol(train.data))

subset.data <- all.data[,sel.cols]

# Include descriptive labels for activity
subset.data$activity <- factor(subset.data$activity,
                               levels=c(1,2,3,4,5,6),
                               labels = as.character(act.labels$V2))
#  Now set up the variable names

subset.vars <- c(locn.mean,locn.std)
vars1 <- as.character(vars[subset.vars,2])

#  And assign to the data frame

names(subset.data)[1:length(subset.vars)]<- vars1

#  That completes step 4

#  Now calculate means for each activity and subject

subset.data.grp <- group_by(subset.data, subject, activity)
step5.data <- summarise_each(subset.data.grp, funs(mean))

#  Let's reshape the data to make it long form

step5.reshape <- melt(step5.data, id=c("subject", "activity"))
step5.reshape$vartype <- ifelse(grepl("mean",as.character(step5.reshape$variable))==TRUE,"mean", "st_dev")
step5.reshape$measure <- sapply(strsplit(as.character(step5.reshape$variable),"-"),"[[",1)
step5.reshape$dimension <- substr(as.character(step5.reshape$variable),
                                  nchar(as.character(step5.reshape$variable)),
                                  nchar(as.character(step5.reshape$variable))+1)
step5.reshape$dimension <- ifelse(step5.reshape$dimension==")","N", step5.reshape$dimension)
step5.reshape <- select(step5.reshape, -variable)

#  Write out the table

write.table(step5.reshape,"Step5_Data.txt", row.names=FALSE)
