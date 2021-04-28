#-----
# Some time plots
require(astsa)
help(astsa)
# Johnson & Johnson data
help(jj)
plot(jj, type='o', main='Johnson&Johnson quarterly earnings per share', 
     ylab='Earnings', xlab='Quarters')

# Flu data
help(flu)
plot(flu, main='Monthly Pneumonia and Influenza Deaths in US', 
     ylab='Number of deaths per 10000 people', xlab='Months')

# Global Temperature deviations data
help(globtemp)
plot(globtemp, main='Global mean land-ocean deviations from average temp of 1951-1980', 
     ylab='Temperature deviations', type='o', xlab='Years')

# Global Temperature deviations data (land only)
help(globtempl)
plot(globtempl, main='Global mean land deviations from average temp of 1951-1980', 
     ylab='Temperature deviations', type='o', xlab='Years')

# Variable star data
help(star)
plot(star, main='Magnitude of a start taken at midnight for 600 consecutive days', 
     ylab='Magnitude', xlab='Days')

#-----
# ## Intuition about stationarity
# - Weak Stationary time-series means no systematic change in the mean, i.e. no trend 
# - No systematic change in the variation
# - No periodic fluctuation

#-----
# ## Autocovariance function, gamma(s, t):
# (mu_s = moving average till time 's', mu_t = moving average till time 't');
# - gamma(s, t) = Cov(X_s, X_t) = E[(X_s - mu_s)(X_t - mu_t)]
# - gamma(t, t) = Var(X_t) = sigma_t^2
# - gamma_k = gamma(t, t+k) = c_k (autocovariance coefficients) (assuming weak stationarity)

#-----
# ## Autocovariance Coefficients
purely_random_process = ts(rnorm(100))
print(purely_random_process)
# print autocovariance 
(acf(purely_random_process, type='covariance'))

#-----
# ## Autocorrelation function (assume weak stationarity)
# - r_k = c_k / c0  (autocorrelation coefficient at lag 'k')
(acf(purely_random_process, main='Correlogram of a purely random process'))

#-----
# ## Random Walks
# - X_t = X_{t-1} + Z_t; Z_t ~ Normal(mu, sigma^2)
x = NULL
x[1] = 0
for(i in 2:1000){
        x[i] = x[i-1] + rnorm(1)
}
print(x)
plot(x, main='Simulated data for random walk (no time-series)')
# creating a time series from our random variable
random_walk = ts(x)
plot(random_walk, main='Random walk', ylab=' ', xlab='Days', col='blue', lwd=2)
# random walk is not a stationary time series, meaning there is no point to calculate 
# the autocorrelation of it (there would be very high correlation). Nevertheless, let's 
# calculate it and see what we find out.
acf(random_walk)
# let's see if the difference is stationary (it should be since it is just purely a random process)
plot(diff(random_walk))
# we can see by the help of `acf` function that it is just pure random noise with no correlation
acf(diff(random_walk))

#-----
# ## Introduction to moving averages
# Moving average model of order 2: MA(q=2), 'q' is the order of the moving average model
# MA(q) = X_t = Z_t + C_1 Z_{t-1} + ... + C_q Z_{t-q}
# Z_i are i.i.d & Z_i ~ Normal(mu, sigma^2)      
# [i.i.d: Independent and identically distributed random variable]

#-----
# ## Simulating MA(2) process
# X_t = Z_t + C_1 Z_1 + C_2 Z_2; C_i = constant coefficients representing the weights
# Z_i are i.i.d
# In this simulation we will use: C_1=0.7, C_2=0.2 and Z_t ~ Normal(0, 1)
# generate noise
noise = rnorm(10000)

# introduce a variable
ma_2 = NULL

# loop for generating MA(2) process
for(i in 3:10000){
        ma_2[i] = noise[i] + 0.7*noise[i-1] + 0.2*noise[i-2]
}

# shift data to left by 2 units
moving_average_process = ma_2[3:10000]

# put time series structure to the data
moving_average_process = ts(moving_average_process)

# partition output graphics as a multi frame of 2 rows and 1 column
par(mfrow=c(2, 1))

# plot the process and plot its ACF
plot(moving_average_process, main='Moving average process of order 2', ylab=' ', col='blue')
acf(moving_average_process, main='Correlogram of the moving average process')
