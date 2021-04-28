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
# - Weak Stationary time-series means no systematic change in the mean, i.e. No trend 
# - No systematic change in the variation
# - No periodic fluctuation

#-----
# ## Autocovariance function, gamma(s, t):
# (mu_s = moving average till time 's', mu_t = moving average till time 't');
# - gamma(s, t) = Cov(Xs, Xt) = E[(Xs - mu_s)(Xt - mu_t)]
# - gamma(t, t) = Var(Xt) = sigma_t^2
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
