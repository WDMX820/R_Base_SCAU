# R-Lesson Notes
# Control+enter to run the code
# to get help, type '?mean' in console to know more
# R is not only a tool, but also a language
# 6种基本对象类型
# scalar:标量
# vector:向量
# matrix:矩阵
# array:数列
# list:列表
# data.frame:数据框
# 3种基本数据类型: numeric, character, logic
#
# = or <- :等于
#1.scholar-标量##可以装一个数据
i=3
i<-4
i
#
# R中对象名开头只能是字母或者’.+非数字’
.p=10
.o=100

#2.vector-向量##可以装两个及以上数据
v1=c(1,4)  #numeric
v1+2  #v1每个值都+2
v2=c("u","v")  #character
v2_=c('u','c') #character
v3=c(T,T,F)  #logic

#月份缩写,月份全名,pi的值
month.abb
month.name
pi

#使用mode返回数据类型
mode(v3)
v4=c(1,'6','f') #coercion妥协机制:向量只允许一个数据类型
mode(v4)

#函数
#1.seq函数:from起始数据,to最大数据,by间隔值
seq(from=1,to=8,by=2)
?seq  #使用帮助
vseq=5:-2  #5开始,-2结尾,间隔为1,产生向量
seq(10,8,-0.5)
v5=seq(10,15)  #10开始,15结尾,间隔为1,产生向量

#2.rep函数:重复
v10=rep(x=c('a','y'),3) #将'a','y'重复三遍
rep(v5,2) #让v5向量重复2遍
rep(x=c('a','y'),times=c(3,2)) #将'a'重复三次,'y'重复两次

#3.matrix函数:矩阵函数
#qr(ml)$rank to get rank of a matrix
m1=matrix(1:6,2,3) #默认按照列排序
#修改为按照行排序(byrow=T)
m2=matrix(1:6,2,3,byrow=T)
m3=matrix(1:6,ncol=2,nrow=3) #设置为2列3行
m4=matrix(rep('t',25),5,5)  #重复't'25次,设置为5行5列矩阵
m5=matrix('t',2,4) #元素循环
#
mode(m1) #数据类型为numeric
dim(m1) #dimensions
class(m1) #对象类型为matrix和array
dim(v5)
#
#堆叠vectors(向量) to a matrix(矩阵)
x=rep(1,5)
y=rep(2,5)
z=rep(3,5)
M1=cbind(x,z,y) #组合成矩阵,按照列排
M_=rbind(x,z,y) #组合成矩阵,按照行排
#first way to remove and add name
M2=cbind(x,y,z,deparse.level=0) #移除列名:deparse.1evel=0
colnames(M2)=c('111','222','333') #赋予列名
#second way to remove names
colnames(M1)=c() #移除列名
#third way
colnames(M2)=NULL #移除列名

#4.array函数:数列
#R creates arrays by reshaping a vector(has length) into a 3-dimensional
#(has rows,columns,matrices)
letters #26个英文字母
A1=array(data=letters,dim=rep(3,3)) #3rows,3columns,3matrixes
A1=array(data=letters,dim=c(3,3,3)) #3rows,3columns,3matrixes
# install.packages(''):下载包
library(abind)
#matrix+matrix=matrix
abind(m1,m3) #error行数不同
abind(m1,m2) #沿行组合
#沿列组合,将m2放在m1下边组合在一起
a1=abind(m1,m2,along=1) 
str(a1)#structure
#沿行组合,将m2放在m1右边组合在一起
a2=abind(m1,m2,along=2)
#组合成数组
a3=abind(m1,m2,along=3)
#LETTERS表示大写字母
A2=array(LETTERS,c(3,3,3))
A3=abind(A1,A2) #array+array=array
A10=array(LETTERS,c(2,4,1))
A5=abind(A10,m1) #array+matrix=array
Atest=array(c(1,"d","a"),dim=c(1,3,1))
#vector,matrix,array objects 需要同一数据类型
#data mode coercion 妥协顺序:character>numeric>logical
n=1
l=T
t1=c(c,n,l)
mode(t1)

#5.list函数:列表
#list可以包含所有数据类型,一般用于输出结果
M=matrix('a',2,4)
V=c(T,T,F)
A=array(10,c(2,3,2))
L1=list(M,V,A)
str(L1)
#创建时加上姓名Add names to elements
L2=list(e1=M,e2=V,e3=A)
#列表组合
#first way to combine list objects
LNEW=c(L1,L2)
#second way to combine list objects
LNEW2=list(L1,L2)
#
#iris自带数据集
#lm:线性回归模型,第一个参数为y,第二个参数为x,用x来预测y
#结果中:coefficients-系数;Intercept-截距;iris$Sepal.Width_斜率
model1=lm(iris$Sepal.Length~iris$Sepal.Width)
#列表结果中结果右边的绿色箭头点击即可输出结果

