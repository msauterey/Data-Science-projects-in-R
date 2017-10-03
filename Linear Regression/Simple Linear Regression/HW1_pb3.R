data <- read.table("Data_HW1_Problem3.txt", header = FALSE, as.is =TRUE)
names(data) <- c("GPA","ACT")
head(data)
lm1 <- lm(data$GPA ~ data$ACT)
plot(data$ACT,data$GPA,xlab="ACT score",ylab="GPA score")
abline(lm1$coefficients[1],lm1$coefficients[2])
Y_30 = lm1$coefficients[1]+lm1$coefficients[2]*30
Y_30
Y_1 = lm1$coefficients[2]*1
Y_1
sum(lm1$residuals)
sigma2 <- sum(lm1$residuals^2)/lm1$df.residual
sigma2
sigma <- sqrt(sigma2)
sigma
