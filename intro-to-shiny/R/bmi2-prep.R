n <- 200

bmi2 <- data.frame(id = numeric(n),
                   age = numeric(n),
                   bmi = numeric(n),
                   sex = character(n),
                   diet = character(n),
                   status = character(n)
                   )

for (x in 1:n) {
  bmi2$id[x] <- x
}

bmi2$age <- round(runif(n,18,80),1)
bmi2$bmi<- round(runif(n,20,35),1)
bmi2$sex <- sample(c("Male","Female"), n, replace = TRUE)
bmi2$diet <- sample(c("Good", "Moderate","Poor"), n, replace = TRUE)
bmi2$status <- sample(c("Healthy","Unhealthy"), n, replace = TRUE)


for (x in 1:n) {
   if (bmi2$bmi[x]<29) {
    bmi2$sex[x]  <- "Male"
   } 
  
  
  if (bmi2$bmi[x]>33) {
    bmi2$diet[x]  <- "Poor"
  }
}

save(bmi2,file="./intro-to-shiny/data/bmi2.RData")
