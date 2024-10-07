
#导入第三方库
#install.packages('xlsx')
#此处只用到了mgcv包的gam函数
library(mgcv)       #mgcv包:实现GAM模型-gam函数。
#library(dplyr)      #dplyr包:用于数据分析-整理数据的工具。
#library(ggplot2)    #ggplot2包:绘制统计图形或数据图形。
#library(ISLR)       #ISLR包:统计学习算法和技术的工具。
#library(voxel)      #voxel包:辅助GAM模型计算的包。
#library(tidyverse)  #tidyverse包:数据清洗、分析和可视化。
#library(gridExtra)  #gridExtra包:控制图形布局。
#library(visreg)     #visreg包:解决回归模型可视化问题。
#library(GGally)     #GGally包:增强ggplot2的功能,提供多元统计图形、网络图以及多变量数据分析的图形接口。
#library(xlsx)       #xlsx包:进行Excel文件的读写方法。
#library(ggrepel)    #ggrepel包:解决标签之间的相互重叠问题。

#导入数据
#read.csv: 这是R语言自带的基础包utils中的函数,用于读取CSV文件。
mydata <- read.csv('C:\\Users\\WDMX\\Desktop\\R Notes\\CPCI\\Paneldata2.csv')
#
#as.factor: 这是R语言自带的基础包base中的函数,用于将向量转换为因子(factor)类型。
mydata$Year <- as.factor(mydata$Year)
mydata$City <- as.factor(mydata$City)
#为数据框mydata添加一个逻辑列start.event,并将该列中所有行的值初始化为FALSE。
mydata$start.event = FALSE
#将Year列中值为2009的行的start.event列的值设置为TRUE,表示2009为一个新的自回归序列开始。
mydata$start.event[mydata$Year == 2009] <- TRUE

#构造拟合表达式
#gam: 这是mgcv包中的函数,用于拟合广义加性模型(Generalized Additive Models)。
# IE是因变量(响应变量) , s(POP)+...+s(PB)是自变量(预测变量) , s(...)表示这些自变量将通过平滑函数(通常是样条函数)进行建模,而不是简单的线性关系。
# 'data = mydata': data是来自mydata所包含因变量和自变量的数据框 , 'family = gaussian':表示因变量FJ服从高斯分布(正态分布)。
# 'AR.start': 参数用于指定自回归(AR)模型的起点 , c(mydata$start.event)是一个逻辑向量,表示哪些观测值是新序列的开始。
# 'AR.start': 这个参数用于处理时间序列数据中的自相关性。如果mydata$start.event为TRUE,则表示一个新的自回归序列开始。
#method = "REML" 表示使用限制最大似然估计(Restricted Maximum Likelihood, REML)来拟合模型, REML是一种估计平滑参数的方法,通常用于GAM模型中。
#社会用电量GAM模型拟合
#G <- gam(SE~s(POP)+s(NIE)+s(School)+s(URA)+s(GPR)+s(ABA)+s(GDP)+s(NH)+s(TGNG)+s(PB),data=mydata,family=gaussian,AR.start=c(mydata$start.event),method="REML")
#工业用电量GAM模型拟合
G <- gam(IE~s(POP)+s(NIE)+s(School)+s(GPR)+s(ABA)+s(GDP)+s(NH)+s(TGNG)+s(PB),data=mydata,family=gaussian,AR.start=c(mydata$start.event),method="REML")
#家庭用电量GAM模型拟合
#G <- gam(HE~s(POP)+s(NIE)+s(School)+s(GPR)+s(ABA)+s(GDP)+s(NH)+s(TGNG)+s(PB),data=mydata,family=gaussian,AR.start=c(mydata$start.event),method="REML")
G

#输出结果
#summary: 这是R语言自带的基础包base中的函数,用于生成对象的摘要信息。
summary(G)  #统计G的详细统计摘要信息。

#绘图方案1
op <- par(mfrow=c(1,1))  ##表示将图形窗口分成1行1列-多张图会1张1张的挨个显示
#plot具体参数解释见绘图方案2的注解 
plot(G,all.terms=T,scheme=3,n=100,shade=T,residuals=T,pch=21,shade.col='Blue')
par(op)  #这段代码的作用是恢复之前保存的图形参数设置


#绘图方案2
#par: 这是R语言自带的基础包graphics中的函数,用于设置或查询图形参数。
#op <- par(mfrow=c(3,4))  #表示将图形窗口分成3行4列,总共可以显示12个图形,以便在同一窗口中显示多个图形。

#plot: 这是R语言自带的基础包graphics中的函数，用于绘制图形。
#all.terms=T 表示绘制模型中所有的项(terms) ; 如果模型中有多个预测变量, all.terms=T 会为每个预测变量生成一个单独的图形。
#scheme=3 表示使用第三种绘制方案,具体效果取决于所使用的GAM包
#n 参数指定在绘制平滑曲线时使用的点数 ; n=100 表示在绘制平滑曲线时使用100个点
#shade=T 表示在平滑曲线上绘制置信区间(通常是95%置信区间) ; 置信区间会以阴影的形式显示在曲线下方。
#residuals=T 表示在图形中显示残差 ; 残差是观测值与模型预测值之间的差异,通常用于评估模型的拟合效果。
#pch 参数用于指定绘制点的符号类型 ; pch=21 表示使用圆圈（filled circle）作为点的符号。
#shade.col 参数用于指定置信区间的阴影颜色 ; shade.col='red' 表示置信区间的阴影颜色为红色。
#plot(G,all.terms=T,scheme=3,n=100,shade=T,residuals=T,pch=21,shade.col='red')

#par: 这是R语言自带的基础包graphics中的函数,用于设置或查询图形参数
#par(op)  #这段代码的作用是恢复之前保存的图形参数设置


#绘图方案3
#visreg: 这是visreg包中的函数,用于可视化回归模型中的条件效应
#p <-visreg(G, "GDP",gg=TRUE,type = "conditional", 
#fill = list(fill = "LightBlue"),points = list(size = 1.5, pch = 21,fill = "#ed1299",alpha = 0.8))