# loading
library(dplyr)
library(ggplot2)
library(ggcorrplot)
library(tidyr)
library(ggthemes)
library(corrgram)
library(corrplot)
library(caTools)
library(superheat)


# read data
df <- read.csv('MP-5RBIG.csv',sep=";",header = TRUE)

# check info
str(df)

#Check fo missing values and impute them if needed.
print(any(is.na(df)))

# variable
df$finalResult <- NA

#df$finalResult <- df$G3 %in% c(10,11)
#head(df$finalResult)

# Add a binary categorical variable called finalResult, 
# with level "pass" if the variable G3 is greater or equal to 10 and "fail" 
# otherwise (Note: don't forget this variable in the following study).
df$finalResult[df$G3 >= 10] <- "pass"
df$finalResult[df$G3 < 10] <- "fail"
head(df)

# Add a categorical variable called academicGrade, 
#with five levels "A", "B", "C", "D", "E" depending on whether 
#the variable G3 is between 16 and 20, 14 and 15, 12 and 13, 10 and 11, 0 and 9 
#(Note: don't forget this variable in the following study).

df$academicGrade <- NA

df$academicGrade[which(df$G3 >= 0 & df$G3 <= 9)] <-"E"
df$academicGrade[which(df$G3 >= 10 & df$G3 <= 11)] <-"D"
df$academicGrade[which(df$G3 >= 12 & df$G3 <= 13)] <-"C"
df$academicGrade[which(df$G3 >= 14 & df$G3 <= 15)] <-"B"
df$academicGrade[which(df$G3 >= 16 & df$G3 <= 20)] <-"A"
head(df$academicGrade)

# section 2

ggplot(df,aes(x= Mjob)) + 
  geom_bar(fill = "cornflowerblue",
           color="black") + 
  labs(x = "Mjob",
       y = "Frequency",
       title = "mothers job")

ggplot(df,
       aes(x=Mjob,
           y = ..count.. / sum(..count..))) +
  geom_bar() +
  labs(x = "Mjob",
       y = "Percent",
       title = "mothers job") +
  scale_y_continuous(labels = scales::percent)

plotdata <- df %>%
  count(Mjob) %>%
  arrange(desc(Mjob)) %>%
  mutate(prop = round(n * 100 /sum(n), 1),
         lab.ypos = cumsum(prop) - 0.5 *prop)

ggplot(plotdata,
       aes(x = "",
           y = prop,
           fill = Mjob)) +
  geom_bar(width = 1,
           stat = "identity",
           color = "black") +
  coord_polar("y",
              start = 0,
              direction = -1) +
  theme_void()

#卡方  Chi-square test

prfs = xtabs(~ Mjob,data = df)
prfs

chisq.test(prfs)

ggplot(df,aes(x= Fjob)) + 
  geom_bar(fill = "cornflowerblue",
           color="black") + 
  labs(x = "Fjob",
       y = "Frequency",
       title = "fathers job")

ggplot(df,
       aes(x=Fjob,
           y = ..count.. / sum(..count..))) +
  geom_bar() +
  labs(x = "Fjob",
       y = "Percent",
       title = "fathers job") +
  scale_y_continuous(labels = scales::percent)

plotdata <- df %>%
  count(Fjob) %>%
  arrange(desc(Fjob)) %>%
  mutate(prop = round(n * 100 /sum(n), 1),
         lab.ypos = cumsum(prop) - 0.5 *prop)

ggplot(plotdata,
       aes(x = "",
           y = prop,
           fill = Fjob)) +
  geom_bar(width = 1,
           stat = "identity",
           color = "black") +
  coord_polar("y",
              start = 0,
              direction = -1) +
  theme_void()

prfs = xtabs(~ Fjob,data = df)
prfs

chisq.test(prfs)


ggplot(df,aes(x= academicGrade)) + geom_bar()

ggplot(df,aes(x= academicGrade)) + 
  geom_bar(fill = "cornflowerblue",
           color="black") + 
  labs(x = "academicGrade",
       y = "Frequency",
       title = "academicGrade")

ggplot(df,
       aes(x=academicGrade,
           y = ..count.. / sum(..count..))) +
  geom_bar() +
  labs(x = "academicGrade",
       y = "Percent",
       title = "academicGrade") +
  scale_y_continuous(labels = scales::percent)

plotdata <- df %>%
  count(academicGrade) %>%
  arrange(desc(academicGrade)) %>%
  mutate(prop = round(n * 100 /sum(n), 1),
         lab.ypos = cumsum(prop) - 0.5 *prop)

ggplot(plotdata,
       aes(x = "",
           y = prop,
           fill = academicGrade)) +
  geom_bar(width = 1,
           stat = "identity",
           color = "black") +
  coord_polar("y",
              start = 0,
              direction = -1) +
  theme_void()

prfs = xtabs(~ academicGrade,data = df)
prfs

