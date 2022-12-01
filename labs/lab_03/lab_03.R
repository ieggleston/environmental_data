install.packages("psych")
require(psych)
pairs.panels(iris)
names(iris)
pairs.panels(iris[, c("Sepal.Length", "Sepal.Width", "Petal.Length")])
install.packages("here")
require(here)
here()
getwd()
read.csv(here("data", "my_data.csv"))
require(here)
dat_bird = read.csv(
  here("data","bird.sta.csv")
)
head(dat_bird)
dat_habitat = read.csv(
  here("data","hab.sta.csv")
)
head(dat_habitat)

dat_all = merge(dat_bird, dat_habitat)
head(dat_all)
plot(ba.tot ~ elev, data = dat_all)

my_vec= sample(dat_all$CEWA)

cewa_present_absent= as.numeric(my_vec>0)
plot(x = dat_all$elev, y = cewa_present_absent)

# Function to calculate the logistic parameter a given the slope and midpoint
get_logistic_param_a = function(slope, midpoint)
{
  b = slope / 4
  return (-midpoint * (slope / 4))
}

# Function to calculate the logistic parameter b given the slope
get_logistic_param_b = function(slope)
{
  return (slope / 4)
}


# Calculate the value of the logistic function at x, given the parameters a and b.
logistic = function(x, a, b)
{
  val = exp(a + b * x)
  return(val / (1 + val))
}

# Calculate the value of the logistic function at x, given a slope and midpoint.
logistic_midpoint_slope = function(x, midpoint, slope)
{
  b = get_logistic_param_b(slope)
  a = get_logistic_param_a(slope, midpoint)
  return(logistic(x, a, b))
}

plot(x = dat_all$elev, y = cewa_present_absent)
curve(logistic_midpoint_slope(x, midpoint = 400, slope = -0.005), add = TRUE)

head(dat_all)
pairs.panels(dat_all[,c("slope", "aspect", "elev", "ba.tot")])

my_vec_PYOW = sample(dat_all$PYOW)
PYOW_present_absent = as.numeric(my_vec_PYOW > 0)
plot(x=dat_all$ba.snag, y=PYOW_present_absent, main = "Presense of Pygmy Owl", xlab = "Total Basal Area", ylab = "Pygmy Owl Presence or Absence")
curve(logistic_midpoint_slope(x, midpoint= 50, slope = -0.2), add = TRUE)

my_vec_MAMU = sample(dat_all$MAMU)
MAMU_present_absent = as.numeric(my_vec_MAMU > 0)
plot(x=dat_all$ba.hard, y=MAMU_present_absent, main = "Presence of Marbled Murrelet in a Hardwood Forest", xlab = "Hardwood Basal Area", ylab = "Marbled Murrelet Presence or Absence")
curve(logistic_midpoint_slope(x, midpoint= 25, slope = -0.3), add = TRUE)


my_vec_GRJA = sample(dat_all$GRJA)
sum(my_vec_GRJA)

GRJA_presence = as.numeric(sample(dat_all$GRJA) > 0)
sum(GRJA_presence)
