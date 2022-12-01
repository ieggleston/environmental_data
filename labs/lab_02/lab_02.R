n = 12345
vec_1 = sample(12, n, replace = TRUE)
paste0("Sum of elements with value 3: ", sum(vec_1 ==3))

for (i in 1:10)
{
  print(paste("This is loop iteration: ", i))
}
n=1234
for (i in 1:n)
{
  print(i)
}

n=17
vec_1 = sample(10, n, replace=TRUE)
for (i in 1:n)
{
print(paste("## The element of vec_1 at index ", i, " is ", vec_1[i]))
}




create_and_print_vec = function(n, min = 100,  max = 2000)
{
  vec_1 = sample(min:max, n, replace=TRUE)
  for (i in 1:n)
  {
  print(paste("The element at index ", i, " is ", vec_1[i]))
  }
}
create_and_print_vec(10)