chisq.test(prfs)


#(2)  研究变量对之间的关联  Study the correlation between pairs of variables
#G3&academicGrade
ggplot(df,
       aes(x = G3,
           fill = academicGrade)) +
  geom_bar(position = "stack")


ggplot(df,
       aes(x = G3,
           fill = academicGrade)) +
  geom_bar(position = "dodge")

ggplot(df,
       aes(x = G3,
              fill = academicGrade)) +
  geom_bar(position = "fill") +
  labs(y = "Proportion")


mytable <- xtabs(~ G3+academicGrade, data = df)
mytable

chisq.test(mytable)

#studytime&academicGrade
ggplot(df,
       aes(x = studytime,
           fill = academicGrade)) +
  geom_bar(position = "stack")


ggplot(df,
       aes(x = studytime,
           fill = academicGrade)) +
  geom_bar(position = "dodge")

ggplot(df,
       aes(x = studytime,
           fill = academicGrade)) +
  geom_bar(position = "fill") +
  labs(y = "Proportion")


mytable <- xtabs(~ studytime+academicGrade, data = df)
mytable

chisq.test(mytable)

#paid&G3
ggplot(df,
       aes(x = paid,
           fill = G3)) +
  geom_bar(position = "stack")


ggplot(df,
       aes(x = paid,
           fill = G3)) +
  geom_bar(position = "dodge")

ggplot(df,
       aes(x = paid,
           fill = G3)) +
  geom_bar(position = "fill") +
  labs(y = "Proportion")


mytable <- xtabs(~ paid+G3, data = df)
mytable

chisq.test(mytable)

# section  3

# 描述性统计 descriptives statistics
summary(df)

# 对absences的直方图  画图   Draw the histogram of absences
ggplot(df,aes(x = absences)) +
  geom_histogram(fill = "cornflowerblue",
                 color = "white",
                 binwidth = 5) + 
  labs(title = "number of school absences",
       subtitle = "binwidth = 5",
       x = "number")

# 内核密度图 kernei density plot
ggplot(df,aes(x = absences)) +
  geom_density() + 
  labs(title = "number of school absences")

# 点图   Dot plot
ggplot(df,aes(x = absences)) + 
  geom_dotplot() + 
  labs(title = "number of school absences",
       y = "Proportion",
       x = "number")

# 离群值  Outliers
set.seed(123)
data <- df$absences
summary(data)

plot(density(data))
boxplot(data)
boxplot.stats(data)$out

#置信区间  Confidence interval
t.test(data)

#相关统计检验   Correlation statistical test
cor.test(x = data ,y = df$G3)


# 对studytime的直方图  画图   Draw the histogram of studytime
ggplot(df,aes(x = studytime)) +
  geom_histogram(fill = "cornflowerblue",
                 color = "white",
                 binwidth = 5) + 
  labs(title = "number of studytime",
       subtitle = "binwidth = 5",
       x = "number")

# 内核密度图 kernei density plot
ggplot(df,aes(x = studytime)) +
  geom_density() + 
  labs(title = "number of studytime")

# 点图   Dot plot
ggplot(df,aes(x = studytime)) + 
  geom_dotplot() + 
  labs(title = "number of studytime",
       y = "Proportion",
       x = "number")

# 离群值  Outliers
set.seed(123)
data <- df$studytime
summary(data)

plot(density(data))
boxplot(data)
boxplot.stats(data)$out

#置信区间  Confidence interval
t.test(data)

#相关统计检验   Correlation statistical test
cor.test(x = data ,y = df$G3)


# G3
ggplot(df,aes(x = G3)) +
  geom_histogram(fill = "cornflowerblue",
                 color = "white",
                 binwidth = 5) + 
  labs(title = " final grade in Math",
       subtitle = "binwidth = 5",
       x = "number")

# 内核密度图 kernei density plot
ggplot(df,aes(x = G3)) +
  geom_density() + 
  labs(title = "final grade in Math")

# 点图   Dot plot
ggplot(df,aes(x = G3)) + 
  geom_dotplot() + 
  labs(title = "final grade in Math",
       y = "Proportion",
       x = "number")

# 离群值
set.seed(123)
data <- df$G3
summary(data)

plot(density(data))
boxplot(data)
boxplot.stats(data)$out



#绘制矩阵的相关图   Draw the correlation diagram of the matrix
data <- dplyr::select_if(df,is.numeric)

r <- cor(data,use = "complete.obs")
round(r,2)
ggcorrplot(r)

# 这里可以得出什么结论呢？
#   G1,G2,G3  三次成绩密切相关

#绘制热图  Draw a heat map

superheat(data,
          scale = TRUE,
          left.label.text.size = 3,
          bottom.label.text.size = 3,
          bottom.label.size = .05,
          row.dendrogram = TRUE)



# section 4

