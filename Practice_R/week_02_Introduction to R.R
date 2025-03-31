#######################################################################
# 헬스케어데이터분석개론 2강: Data Types & Structures #
# Introduction to R #
# 실습자료 #
#######################################################################


###### R 구조 이해하기 ----
## R version ----
version

## R packages ----
install.packages("dplyr")
library(dplyr)




###### R 객체 이해하기 ----
## 데이터 타입 ----
### 숫자형(numeric)----
mode(5) 
typeof(5) 
typeof(5L)

### 문자형(character)----
mode("a") 
typeof("a") 

### 논리형(logical)----
mode(TRUE) 
typeof(TRUE) 

### 팩터(factor)----
## 명목형 데이터
gender <- factor(c("남", "여", "여", "남"))
print(gender)


## 순서형 데이터
education <- factor(c("대졸", "고졸", "석사"), levels = c("고졸", "대졸", "석사"), ordered = TRUE) 
print(education) 


### 날짜형(Date)----
date1 <- as.Date("2024-01-01") 
date2 <- as.Date("2024-12-31")
days_diff <- date2 - date1 # 365 days
print(days_diff)

### NA ----
a<-NA
is.na(a)

### NULL ----
a<-c()
a

### NaN ----
log(-1)

### Inf/-Inf ----
10^309
is.infinite(Inf) 


## 데이터 객체 ----
### 벡터(vector) ----

# 숫자형 벡터
num_vector<-c(2,4,5,7,9)
num_vector[2]

# 문자형 벡터 
char_vector<-c("A","B","C")
char_vector[1]


### 행렬(matrix)----

# 3x3 행렬 생성
matrix_data <- matrix(1:9, nrow=3, ncol=3)
matrix_data
matrix_data[3,]
matrix_data[3,2]                

### 배열(array) ----

# 3x2x2 크기의 배열 생성 
array_data <- array(1:12, dim = c(3, 2, 2))
array_data
array_data[,,2]
array_data[3,1,2]

### 데이터프레임(data.frame) ----
df <- data.frame( 
  Name = c("Alice", "Bob",  "Charlie"), 
  Age = c(25, 30, 35),  
  Scores = c(88, 90, 85),
  Sex = c("F","M","F")
)
df
df[3,]
df[,3]
df[1,"Name"]
df$Name
df$Age


### 리스트(list)----
my_list <- list(
  name = "John", 
  age = 25, 
  scores = c(90, 85, 88))

my_list
my_list$name
my_list[[3]]
my_list[[3]][2]


## 연산자 ----
### 산술 연산자 ----
5 + 2
5 - 2
5 * 2
5 / 2
5 ^ 2        
5 ** 2 
5%%2
5%/%2

###비교 연산자 ----
5<2
5<=2
5>2
5>=2
5==2
5!=2
!(5==2)
isTRUE(5!=2)

###할당 연산자----
last_name <- c("Kim","Park","Lee")
last_name = c("Kim","Park","Lee")

## help()----
# 함수 도움말 확인
help("mean")
?mean

# 내장 데이터 도움말 확인
help("iris")
data("iris") # 데이터 불러오기

# 패키지 도움말 확인
help(package="survival")
# 패티지 탭에서 패티지 검색하여 확인하는 과정 실습때 확인!






###### R 실습 ----

### 데이터 객체 이해하기 ----

### 1. 1이라는 값을 가진 벡터 a를 만드시오
a <- 1
print(a)

### 2. "kim", "park", "jung"이라는 세 문자를 가진 벡터 NAME을 만드시오. (단, c()라는 함수 사용)
NAME <- c("kim","park","jung")
print(NAME)

### 3. data <- matrix(1:12, nrow=4, ncol=3)
###    위의 코드를 실행하여, data라는 matrix 객체에서 2행 3열의 값을 확인하시오
data <- matrix(1:12, nrow=4, ncol=3)
data[2,3]

### 4. df <- data.frame(Name = c("Alice", "Bob",  "Charlie"), Age = c(25, 30, 35),  Scores = c(88, 90, 85), Sex = c("F","M","F"))
###    위의 코드를 실행하여, df라는 data.frame 객체에서 1행과 1열의 객체 종류를 각각 확인하시오. (단, str() 함수 사용)
df <- data.frame(Name = c("Alice", "Bob",  "Charlie"), Age = c(25, 30, 35),  Scores = c(88, 90, 85), Sex = c("F","M","F"))

df[1,]
str(df[1,])

df[,1]
str(df[,1])

### 5. 아래와 같은 구조와 값을 가지는 tmp라는 이름의 data.frame 객체를 만드시오.
tmp <- data.frame(A=c(1,2,3),B=c("a","b","c"),C=c("1","2","3"))
tmp
str(tmp)



### 연산자/함수 객체 이해하기 ----

### 1. 이전 실습에서 생성했던 tmp라는 data.frame의 A변수의 값들이 1.5보다 크고 2.5보다 작은지 확인하시오 
(tmp$A > 1.5) & (tmp$A < 2.5)

### 2. tmp라는 data.frame의 A변수가 2인 행들을 선택하시오.
tmp[tmp$A == 2,]

### 3. “123”의 문자값을 가진 num이라는 객체가 있다고 합시다.
###    이를 숫치형 객체로 바꾸고, 1을 더해보시오. (단, as.numeric 함수 사용)
num <- "123"
str(num)

as.numeric(num)+1
str(as.numeric(num)+1)

### 4. 이전에 실습했던 df라는 data.frame의 Sex 변수를 factor로 변환하고,
###    레벨(level)을 “M”, “F” 순서대로 지정하시오. (단, factor 함수 사용)
str(df)
df$Sex <- factor(df$Sex, levels=c("M","F"))

### 5. 2024년 1월 21일과 2025년 3월 20일 사이의 기간을 일수로 표현하시오. (단, as.Date와 as.numeric 함수 사용)
as.numeric(as.Date("2025-03-20") - as.Date("2024-01-21"))

