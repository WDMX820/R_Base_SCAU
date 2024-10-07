#Lesson1:Data Summaries and Displays
#Exploratory Data Analysis(EDA)

#中央位置:均值,中位数,众数
#离散程度:方差,标准差

#data summary
dat <-c(127,122,117,184,143,122)
mean(dat)   #平均数
sum(dat)/length(dat)  #平均数
median(dat) #中位数

#自定义函数
f1=function(c){
  z=c^2+4
return(z)
}
f1(3)
f1(4.2)
#由于没有求众数的函数,需要自己编写一个求众数的函数
Mode <- function(x){
  tbl <- sort(table(x))  #对频次进行排序,最大在最后
  if(var(tbl)==0){ NA    #var():求方差
  #tbl[tbl==max(tbl)]:获得最多频次的数据名及其数量
  #names(tbl)[tbl==max(tbl)]:只获取数据名
  #as.numeric():转换为数值型
  }else {as.numeric(names(tbl)[tbl==max(tbl)])} #
}


#图表
#柱状图:分类数据
#直方图:连续数据
#散点图,箱线图,小提琴图

#barplot函数-柱状图
mar <- c(rep("Married",136), rep("separated",18), rep("Divorced",40), rep("single",89), rep("widowed",17))
cts <- table(mar) #频次表
#col:颜色 , cex.names:x轴元素名称字体大小 , ylim:y轴最大值和最小值, ylab:y轴名称 , xlab:x轴名称 , cex.lab:x轴标题字体大小 , cex.axis:y轴数字字体大小 , cex.main:标题大小 , main:标题
xpos <- barplot(cts, beside=TRUE, cex.names=1.2,col="grey80", ylim=c(0,150), ylab="Frequency (N)",xlab="Marital Status", cex.lab=2,cex.axis=1.2,cex.main=1.5,
                main="Counts of Participants by Marital Status")
text(xpos,y=cts+4,labels=cts, cex=1.2) # 增加频次显示
#
#prop.table(table(mar)):每个数据所占整体百分比的比例(例:0.13)
pct <-round(prop.table(table(mar))*100,1)# 各类数据所占百分比比例

#hist函数-直方图
hist(iris$Sepal.Width, col="grey80",xlab="Sepal Width",cex.lab=1.2,cex.axis=1.2,cex.main=1.5,main="Histogram displays")
d1=iris[iris$Species=="setosa",] #获取iris的Species等于setosa的数据,所有列
#
#histogram函数-直方图
library(lattice)
#install.packages('lattice')
#layout=c(1,3):1列3行展示图表
histogram(~Sepal.Width|Species, data=iris, type="count", layout=c(1,3),cex.1ab=1.2,cex.axis=1.2,
          cex.main=1.5,xlab="sepal width",main="sepal width by species")

#ggplot函数-参考cheatsheet
library(ggplot2)
install.packages('ggplot2')
#使用iris数据集,使用其中Sepal.width的数据,不同的Species用不同的颜色填充,画直方图
#breaks=seq(2,4.4,.2):间隔距离 ; alpha:图像透明度
ggplot(iris, aes(Sepal.Width,fill=Species, colour=Species))+
  geom_histogram(breaks=seq(2,4.4,.2),alpha=0.6, position="identity")

#R-graph-gallery网站-专业画图辅助网站

#boxplot函数-箱线图
boxplot(iris$Sepal.Width,  ylab="Sepal width",
        main="Box Plot of sepal width in Iris Data")
boxplot(Sepal.Width~Species,data=iris,cex.lab=1.2,cex.axis=1.2,lwd=2,
        cex=1.2,cex.main=1.5,ylab="Sepal Width", xlab="Species",
        main="Box plot of sepal width by special")

#violin函数-小提琴图
library(vioplot)
library(sm)
library(zoo)
#install.packages('vioplot')
#set.seed(1)
#从均值是0的正态分布随机抽1000个,从均值是4.5的正态分布随机抽1000个,组成向量
dat <-c(rnorm(1000,mean=0),rnorm(1000,mean=4.5)) 
#
#存图片vio.pdf文件至电脑本地-当前路径下
pdf(file="vio.pdf",width=15, height=8)
vioplot(dat,cex.lab=1.2,cex.axis=1.2,cex=1.2,
         cex.main=1.5,col="grey80",ylab="Data values",names="", main="violin Plot of Bimodal +Sample Data")
dev.off()

#scatter plot函数-散点图
plot(iris$Sepal.Width, iris$Petal.Width, lwd=2, cex.lab=1.2, cex.axis=
       1.2,cex.main=1.5, xlab="sepal width", ylab="Petal width",
     main="scatterplot of sepal width by petal width")

#根据不同花的种类定义不同的颜色
plot(iris$Sepal.Width,iris$Petal.Width, lwd=2,
      cex.lab=1.2,cex.axis=1.2,cex.main=1.5, xlab="sepal width", ylab="Petal width", col=(2:4)[iris$Species],
     main="scatterplot of sepal width by Petal width")
#增加图例
legend("right",legend=levels(iris$Species), col=(2:4),pch=10, bty="n",cex=1.2)
#增加回归线画在图上,y~x
abline(lm(iris$Petal.Width~iris$Sepal.Width,data=iris, subset=(Species=="setosa")),lwd=3,col=2)
abline(lm(iris$Petal.Width~iris$Sepal.Width,data=iris, subset=(Species=="versicolor")),lwd=3,col=3)
abline(lm(iris$Petal.Width~iris$Sepal.Width,data=iris, subset=(Species=="virginica")),lwd=3,col=4)
#iris中4个连续变量两两之间的关系图-散点图
pairs(iris[,1:4])

#图上面的Export可以将图像导出