head(df)
# 箱型图  G1与academicGrade之间的关系
#The relationship between G1 and academicGrade
ggplot(df,
       aes(x = G1,
           y = academicGrade)) + 
  geom_boxplot() + 
  labs(title = "academicGrade by G1")

ggplot(df,
       aes(x = G2,
           y = academicGrade)) + 
  geom_boxplot() + 
  labs(title = "academicGrade by G2")

ggplot(df,
       aes(x = G2,
           y = academicGrade)) + 
  geom_boxplot() + 
  labs(title = "academicGrade by G3")


# 均值的条形图  Bar charts for means
plotdata <- df %>%
  group_by(academicGrade) %>%
  summarise(mean_grades = mean(G1))

ggplot(plotdata,
       aes(x = academicGrade,
           y = mean_grades)) +
  geom_bar(stat = "identity")

plotdata <- df %>%
  group_by(academicGrade) %>%
  summarise(mean_grades = mean(G2))

ggplot(plotdata,
       aes(x = academicGrade,
           y = mean_grades)) +
  geom_bar(stat = "identity")

plotdata <- df %>%
  group_by(academicGrade) %>%
  summarise(mean_grades = mean(G3))

ggplot(plotdata,
       aes(x = academicGrade,
           y = mean_grades)) +
  geom_bar(stat = "identity")

# 堆积条形图    Stacked bar charts
ggplot(df,
       aes(x = G1,
           fill = academicGrade)) +
  geom_bar(position = "stack")

ggplot(df,
       aes(x = G2,
           fill = academicGrade)) +
  geom_bar(position = "stack")

ggplot(df,
       aes(x = G3,
           fill = academicGrade)) +
  geom_bar(position = "stack")


#t.test(df$schoolsup, df$famsup, alternative="great", var.euqal=F)

#均值
Um <- mean(df$G1)
gyes <- df$G1[which(df$schoolsup == "yes")]
gno <- df$G1[which(df$schoolsup == "no")]
head(gyes)

# T 检验
t.test(gyes,gno,paired = FALSE)

# ANOVA
# health 与G1
aggregate(df$health,by=list(df$G1),FUN=mean)

aggregate(df$health,by=list(df$G1),FUN=sd)

df.aov <-aov(health ~ G1,data = df)

summary(df.aov)


# health 与G2
aggregate(df$health,by=list(df$G2),FUN=mean)

aggregate(df$health,by=list(df$G2),FUN=sd)

df.aov <-aov(health ~ G1,data = df)

summary(df.aov)

# freetime 与g1
aggregate(df$freetime,by=list(df$G2),FUN=mean)

aggregate(df$freetime,by=list(df$G2),FUN=sd)

df.aov <-aov(freetime ~ G1,data = df)

summary(df.aov)


# goout 与g1
aggregate(df$goout,by=list(df$G2),FUN=mean)

aggregate(df$goout,by=list(df$G2),FUN=sd)

df.aov <-aov(goout ~ G1,data = df)

summary(df.aov)


# Dalc 与g1
aggregate(df$Dalc,by=list(df$G2),FUN=mean)

aggregate(df$Dalc,by=list(df$G2),FUN=sd)

df.aov <-aov(Dalc ~ G1,data = df)

summary(df.aov)



#section 5   

# k-means
#library(cluster)
#kdata <- dplyr::select_if(df,is.numeric)
#head(kdata)
#head(df)
#cludata <- kdata[complete.cases(kdata),]
#str(kdata)
#boxplot(kdata)

#set.seed(12345)
#clur <-kmeans(x= kdata,centers = 3,nstart = 4)
#str(clur)

#head(clur)
#clur$size
#clur$centers

library(factoextra)
head(df)
kmdata <- dplyr::select_if(df,is.numeric)
kmdata <- scale(kmdata)
head(kmdata)
fviz_nbclust(kmdata,kmeans,method = "wss") + geom_vline(xintercept = 4,linetype = 2)

set.seed(1234)
km_result <-kmeans(kmdata,4,nstart = 24)
print(km_result)
dd <- cbind(df,cluster = km_result$cluster)
head(dd)

table(dd$cluster)

fviz_cluster(km_result,data = kmdata,
             palette=c("#2E9FDF","#00AFBB","#E7B800","#FC4E07"),
             ellipse.type = "euclid",
             star.plot = TRUE,
             repel = TRUE,
             ggtheme = theme_minimal()
             )

# Hierarchical clustering
# First find the similarity between the samples
result <- dist(kmdata,method = "euclidean")

# Generate hierarchy
result_hc <- hclust(d = result,method = "ward.D2")

#Initial display
fviz_dend(result_hc,cex = 0.6)


# According to the graph, we hierarchical clustering into three categories is more appropriate
fviz_dend(result_hc,k =3,
          cex = 0.5,
          k_colors = c("#2E9FDF","#00AFBB","#E7B800"),
          color_labels_by_k = TRUE,
          rect = TRUE
          )















