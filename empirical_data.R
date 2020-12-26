# empirical_data.R

### TASK 2
# We could ignore any model and rely on empirical observations about 
# intervals and their perceived dissonances, 
# collected numerous times (refs here, Kameoka Kuriuokawa... TUOMAS WILL CHECK),
# but using this data would yield identical predictions to roughness models. Use Huron 94

d <- read.csv('huron_data.csv',header = TRUE)

library(incon)
b <- inconData::bowl18

## rescale
d2<-data.frame(Interval=d$Interval)
d2$Malm18<-scales::rescale(-d$malmberg,to=c(1,10))
d2$Hutch79<-scales::rescale(d$hutchinson,to=c(1,10))
d2$Kame69<-scales::rescale(d$kameoka,to=c(1,10))
d2$Bowl18<-scales::rescale(-b[1:11,]$rating,to=c(1,10))
d2
d2$EmpiricalMean <- rowMeans(d2[,2:5])
d2$EmpiricalRank <-rank(d2$EmpiricalMean)

print(knitr::kable(d2,digits = 2,caption = 'Empirical ratings (normalised to 1-10)'))
print(knitr::kable(cor(d2[,2:4]),digits = 2,caption = 'Correlations'))

empirical<-d2
rm(b,d,d2)





