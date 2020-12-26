# model_harmonicity_data.R
#
### TASK 1
# Harrison and Pearce 2018, Parncutt88, Milne13 

#source('Acoustic_variables.R')

library(incon)
library(inconData)

# 1. GET INTERVALS -------------------------------

C <- NULL
C[[1]]<-c(60,61)-1
C[[2]]<-c(60,62)-1
C[[3]]<-c(60,63)-2
C[[4]]<-c(60,64)-2
C[[5]]<-c(60,65)-3
C[[6]]<-c(60,66)-3
C[[7]]<-c(60,67)-4
C[[8]]<-c(60,68)-4
C[[9]]<-c(60,69)-5
C[[10]]<-c(60,70)-5
C[[11]]<-c(60,71)-6

corpus1<-NULL
corpus2<-NULL
corpus3<-NULL
for (k in 1:11) {
#  print(k)
  tmp<-C[[k]]
  midi <-as.numeric(tmp)
  corpus1[k] <- as.numeric(incon(x = midi,model="milne_13_harmonicity"))       #
  corpus2[k] <- as.numeric(incon(x = midi,model="parn_88_root_ambig")) #
  corpus3[k] <- as.numeric(incon(x = midi,model="har_18_harmonicity")) #
}

interval <- c('m2','M2','m3','M3','P4','TT','P6','m6','M6','m7','M7')

df<-data.frame(Interval=interval,Parn88=corpus2,Milne13=corpus1,Har18=corpus3)
df
## NORMALISE -----------
df$Parn88<-scales::rescale(-df$Parn88,to=c(1,10))
df$Milne13<-scales::rescale(df$Milne13,to=c(1,10))
df$Har18<-scales::rescale(df$Har18,to=c(1,10))


df$HarmonicityMean <- rowMeans(df[,2:4])
df$HarmonicityRank <-rank(df$HarmonicityMean,ties.method = 'first')
print(knitr::kable(df,digits = 2,caption = 'Model output (normalised to 1-10)'))
print(knitr::kable(cor(df[,2:4]),digits = 2,caption = 'Correlations'))
harmonicity<-df
rm(corpus1,corpus2,corpus3,C,k,midi,tmp,df,interval)
