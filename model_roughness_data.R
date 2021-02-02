# model_roughness_data.R
#
### TASK 1
# Harrison and Pearce 2018, Parncutt88, Milne13 
# roughness and harmonicity, normalised and non-normalised

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

## add detuned intervals and also add normalisation through interpolation

detuned<-NULL
detuned$Interval<-c('d2 (Detuned piano m2)','s2 (Detuned Shepard m2)','s5 (Shepard P5)')
detuned$Wang13 <- c(1.357,1.075,0.055)
detuned<-data.frame(detuned)

# linear interpolation
df<-data.frame(y=m2$Wang13,x=m$Wa)
m1<-lm(y ~ x,data = df)
interpolated <- predict(m1, newdata = data.frame(x = detuned$Wang13))
detuned$Wang13_interpolated <- interpolated

print(knitr::kable(detuned,digits = 2,caption = 'Model output for additional mistuned intervals'))

rm(m1,df,interpolated)
rm(m,m2)
