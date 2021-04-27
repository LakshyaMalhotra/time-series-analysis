#------
(co2.linear.model = lm(co2~time(co2)))
plot(co2, main='Atmospheric CO2 concentration with fitted line')
abline(co2.linear.model)

#------
# Analysis of errors
co2.residuals = resid(co2.linear.model)
hist(co2.residuals, main='Histogram of residuals')
# checking of normality when the data points are quite few and 
# hence histogram is not an option; quantile-quantile plot
qqnorm(co2.residuals)
qqline(co2.residuals)
# time plot of the residuals
plot(co2.residuals~time(co2))
plot(co2.residuals~time(co2), xlim=c(1981, 1986), main='Zoomed in residuals')

#------
# Some inferential statistics
plot(extra~group, data=sleep, main='Extra sleep in Gossett data by group')
attach(sleep)
extra.1 = extra[group==1]
extra.2 = extra[group==2]
sleep
# testing the hypothesis
t.test(extra.1, extra.2, paired=TRUE, alternative='two.sided')

#-----
# Correlation
pairs(trees, pch=21, bg=c('red'))
cov(trees)
cor(trees)
