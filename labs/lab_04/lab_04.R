require(here)

norm_mean = 10.4
norm_sd = 2.4
norm_17 = rnorm(17, mean = norm_mean, sd = norm_sd)
norm_30 = rnorm(30, mean = norm_mean, sd = norm_sd)
norm_300 = rnorm(300, mean = norm_mean, sd = norm_sd)
norm_3000 = rnorm(3000, mean = norm_mean, sd = norm_sd)
?png
png(
  filename = here("lab_04_hist_01.png"),
  width = 1600, height = 1500,
  res=180
)
par(mfrow = c(2,2))
hist(norm_17, main = "Histogram for 17 data points")
hist(norm_30, main = "Histogram for 30 data points")
hist(norm_300, main = "Histogram for 300 data points")
hist(norm_3000, main = "Histogram for 3000 data points")
dev.off()

par(mfrow = c(1,1))
x = seq(0, 20, length.out = 1000)
y = dnorm(x, mean = 10.4, sd = 2.4)

svg(filename = "norm_1.svg",
    width = 60, height = 50)
plot(x, y, main = "Normal PDF: mean=10.4, SD=2.4", type = "l", xlim = c(0, 20))
abline(h = 0)
dev.off()

png(filename = here("lab_04_multiplot.png"),
    width = 1600, height = 1500
    )

par(mfrow = c(2,2))

x_random_1 = runif(n = 20, min = 1, max = 100)
y_random_1 = rnorm(n = 20, mean = 5, sd = 2)
dat_random_1 = data.frame(x = x_random_1, y = y_random_1)
plot(y ~ x, data = dat_random_1, pch = 5, main = "Scatterplot Random Data.Frame",
     xlab = "dat_random_1", ylab = "Frequency", col = "purple")

dat_random_2 = runif(n = 50, min = 1, max = 500)
hist(dat_random_2, main = "Histogram Random Data.Frame",
     ylab = "Frequency", col = "steelblue")

x_random_3 = runif(n = 200, min = 1, max = 1500)
y_random_3 = rnorm(n = 200, mean = 800, sd = 200)
boxplot(x_random_3, y_random_3, main = "Boxplot Random Data.Frame",
        xlab = "dat_random_3", ylab = "Frequency", col = "green")


x_random_4 = runif(n = 2000, min = 1, max = 100)
y_random_4 = rnorm(n = 2000, mean = 50, sd = 5)
dat_random_4 = data.frame(x = x_random_4, y = y_random_4)
plot(y ~ x, data = dat_random_4, pch = 8, main = "Scatterplot 2 Random Data.Frame",
     xlab = "dat_random_4", ylab = "Frequency", col = "magenta")

dev.off()

line_point_slope = function(x, x1, y1, slope)
{
  get_y_intercept = 
    function(x1, y1, slope) 
      return(-(x1 * slope) + y1)
  
  linear = 
    function(x, yint, slope) 
      return(yint + x * slope)
  
  return(linear(x, get_y_intercept(x1, y1, slope), slope))
}

png(filename = here("lab_04_linear_function.png"),
    width = 1600, height = 1500
)

x_random_4 = runif(n = 2000, min = 1, max = 100)
y_random_4 = rnorm(n = 2000, mean = 50, sd = 5)
dat_random_4 = data.frame(x = x_random_4, y = y_random_4)
plot(y ~ x, data = dat_random_4, pch = 8, main = "Scatterplot with Linear Deterministic Function",
     xlab = "dat_random_4", ylab = "Frequency", col = "magenta")
curve(line_point_slope(x, x1 = 0, y1= 50, slope = 0.001), add = TRUE)
dev.off()

# Calculates the value of y for a linear function, given the coordinates
# of a known point (x1, y1) and the slope of the line.
line_point_slope = function(x, x1, y1, slope)
{
  get_y_intercept = 
    function(x1, y1, slope) 
      return(-(x1 * slope) + y1)
  
  linear = 
    function(x, yint, slope) 
      return(yint + x * slope)
  
  return(linear(x, get_y_intercept(x1, y1, slope), slope))
}

set.seed(123)
n = 17
slope = 0.7
intcp = 0.2

guess_x = 6
guess_y = 4
guess_slope = 0.72

x = runif(n = n, min = 1, max = 10)
y = rnorm(n = n, mean = slope * x + intcp)

plot(x, y, pch = 16)
curve(line_point_slope(x, guess_x, guess_y, guess_slope), add = T)

set.seed(123)
n_pts = 10
x_min = 1
x_max = 10

# X values are uniformly distributed
x_random = runif(n = n_pts, min = x_min, max = x_max)

# Y values are normally-distributed.
# I used the default parameters for mean and sd.
y_random = rnorm(n = n_pts)

dat_random = data.frame(x = x_random, y = y_random)

guess_x = 3
guess_y = 1
guess_slope = -0.3

plot(y ~ x, data = dat_random, pch = 8)
curve(line_point_slope(x, guess_x, guess_y, guess_slope), add = T)

predicted_values = line_point_slope(dat_random$x, guess_x, guess_y, guess_slope)
dat_random$predicted_values = predicted_values

resids = dat_random$x - dat_random$predicted_values
dat_random$resids = resids


plot(dat_random$x, dat_random$resids, main = "Residual Scatterplot",
     xlab = "Observed Values", ylab = "Residuals", pch = 2)
hist(dat_random$resids, main = "Histogram of Model Residuals", xlab = "Residual Values")
