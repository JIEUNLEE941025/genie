city <- c("Seoul","Tokyo","Washington") #문자로 이루어진 벡터
rank <- c(1,3,2)#숫자로 이루어진 벡터
city.info <- data.frame(city,rank)#데이터프레임 생성
city.info

#iris data set
iris 
#sepal.Length 꽃받침의 길이 숫자형
#sepal.Width  꽃받침의 폭   숫자형
#petal.Length 꽃받침의 길이 숫자형
#petal.Width  꽃잎의 폭     숫자형
#Species      붓꽃의 품종   문자형(팩터)

#1,2열의 모든 데이터 
iris[,c(1,2)]
#1,3열의 모든 데이터
iris[,c(1,3)]
#1,5열의 모든 데이터
iris[,c(1,5)] #iris[,c("Sepal.Length","Species")]
#1~5행의 모든 데이터
iris[1:5,]
#1~5행의 데이터 중 1,3열의 데이터
iris[1:5,c(1,3)]

## data set의 기본정보 확인
 
dim(iris) #행과 열의 개수 출력
nrow(iris)#행의 개수 출력
ncol(iris)#열의 개수 출력
colnames(iris)# 열의 이름 출력, names()와 결과 동일
names(iris)
head(iris) #data set의 앞부분 일부 출력
tail(iris) #data set의 뒷부분 일부 출력
str(iris)  #data set 요약 정보 보기
iris[,5]   #품종 데이터 보기
unique(iris[,5]) #품종의 종류 보기(중복 제거)
table(iris[,"Species"]) #품종의 종류별 행의 개수 세기
colSums(iris[,-5]) # 열별 합계 5열빼고
colMeans(iris[,-5])# 열별 평균 5열빼고
rowSums(iris[,-5]) # 행별 합계 5열 빼고
rowMeans(iris[,-5]) # 행별 평균 5열 빼고

#행과 열의 방향 전환
z <- matrix(1:20,nrow=4,ncol=5)
z
t(z)

#조건에 맞는 행과 열의 값 추출
IR.1 <- subset(iris,Species=="setosa")
IR.1

IR.2 <- subset(iris,Sepal.Length>5.0 & Sepal.Width>4.0)
IR.2
IR.2[,c(2,4)]

#matrix와 dataframe에 대한 산술연산
a <- matrix(1:20,4,5)
a 
b <- matrix(21:40,4,5)
b
2*a
b-5
2*a + 3*b

a+b
b-a
b/a
a <- a*3
a
b <- b-5
b
#matrix와 dataframe 자료 구조 확인
iris
state.x77

class(iris)
class(state.x77)
is.matrix(iris)
is.data.frame(iris)
is.matrix(state.x77)
is.data.frame(state.x77)

#matrix --> dataframe 변환
st <- data.frame(state.x77)
head(st)
class(st)
#dataframe --> matrix 변환
iris.m <- as.matrix(iris[,1:4])
head(iris.m)
class(iris.m)

#dataframe 열 추출
iris[,"Species"] #결과 = 벡터.matrix, dataframe 모두 가능
iris[, 5]        #결과 = 벡터.matrix, dataframe 모두 가능 
iris["Species"]  #결과 = dataframe만 가능
iris[5]          #결과 = dataframe만 가능   
iris$Species     #결과 = 벡터, dataframe 만 가능

#작업 폴더 지정
setwd("C:/Users/lucky/Documents/R 프로그래밍")
air <- read.csv("airquality.csv", header= T) #header = F
head(air)

#파일 데이터 쓰기
# setosa 품종 데이터 만 추출
my.iris <- subset(iris,Species=="setosa")
my.iris
# .csv 파일에 저장하기
write.csv(my.iris,"my_iris.csv",row.names=F)

#[ Matrix, Dataframe 연습문제 1 ]
#R에서 제공하는 state.x77 데이터셋을 이용하여 코드를 작성하시오.
#1) state.x77을 변환하여 st에 데이터프레임으로 저장하시오.
st <- data.frame(state.x77)
#2) st의 내용을 출력하시오.
st
#3) st의 열이름을 출력하시오.
colnames(st)
#4) st의 행 이름을 출력하시오.
rownames(st)
#5) st의 행과 개수와 열의 개수를 출력하시오.
dim(st)
#6) st의 요약 정보를 출력하시오.
str(st)
#7) st의 행별 합계와 평균을 출력하시오.
rowSums(st)
rowMeans(st)
#8) st의 열별 합계와 평균을 출력하시오.
colSums(st)
colMeans(st)
#9) Florida 주의 모든 정보를 출력하시오.
st['Florida',]
#10) 50개 주의 수입(Incom) 정보만 출력하시오.
st[,'Income']
#11) Texas 주의 면적(Area)을 출력하시오.
st['Texas','Area']
#12) Ohio 주의 인구(Population)와 수입(Income)을 출력하시오.
st['Ohio',c('Population','Income')]
#13) 인구가 5,000 이상인 주의 데이터만 출력하시오.
subset(st,Population>=5000)
#14) 수입이 4,500 이상인 주의 인구, 수입, 면적을 출력하시오.
subset(st[,c('Population','Income','Area')],Income>=4500)
#15) 수입이 4,500 이상인 주는 몇 개인지 출력하시오.
nrow(subset(st,Income>=4500))
#16) 전체 면적(Area)이 100,000 이상이고, 결빙일수(Frost)가 120 이상인 주의 정보를 출력하시오
subset(st,Area >= 100000 & Frost >= 120)
#17) 인구(Population)가 2,000 미만이고, 범죄율(Murder)이 12 미만인 주의 정보를 출력하시오.
subset(st,Population < 2000 & Murder < 12)
#18) 문맹률(Illiteracy)이 2.0 이상인 주의 평균 수입은 얼마인 주 출력하시오.
colMeans(subset(st,Illiteracy > 2.0))
mean <- colMeans(subset(st,Illiteracy > 2.0))
mean['Income']
#19) 문맹률(Illiteracy)이 2.0 미만인 주와 2.0 이상인 주의 평균 수입의 차이를 출력하시오.
a <- colMeans(subset(st,Illiteracy<2.0)) 
b <- colMeans(subset(st,Illiteracy>2.0))
c <- a['Income']-b['Income'] 
c
#20) 기대수명(Life Exp)이 가장 높은 주는 어디인지 출력하시오.
d <- subset(st,Life.Exp==max(Life.Exp))                
d

#21) Pennsylvania 주보다 수입(Income)높은 주들을 출력하시오.
e <- subset(st,Income > st['Pennsylvania','Income'])
e
#st['Pennsylvania','Income']

