my_number <- 5.2
my_string <- "five point two"
my_vec <- 1:5
my_list_1 <- list(my_number, my_string, my_vec)
names(my_list_1) <- c("two", "one", "three")
my_list_1[[1]]
my_list_1[[as.numeric("1")]]
my_list_1[["1"]]
my_list_1[["one"]]
my_list_1$one
my_list_1$"one"
my_list_1$1
my_list_1$"1"
