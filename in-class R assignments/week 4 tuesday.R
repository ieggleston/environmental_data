require(palmerpenguins)

pairs(penguins)
pairs(penguins[,c("bill_length_mm", "bill_depth_mm", "flipper_length_mm", "body_mass_g")])
require(here)
dat_hab = read.csv(
  here("data", "hab.sta.csv")
)
head(dat_hab)
dat_bird = read.csv(
  here("data", "bird.sta.csv")
)
head(dat_bird)

hist(dat_bird$RUGR, xlab = "Number of birds", breaks = 0:7 - 0.5)

head(dat_hab)
pairs(dat_hab[,c("lat", "long", "elev", "aspect", "s.id")])