#6.data frame数据框(最常用的)
#data frame is 2-dimensional object, allows each column to have a unique
#data frame share properties of a list and a matrix
names=c('a','b','a','d','f','g')
apples=c(10,2,34,45,27,30)
kiwis=c(7,14,18,22,37,7)
data1=data.frame(names,apples,kiwis) #组合成数据框-类似Excel
mean(data1$apples) #求data1数据框apples列的均值
sd(data1$apples) #求data1数据框apples列的标准差
str(data1)  #显示目标对象的结构
summary(data1) #统计data1数据框的相关统计数据
class(data1) 

#R operators
n1=1:5
n1+2
c(n1,NA)+2
(1:5)^(5:1)# 1^5,2^4,3^3,4^2,5^1
m1-m2 #matrix
A/10 #除法, 如果倍数就不会报错
#算术操作仅限于数值和逻辑类型使用 +-*/
c(1,5,6)*c(2,5) #1*2,5*5,6没有数相乘了,将2循环一次使用,6*2
#relational operators < ; > ; <= ; >= ; == ; != to ANY compatible objects
'Hi'>'hi'   #大写大于小写
'hi'>'abc'  #
1:5==3
c(1:5,NA)==NA
is.na(c(1:5,NA)) #is.na用于专门判断是否等于NA
#logical operator ! ; & ; | to any compatiable data object
!T
!NA
T&T  #and
T&F
T&NA #T&NA输出NA
F&NA #F&NA输出False
T|NA #or
c(0,-3,0.5,1)&T  #数值非0即为真

#miscellaneous operators
#R代码支持代码搜索
m3%*%matrix(1,2,4) #矩阵乘法
c(1:5)%*%c(1:5) #1*1+2*2+...
v=1:5
v%*%t(v)  #t(v):对v进行转置
o5=diag(5,4)  #5填充的4行4列对角矩阵
seq(50,10,-10)-o5
!2>3
#很多operators不能用于列表s
L1==L2

#一些函数functions
exp(3) #e的3次方
#在'a','d','t'中有放回的随机取出100个
sample1=sample(c('a','d','t'),size=100,replace=T)
table(sample1) #table:向量频次统计
sample2=sample(c('a','d','t',NA),size=100,replace=T)
table(sample2) #频次统计默认忽略掉NA
table(sample2,useNA ='always')
#
D=matrix(c(-5,9,14,1),2,2) #Inf
diag(D)
#find the min off-diagonal element of D
D.new=D+diag(rep(Inf,2))#Inf:正无穷
min(D.new) #求非对角线元素的最小值
#
#MARGIN=1对行进行操作,MARGIN=2对列进行操作,MARGIN=3对数列进行操作
apply(m1,MARGIN=1,FUN=mean)
apply(m1,MARGIN=2,FUN=mean)
apply(m1,MARGIN=1,FUN=sd)
mean(m1[c(1,2),])#different
#
#对于list和data frame,apply()不能使用,用laaply代替
L=list(-2:2,c(0.5,10,5,NA))
lapply(L,mean,na.rm=T) #去除na再统计
lapply(L,mean)

#~~~~~~~~~~~~~~~~~~~~~~~~~Index~~~~~~~~~~~~~~~~~~~~~~~~~
#for indexing list
L2
L2[['e1']]  #取出'e1'块
L2$e1       #取出'e1'块
names(L2)   #获取列表L2中有哪些块
# for indexing data frame
data1
data1[[2]]  #取出第2列
data1[['apples']] #取出列名'apples'的列
data1$apples      #取出列名'apples'的列
data1[,2]   #取出第2列所有行的数据
data1[2,]   #取出第2行所有列的数据
data1[,c(1,3)]    #取出所有行和1,3列数据
#use matrix indexing for data frame
data1[3,3]  #取出第3行第3列的数据
B=10:15
B[[2]]  #取出第2个数字
#logical indexing
B[c(F,T,rep(F,3),T)] #逻辑词组成的向量-T输出,F不输出
B[B<13]  #输出小于13的数据
sum(B<12)  #满足B<12的数据个数▲
dtest=iris 


