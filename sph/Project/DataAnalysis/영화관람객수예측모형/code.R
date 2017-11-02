library(leaps)
library('ISLR')

hist(data$total, col='blue')
sd(data$total)

set.seed(12345)

data<-read.csv('data01.csv',h=T)
data<-data[,-1]
str(data)

##Cross-validation K=10
K <- 10
folds <- sample(1:K, nrow(data), replace=TRUE)
cv.errors <- matrix(NA , K, 16)
cv.errors <- matrix(NA , K, 16)
colnames(cv.errors) <- paste(1:16)
for (i in 1:K) {
	fit <- regsubsets(total ~ ., data=data[folds!=i,],nvmax=16)
	a<-summary(fit)
	for (j in 1:16) {
		coef<-coef(fit,j)
		test.mat<-model.matrix(total~.,data=data[folds==i,])
		pred <- test.mat[, names(coef)] %*% coef
		cv.errors[i,j] <- mean((data[folds==i,1] - pred)^2)
	}
}


model.number<-which.min(apply(cv.errors,2,mean))
coef(fit,7)
##test data
test.data<-read.csv('testdata.csv',h=T)
test.data<-model.matrix(~.,data=test.data)
rownames(test.data)<-c('킹스맨','남한산성','넛잡2')
##전체 data set으로 모수추정
fit <- regsubsets(total ~ ., data=data,nvmax=17)
a<-summary(fit)
coef<-coef(fit,model.number)

## 예측
pred <- test.data%*% coef
rownames(pred)<-c('킹스맨','남한산성','넛잡2')
pred

