
## while loop
### numeric vector
u <- c(2, 4, 6, 8, 10)
i <- 1 
while (i <= length(u)) {
  print(u[i])
  i <- i +1
  
}

### factorial
n <- 7
fac <- 1
i <- 1
while (i <= n) {
  fac = fac * i
  i = i + 1
}
print(fac)

j <- 1 
while (j < 6) {
  print("I am playing football in the field")
  j <- j + 1
  
}

m <- 1
while (m <= 11) {
  print(paste0("Iteration to-", m))
  m <- m + 1
  
}

### data frame
mydf <- data.frame(x = c(1, 2, 3), y = c(4, 5, 6))
i <- 1
while (i <= nrow(mydf)) {
  print(mydf[i, ])
  i <- i + 1
  
}

## break
i <- 1
while (i < 19) {
  print(i)
  i <- i + 1
  if(i == 11){
    break
  }
  
}

## next
r <- 0
while (r < 19) {
  r <- r + 1
  if(r == 11){
    next
  
}
print(r)
}





