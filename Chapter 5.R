##Advanced Data Management
#1 - A data management challenge
#2 - Numerical and Character Functions
#2a) - Mathematical Functions

abs(-4) #abs(x) absolute
sqrt(25) #sqrt(x) square root
ceiling(3.475) #ceiling(x) smallest integer not less then x
floor(3.475) #floor(x) largest integer not greater then x
trunc(5.99) #trunc(x) Integer formed by truncating values in x toward 0
round(3.475,digits = 2) #round(x,digits=n) Round x to the specified number of decimal places
signif(3.475,digits = 2) #signif(x,digits=n) Round x to the specified number of significant digits
cos(2)
sin(2)
tan(2) #Cosine, sine, and tangent
#acos(x) , asin(x) , atan(x) #Arc-cosine, arc-sine, and arc-tangent
#cosh(x) , sinh(x) , tanh(x) #Hyperbolic cosine, sine, and tangent
#acosh(x) , asinh(x) , atanh(x) #Hyperbolic arc-cosine, arc-sine, and arc-tangent

acos(-0.416)
sinh(2)
asinh(3.627)

log(10)
log10(10) #Logarithm of x to the base n
#For convenience
#log(x) is the natural logarithm.
#log10(x) is the common logarithm

exp(2.3026) #exp(x) Exponential function

#Mathematical functions will also be used as components in formulas, in plotting
#functions (for example, x versus sin(x)) and in formatting numerical values
#prior to printing.
#The examples in table 5.2 apply mathematical functions to scalars (individual
                                                                  # numbers). When these functions are applied to numeric vectors, matrices, or data
#frames, they operate on each individual value. For example, sqrt(c(4, 16, 25))

#2b) - Statistics Function
#y <- mean(x) provides the arithmetic mean of the elements in object x,
#z <- mean(x, trim = 0.05, na.rm=TRUE)
#provides the trimmed mean, dropping the highest and lowest 5 percent of scores and
#any missing values.

#mean(x) Mean
#median(x) Median
#sd(x) Standard deviation
#var(x) Variance
#mad(x) Median Absolute Deviation
#quantile(x, probs) 
#Quantiles where x is the numeric vector where quantiles are desired
##and probs is a numeric vector with probabilities in [0,1].
## 30th and 84th percentiles of x 
##y <- quantile(x, c(.3,.84))
#range(x) Range
#sum(x)
#diff(x,lag=n) 
mean(c(1,2,3,4))
median(c(1,2,3,4))
sd(c(1,2,3,4))
var(c(1,2,3,4))
mad(c(1,2,3,4))

