# model_roughness_data.R
#
### TASK 1
# Harrison and Pearce 2018, Parncutt88, Milne13 
# TUOMAS CALCULATES AND PUTS TO THE SUPPORTING INFORMATION].
# roughness and harmonicity, normalised and non-normalised

#source('Acoustic_variables.R')

m <- read.csv('roughness_for_ivs.csv',header = TRUE)

m2<-data.frame(Interval=m$Name)
m2$Hutc78<-scales::rescale(m$HK,to=c(1,10))
m2$Vass01<-scales::rescale(m$Va,to=c(1,10))
m2$Wang13<-scales::rescale(m$Wa,to=c(1,10))
m2$RoughnessMean <- rowMeans(m2[,2:4])
m2$RoughnessRank <-rank(m2$RoughnessMean)
m2
print(knitr::kable(m2,digits = 2,caption = 'Model output (normalised to 1-10)'))
print(knitr::kable(cor(m2[,2:4]),digits = 2,caption = 'Correlations'))
roughness<-m2
rm(m,m2)