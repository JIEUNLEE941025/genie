job.type <- 'A'
if(job.type == 'B'){
  bonus <- 200
}else{
  bonus <- 100
}
print(bonus)

job.type <- 'B'
bonus <- 100

if(job.type == 'A'){
  bonus <- 200
}
print(bonus)



#다중 if -else문
score <- 85
if(score > 90){
  grade <- 'A'
}else if(score > 80){
  grade <- 'B'
}else if(score > 70){
  grade <- 'C'
}else {
  grade <- 'F'
}
print(grade)  

#논리 연산자(and,or 사용_)
a <- 10
b <- 20
if(a>5 & b>5){
  print(a+b)
}
if(a>5 | b>30){
  print(a*b)
}
# if else문
#ifelse(비교조건, 조건이 참일때 선택할 값, 조건이 거짓일때 선택할 값)
if(a>b){
  c <- a
}else{
  c <- b
}
print(c)

d <- ifelse(a>b,a,b)
print(d)

#for문
#for(반복변수 in 반복범위)
for (i in 1:10){
  print(i)
}

for (i in 1:10){
  cat("2*",i,"=",2*i,"\n")
}

#for문 안에 if문
for(i in 1:20){
  if(i%%2==0){
    print(i)
  }
}

#1~100까지 합 출력
sum <-  0
for(i in 1:100){
  sum <- sum+i
}
print(sum)

#iris에서 꽃잎의 길이에 따른 분류 작업
nrow(iris)#iris의 행의 수
#꽃잎의 길이에 따라 레이블 결정
mylabel <- c() #비어있는 벡터 선언


for(i in 1:nrow(iris)){
  
  if(iris$Sepal.Length[i] <= 1.6){
    mylabel[i] <- 'L'
  }else if(iris$Sepal.Length[i] > 5.1){
    mylabel[i] <- 'H'
  }else{
    mylabel[i] <- 'M'
  }
}
print(mylabel)


#꽃잎의 길이와 레이블 결합 dataframe로 만들자
newds <- data.frame(iris$Petal.Length, mylabel)
head(newds)

##while문
#while(비교조건){
#     반복할 명령문
# }

sum <- 0
i <- 0
while(i <= 100){
  sum <- sum+i
  i <- i +1
}
print(sum)

#break,next
sum <- 0
for(k in 1:10){
  sum = sum + k
  if(k>5) break
}
sum

#next
sum <- 0
for(i in 1:10){
  if(i%%2==0) next
  sum <- sum + i
}
sum

head(iris)
##apply() 함수
#apply(데이텨셋, 행/열방향 지정, 적용함수)
apply(iris[,1:4], 1,mean) #row 방향으로 함수 적용
apply(iris[,1:4], 2,mean) #col 방향으로 함수 적용
#유사함수 : lapply() , sapply(), tapply(), mapply()

##사용자 정의 함수
# 함수명 <- function(매개변수목록){
# 실행할 명령문
#return()
#}

#두 인자중 큰 값 찾기
mymax <- function(x,y){
  num.max <- x
  if(y>x){
    num.max <- y
    
  }
  
  return(num.max)
}

mymax(5,7)

#초기값 설정
mymax <- function(x,y=7){
  num.max <- x
  if(y>x){
    num.max <- y
    
  }
  
  return(num.max)
}

mymax(100)

#myfunc.R에 저장된 함수를 이용
setwd("C:/Users/lucky/Documents/R 프로그래밍")
source("myfunc.R")
mydiv(20,4)
mydiv(mydiv(20,4),5)

## 조건에 맞는 데이터의 위치 찾기
#which()
score <- c(76, 84, 69, 50, 95, 60, 82, 71, 88, 84)
#성적이 69인 학생은 몇번째에 있나
which(score==69)
#성적이 85이상인 학생은 몇번째에 있나
which(score>=85)
#최고 점수는 몇번째에 있나
which(score==max(score))
which.max(score)
#최저 점수는 몇번째에 있나
which.min(score)

idx <- which(score<=60) #성적이 60이하인 값들의 인덱스
score[idx] <- 61 #성적이 60 이하인 값들은 61점으로 상향 시킨다.
score

#성적이 80이상인 값들만 추출해서 저장 score.high
idx <- which(score>=80)
score.high <- score[idx]
score.high

score.high2 <- subset(score, score>=80)
score.high2

#꽃잎의 길이가 5.0이상인 값들만 추출하여 iris.big에 넣고 보여주시오
ide <- which(iris$Petal.Length>=5.0)
iris.big <- iris$Petal.Length[ide]
iris.big

idx <- which(iris$Petal.Length>=5.0)
idx
iris.big2 <- iris[idx,]
iris.big2

#1~4열 값 중 5보다 큰 값의 행과 열의 위치
#dataframe 안에 특정 값의 행과 열의 위치를 알고 싶으면
#arr.ind = TRUE를 추가한다.
which(iris[,1:4] > 5.0, arr.ind=TRUE)

#[ 조건문, 반복문, 함수 연습문제 ]

#1. R의 apply() 함수를 이용하여 다음 문제를 해결하는 R 코드를 작성하시오.
#1) iris 데이터셋의 행별 합계를 출력하시오.(5번째 열은 제외)
apply(iris[,-5],1,sum)
#2) iris 데이터셋의 열별 최댓값을 출력하시오.(5번째 열은 제외)
apply(iris[,-5],2,max)
#2. R의 apply() 함수를 이용하여 다음 문제를 해결하는 R 코드를 작성하시오.
#1) mtcars 데이터셋의 열별 합계를 출력하시오.
apply(mtcars,2,sum)
#2) mtcars 데이터셋의 열별 최댓값을 출력하시오.
apply(mtcars,2,max)
#3) mtcars 데이터셋의 열별 표준편차를 출력하시오.
apply(mtcars,2,sd)
#3. 다음과 같이 벡터를 입력하면 벡터의 최댓값과 최솟값을 반환(retrun)하는 R 함수
#maxmin()을 만들고 테스트하시오(반환값이 list임)

# maxmin 이라는 이름의 함수를 생성
maxmin <- function(v1){
   result=data.frame(max(v1), min(v1))
   return(result)
}

result <- maxmin(iris[,1])
result
result$max ; result$min


#4. 10명의 몸무게를 저장한 벡터가 다음과 같을 때 질문을 해결하기 위한 R코드를 작성하시오.

weight <- c(69, 50, 55, 71, 89, 64, 59, 70, 71, 80)


#1) 몸무게가 가장 큰 값은 몇 번째에 있나?
which.max(weight)
#2) 몸무게가 가장 작은 값은 몇 번째에 있나?
which.min(weight)
#3) 몸무게가 61에서 69사이인 값들은 몇 번째에 있나?
which(weight>=61&weight<=69)
#4) 몸무게가 60 이하인 값들만 추출하여 wight.2에 저장하고 내용을 보이시오.
idf <- which(weight<=60)
wight.2 <- weight[idf]
wight.2
#5. 다음의 문제를 해결하기 위한 R 코드를 작성하시오(which() 함수 사용).
#1) iris 데이터셋에서 꽃잎의 길이(Petal.Length)가 가장 큰 관측값(행)의 내용을 보이시오.
which.max(iris$Petal.Length)
#2) iris 데이터셋에서 꽃잎의 폭(Petal.Width)이 0.3 ~ 0.4 사이인 관측값(행)들의 내용을 보이시오.
which(iris$Petal.Width>=0.3&iris$Petal.Width<=0.4)