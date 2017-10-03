data <- read.table("Homework_2_data.txt", header = FALSE, as.is =TRUE)
names(data) <- c("Minutes_spent","Number_of_copiers")
head(data)
lm1 <- lm(data$Minutes_spent ~ data$Number_of_copiers)
plot(data$Number_of_copiers,data$Minutes_spent,xlab="Number of copiers serviced per call",ylab="Minutes spent per copier")
abline(lm1$coefficients[1],lm1$coefficients[2])

MSE <- sum(lm1$residuals^2)/lm1$df.residual
mean_copiers = apply(data, 2, mean)[2]
Var_b1 <- MSE / sum((data$Number_of_copiers - mean_copiers)^2)
Std_b1 <- sqrt(Var_b1)
t_score <- qt(c(0.95),43)
lower_b1 <- lm1$coefficients[2] - t_score*Std_b1
upper_b1 <- lm1$coefficients[2] + t_score*Std_b1
names(lower_b1)="Lower b1 bound"
names(upper_b1)="Upper b1 bound"
lower_b1
upper_b1


t <- lm1$coefficients[2]/Std_b1
summary(lm1)$coefficients[2,4]

p_value <- 1-pt(t2,43)
