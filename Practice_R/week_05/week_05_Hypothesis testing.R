#######################################################################
# 헬스케어데이터분석개론 5강: Hypothesis Testing (Parametric Difference test) #
# 실습자료 #
#######################################################################

### 실습1: 양측 독립 이표본 차이 검정 ----

# 1. 실습자료인 birthweight 자료를 불러오고, 전체 연구집단에서 모든 변수들에 대한 기초통계분석을 실시하라.
# (연속형 자료에 대해서는 평균 & 분산, 범주형 자료에 대해서는 빈도(비율)을 확인하라.)

library(moonBook)

data <- read.csv('birthweight.csv',header=T,stringsAsFactors = F)

mytable(~ ., data=data)

# 2. birthweight 자료를 불러오고, 흡연 여부에 따른 모든 변수들에 대한 기초통계분석을 실시하라.
# (연속형 자료에 대해서는 평균 & 분산, 범주형 자료에 대해서는 빈도(비율)을 확인하라.)

mytable(smoke~ ., data=data)

# 3. 흡연군과 비흡연군 간의 bwt 변수의 평균값이 통계적으로 유의하게 다른지를 검정하라. 

library(car)
data$smoke <- factor(data$smoke)
leveneTest(bwt ~ smoke, data = data)

t.test(bwt ~ smoke, var.equal = T, data=data)

# 4. 흡연군과 비흡연군 간의 bwt 변수의 분산값이 통계적으로 유의하게 다른지를 검정하라. 

var.test(bwt ~ smoke, data=data)


### 실습 2: 양측 대응 이표본 및 세군 비교 검정 ----

# 1. 실습자료인 sleep 자료를 불러오고, group에 따라 extra 변수의 기초통계분석을 실시해라.
# (단, sleep 자료는 R 내장 데이터이다) (연속형 자료에 대해서는 평균 & 분산, 범주형 자료에 대해서는 빈도(비율)을 확인하라.)

data(sleep)
help(sleep)

library(moonBook)

mytable(group ~ extra, data=sleep)

# 2. sleep 자료에서 수면제 복용 전후의 수면증가 평균값이 서로 다른지를 검정하라.
t.test(extra ~ group, data=sleep, paired=T)


# 3. 실습자료인 PlantGrowth 자료를 불러오고, 세 군간 weight 변수의 기초통계분석을 실시해라.
# (단, PlantGrowth 자료는 R 내장 데이터이다.) (연속형 자료에 대해서는 평균 & 분산, 범주형 자료에 대해서는 빈도(비율)을 확인하라.)

data(PlantGrowth)
str(PlantGrowth)

mytable(group ~ weight, data=PlantGrowth)

# 4. PlantGrowth 자료에서 세 군간 weight 변수의 평균값이 서로 다른지를 검정하라.

library(car)
leveneTest(weight ~ group, data = PlantGrowth)

model <- aov(weight ~ group, data=PlantGrowth)
summary(model)

