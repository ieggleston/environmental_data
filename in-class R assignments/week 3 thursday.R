
install.packages("here")
require("here")
here()
read.csv(here("data", "catrate.csv"))
dat_delomys = read.csv(here("data", "delomys.csv"))
read.csv(here("data","rope.csv"))
boxplot(body_mass, body_length, data=delomys)
boxplot(dat_delomys$body_mass, main="Ian's plot")

