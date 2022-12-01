v1 = (-2:2)
print (v1)
v2 = (v1*3)
print(v2)
sum(v2)
vec_4 = (1:12)
mat_1 = matrix(vec_4, nrow=3, ncol=4, byrow=TRUE)
mat_1
vec_4 = (1:12)
mat_2 = matrix(vec_4, nrow=3, ncol=4, byrow=FALSE)
mat_2

num_1=5.2
char_1 = "five point two"
vec_1= (0:5)
my_list_1= list(num_1, char_1, vec_1)
names(my_list_1)= c("two", "one", "three")
my_list_1
my_list_1[3]
my_list_1["one"]

my_vec = rep(1:3,5)
my_vec
my_bool_vec=c(my_vec==3)
data.frame(my_vec, my_bool_vec)
my_vec[my_bool_vec]

