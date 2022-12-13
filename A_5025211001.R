#nomor1####
#A
x = c(78, 75, 67, 77, 70, 72, 78, 74, 77)
y = c(100, 95, 70, 90, 90, 90, 89, 90, 100)

sd(x-y)

#B
t.test(y, x, paired = TRUE)

#Nomor2####
install.packages("BSDA")
library(BSDA)

#b
mean_samp = 23500
std_samp = 3900
n_samp = 100

tsum.test(mean_samp, std_samp, n_samp)

#Nomor3####
#B
mean_samp1 = 3.64
std_samp1 = 1.67
n_samp1 = 19

mean_samp2 = 2.79
std_samp2 = 1.32
n_samp2 = 27

tsum.test(mean_samp1, std_samp1, n_samp1, 
          mean_samp2 , std_samp2, n_samp2,
          alternative = "greater", var.equal = TRUE)

#C
install.packages("mosaic")
library(mosaic)

df = 2

plotDist(dist = 't', df)

#D
p = 0.05
qchisq(p, df, lower.tail = FALSE)

#Nomor4####

##A
dataset = read.table("https://rstatisticsandresearch.weebly.com/uploads/1/0/2/6/1026585/onewayanova.txt", h = TRUE)

dataset$Group <- as.factor(dataset$Group)
dataset$Group = factor(dataset$Group, labels = c("Kucing Oren", "Kucing Hitam", "Kucing Putih"))

class(dataset$Group)

oren <- subset(dataset, Group == "Kucing Oren")
hitam <- subset(dataset, Group == "Kucing Hitam")
putih <- subset(dataset, Group == "Kucing Putih")

#oren
qqnorm(oren$Length, main = "Kucing Oren")
qqline(oren$Length)

#hitam
qqnorm(hitam$Length, main = "Kucing Hitam")
qqline(hitam$Length)

#putih
qqnorm(putih$Length, main = "Kucing Putih")
qqline(putih$Length)


##B
bartlett.test(Length ~ Group, data = dataset)

##C
model1 = lm(Length ~ Group, data = dataset)
anova(model1)

##E
TukeyHSD(aov(model1))

##F
install.packages("ggplot2")
library("ggplot2")

install.packages("ggplot2")
library("ggplot2")

ggplot(dataset, aes(x = Group, y = Length)) + geom_boxplot(fill = "lightblue", colour = "black") + scale_x_discrete() + xlab("Treatment Group") + ylab("Length (cm)")

#Nomor5####

##A
library(readr)
library(ggplot2)
library(multcompView)
library(dplyr)

GTL = read_csv("GTL.csv")
qplot(x = Temp, y = Light, geom = "point", data = GTL) + facet_grid(.~Glass, labeller = label_both)

##B
GTL$Glass = as.factor(GTL$Glass)
GTL$Temp_Factor = as.factor(GTL$Temp)

anova = aov(Light ~ Glass*Temp_Factor, data = GTL)
summary(anova)

##C
data_summary = group_by(GTL, Glass, Temp) %>% summarise(mean = mean(Light), sd = sd(Light)) %>% arrange(desc(mean))
print(data_summary)

##D
Tukey = TukeyHSD(anova)
print(Tukey)

##E
tukey.cld = multcompLetters4(anova, tukey)
cld = as.data.frame.list(tukey.cld$`Glass:Temp_Factor`)
data_summary$Tukey = cld$Letters
print(tukey.cld)
print(data_summary)