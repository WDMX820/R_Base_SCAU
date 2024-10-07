library(tidyr) #用于数据处理和转换
library(dplyr) #用于处理R内部或者外部的结构化数据
# install.packages(''):下载包
#install.packages('tidyr')
#创建一个数据框DF
DF <- data.frame(
  Group=c(1,1,1,1,2,2,2,2,3,3,3,3),
  Year=(rep(c(2006,2007,2008,2009),3)),
  #rnorm()-正态分布
  Qtr.1=rnorm(12,10,1), #均值10,标准差1的正态分布随机取出12个数据
  Qtr.2=rnorm(12,11,2),
  Qtr.3=rnorm(12,12,4),
  Qtr.4=rnorm(12,14,3)
)
#pipeline:%>% , 对DF进行操作将结果保存到DFlong当中
#gather()
#把Quarter和Revenue当做新的两列数据,然后将QTR1-4整合起来变成新的数据框
DFlong=DF %>% gather(Quarter,Revenue,Qtr.1:Qtr.4)
#
#存数据至电脑本地-当前路径下
write.csv(DFlong,"DFlong.csv")
write.csv(iris,"iris.csv")
#
mean(DFlong$Revenue) #方便求均值
mean(DF$Qtr.1) #对Qtr求均值
DF %>% gather(Quarter,Revenue,-Group,-Year) #保持Group和Year不变
DF %>% gather(Quarter,Revenue,3:6)  #同第一个reshape操作
DF %>% gather(Quarter,Revenue,Qtr.l,Qtr.2,Qtr.3,Qtr.4) #同第一个reshape操作



#~~~~~~~~~~~~~~~~~~~~~~~~~打开文件~~~~~~~~~~~~~~~~~~~~~~~~~

#打开数据文件。在将数据文件导入到R中之前确认是否有特殊数据特点
#例如,是否包含文字叙述信息？变数名字？如何识别缺失的值？还有其他值得注意的重要特征吗？
#因此,在您的R脚本中需将这些特性考虑到

#read data
#导入文件名(具体的文件路径并替换为'/')
TB_Data1 <- read.table("C:/Users/WDMX/Desktop/R语言/TB_Results.txt", #导入文件名
                       sep="\t",         #数据分隔符为制表符
                       header=TRUE,      #是否包含标题
                       skip = 7,         #跳过前7行
                       stringsAsFactors = FALSE  #读取进来的数据框将不会默认把字符型转化为因子
)

summary(TB_Data1$Test.Result)  #统计TB_Data1数据框Test.Result列的相关统计数据
table(TB_Data1$Test.Result)  #统计频次

#路径函数
getwd()  #获得R当前的路径
setwd()  #设置R当前的路径
setwd("C:/Users/WDMX/Desktop/R语言")

#导入文件方法2:read_delim,需要reader包
library(readr)
install.packages('readr')
#以下为示例代码,并未做示例txt文档,理解代码意思即可
P1 <- read_delim('PRAC.txt',
                 delim=" ", #分隔符为空格
                 col_names = FALSE) #没有列名标题
P2 <- read_delim('PRAC_v2.txt',
                 delim =" ",)

P3 <- read_delim('PRAC_v3.txt',
                 delim ="@",
                 col_names = FALSE)

#导入csv文件
#以下为示例代码,并未做示例csv文件,理解代码意思即可
# read.csv方法
TB_Data2 <- read.csv('TB_Results.csv',
                     na.strings.c("@",999), #空值填充为@和999
                     header=FALSE, #没有包含标题
                     skip=4,       #跳过前4行
                     nrow=15,      #一共录入15行数据
                     stringsAsFactors=FALSE)
# read_csv方法
TB_Data2 <- read_csv('TB_Results.csv',
                     na=c("@",999), #空值填充为@和999
                     col_names=FALSE, #没有包含标题
                     skip=4,       #跳过前4行
                     n_max=15)      #一共录入15行数据
#为TB_Data2增加列名
names(TB_Data2) <- c('Test.Date',
                     'Nurse.ID.Number',
                     'Patient',
                     'TB.status',
                     'Test.Result')
#导入xlsx文件
#以下为示例代码,并未做示例xlsx文件,理解代码意思即可
# read_xlsx方法
library(readxl)
install.packages('readxl')
TB Data3 <- read_xlsx('TB_Results.xlsx',
                      sheet = 'Data', #选择哪一个sheet导入
                      na = c("@",999))





































