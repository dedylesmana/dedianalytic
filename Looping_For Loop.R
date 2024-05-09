
salut
print("salut")
print("salut")
print("salut")
print("salut")
print("salut")
print("salut")
print("salut")
print("salut")

## looping - for loop
for (i in 1:11) {
  print(i)
}

score_value <- c(75, 65, 80, 85, 90)
for (x in score_value) {
  print(x)
}

## addition & multiplication
for (num in c(4,8,12,16)) {
  print(num + 4)
  
}

value1 <- c(1,3,7,9,11)
value2 <- numeric()
for (num in value1) {
  value2 <- c(value2, num * 5)
  
}
print(value2)

my_list <- list(colours = c("akai", "shiroi", "midori"))
for (i in my_list) {
  print(i)
  
}

for (namae in c("park", "ima", "anata", "mae")) {
  print(paste("happy birthday,", namae))
  
}

subject <- c("Watashi WA", "Kare Wa", "Karera WA")
profession <- c("Daigakusei", "Kenchikuka", "Sakkaa Senshu")
for (x in subject) {
  for (y in profession) {
    print(paste(x, y))
    
  }
  
}

my_df <- data.frame(
  namae = c("park", "ima", "anata", "mae"),
  age = c(21, 22, 23, 24),
  gender = c("female", "female", "male", "female")
)
for (i in 1:nrow(my_df)) {
  cat("namae:", my_df$namae[i], ", age:", my_df$age[i], ", gender:",
      my_df$gender[i], "\n")
  
}

## break - for loop
score_value <- c(75, 65, 80, 85, 90)
for (x in score_value) {
  if(x > 80){
    break
  }
  print(x)
}

## nested loop
for (m in 1:7) {
  for (n in 5) {
    value3 <- m * n
    cat(value3, "\t")
  }
  cat("\n")
}

## next - for loop
kudamono <- c("ringo", "banana", "kokonatsu", "mikan", "suika")
for (i in kudamono) {
  if(nchar(i) > 5) {
  next
}
print(i)
}





