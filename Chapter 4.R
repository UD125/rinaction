##Data Manipulation
# 1- Creating Leadership dataframe
manager <- c(1,2,3,4,5)
date <- c("10/24/08","10/28/08","10/1/08","10/12/08","5/1/09")
country <- c("US","US","UK","UK","UK")
gender <- c("M","F","F","M","F")
age <- c(32,45,25,39,99)
q1 <- c(5,3,3,3,2)
q2 <- c(4,5,5,3,2)
q3 <- c(5,2,5,4,1)
q4 <- c(5,5,5,NA,2)
q5 <- c(5,5,2,NA,1)
leadership <- data.frame(manager, date, country, gender, age,
                        q1, q2, q3, q4, q5, stringsAsFactors=FALSE)
leadership

#Partial List Of Issues
# The five ratings (q1 to q5) will need to be combined, yielding a single mean
# deferential score from each manager.
# ■ In surveys, respondents often skip questions. For example, the boss rating manager
# 4 skipped questions 4 and 5. We’ll need a method of handling incomplete
# data. We’ll also need to recode values like 99 for age to missing.
# ■ There may be hundreds of variables in a dataset, but we may only be interested
# in a few. To simplify matters, we’ll want to create a new dataset with only the variables
# of interest.
# ■ Past research suggests that leadership behavior may change as a function of the
# manager’s age. To examine this, we may want to recode the current values of age
# into a new categorical age grouping (for example, young, middle-aged, elder).
# ■ Leadership behavior may change over time. We might want to focus on deferential
# behavior during the recent global financial crisis. To do so, we may want to
# limit the study to data gathered during a specific period of time (say, January 1,
#                                                                2009 to December 31, 2009).

# 2- Creating New Variables
#Three methods used to Include New Variables in the Dataframe
#1st Method
mydata<-data.frame(x1 = c(2, 2, 6, 4),x2 = c(3, 4, 2, 8))
mydata$sumx <- mydata$x1 + mydata$x2
mydata$meanx <- (mydata$x1 + mydata$x2)/2
mydata

#2nd Method
attach(mydata)
mydata$sumx <- x1 + x2
mydata$meanx <- (x1 + x2)/2
detach(mydata)
mydata

#3rd Method
mydata <- transform(mydata,sumx = x1 + x2,meanx = (x1 + x2)/2)
mydata
#So, 3rd Method is the best (transform()function) As It 
#simplifies inclusion of as many new variables 
#as desired and saves the results to the Dataframe

leadership
# 3- Recoding Variables
attach(leadership)
## Error - leadership <- transform(leadership,leadership$agecat[leadership$age > 75 <- "Elder" ,
                        leadership$age >= 55 & leadership$age <= 75 <- "Middle Aged",
                        leadership$age < 55 <- "Young"])

detach(leadership)
leadership

leadership$age[leadership$age == 99] <- NA
is.na(leadership[,6:10])
is.na(leadership$age) ##is.na() for finding missing vlues
leadership$agecat[leadership$age > 75] <- "Elder"
leadership$agecat[leadership$age >= 55 & leadership$age <= 75] <- "Middle Aged"
leadership$agecat[leadership$age < 55] <- "Young"

#4 - changing the names of the variables
fix(leadership)
leadership

# Programmatically, the reshape package has a rename() function that’s useful for
# altering the names of variables. The format of the rename() function is
# rename(dataframe, c(oldname="newname", oldname="newname",…))

library(reshape)
install.packages(reshape) 
leadership <- rename(leadership,
                     c(manager="managerID", date="testDate"))

# 5- recoding missing values in the data otherwise the result willbe meaningless
leadership$age[leadership$age == 99] <- NA
#6- excluding missing values from the data
x <- c(1, 2, NA, 3)
y <- sum(x, na.rm=TRUE)
y
# When using functions with incomplete data, be sure to check how that function
# handles missing data by looking at its online help (for example, help(sum)).

# 7- using na.omit() to delete incomplete observations (row gets deleted)
leadership
newdata <- na.omit(leadership)
newdata

## Date values
# Dates are typically entered into R as character strings and then translated into date variables
# that are stored numerically. The function as.Date() is used to make this translation.
# The syntax is as.Date(x, "input_format") , where x is the character data and
# input_format gives the appropriate format for reading the date

##Date Formats
# %d day as number(01 - 31)
# %a Abbreviated weekday (Mon)
# %A Unabbreviated weekday (Monday)
# %m Month(00-12) 
# %b Abbreviated month (Jan)
# %B Unabbreviated month (January)
# %y 2 digit year (07)
# %Y 4 digiit year (2007)

# The default format for inputting dates is yyyy-mm-dd. The statement
# mydates <- as.Date(c("2007-06-22", "2004-02-13"))
# converts the character data to dates using this default format

# In contrast,
# strDates <- c("01/05/1965", "08/16/1975")
# dates <- as.Date(strDates, "%m/%d/%Y")
# reads the data using a mm/dd/yyyy format.

myformat <- "%m/%d/%y"
leadership$date <- as.Date(leadership$date, myformat)

Sys.Date()
date()
?sys.load.image()

# how to take out difference between two dates
startdate <- as.Date("2004-02-13")
enddate <- as.Date("2011-01-22")
days <- enddate - startdate
days

#use of difftime() to calculate time interval
today <- Sys.Date()
dob <- as.Date("05-08-1994")
difftime(today, dob, units="weeks")

#converting dates to character variables
strDates <- as.character(dates)

#lubricate package contains number of functions that simplify working with dates
#fCalander if u want to do complex calculations with the date

##Type conversions
#test
# is.numeric()
# is.character()
# is.matrix()
# is.vector()
# is.data.frame()
# is.factor()
# is.logical()
#  
# #Convert
# as.numeric()
# as.character()
# as.matrix()
# as.vector()
# as.data.frame()
# as.factor()
# as.logical()

# Functions of the form is.datatype()return TRUE or FALSE, whereas as.datatype()
# converts the argument to that type

# the as.datatype()
# will let you transform your data into the format required prior to analyses.

##Sorting Data
#Order() function
attach(leadership)
newdata1 <-leadership[order(gender, -age),]
newdata1
detach(leadership)

##Merging Datasets
#Adding columns
total <- merge(dataframeA, dataframeB, by="ID")
#merges dataframeA and dataframeB by ID.
total <- merge(dataframeA, dataframeB, by=c("ID","Country"))
#merges the two dataframes by (ID,country)

#If you’re joining two matrices or data frames horizontally and don’t
#need to specify a common key, you can use the cbind() function :
total <- cbind(A, B)
#This function will horizontally concatenate the objects A and B. For the function to work properly,
#each object has to have the same number of rows and be sorted in the same order.

#Adding rows
#To join two data frames (datasets) vertically, use the rbind() function :
total <- rbind(dataframeA, dataframeB)

# The two data frames must have the same variables, but they don’t have to be in the
# same order. If dataframeA has variables that dataframeB doesn’t, then before joining
# them do one of the following:
#   ■ Delete the extra variables in dataframeA
# ■ Create the additional variables in dataframeB and set them to NA (missing)
# Vertical concatenation is typically used to add observations to a data frame.

#Selecting observations or excluding is typically is key aspect of successful data preparation and analysis
newdata2 <- leadership[1:3,]
newdata2 <- leadership[which(leadership$gender=="M" &
                              leadership$age > 30),]
attach(leadership)
newdata2 <- leadership[which(gender=='M' & age > 30),]
newdata2
detach(leadership)
