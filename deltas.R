# deltas.R
## CALCULATE OUR PRIMING INTERVAL PAIRS
names_of_pairs <- c('m2P5','m2tt','m3M3','m6M6','M7P5','ttP5','m2M3','m2P5')
data_pairs <- data.frame(IntervalPairs=names_of_pairs)
data_pairs$Harmonicity_Delta[1]<-harmonicity$HarmonicityMean[1]- harmonicity$HarmonicityMean[7] # m2P5
data_pairs$Harmonicity_Delta[2]<-harmonicity$HarmonicityMean[1]- harmonicity$HarmonicityMean[6] # m2tt
data_pairs$Harmonicity_Delta[3]<-harmonicity$HarmonicityMean[4]- harmonicity$HarmonicityMean[3] # m3M3
data_pairs$Harmonicity_Delta[4]<-harmonicity$HarmonicityMean[9]- harmonicity$HarmonicityMean[8] # m6M6
data_pairs$Harmonicity_Delta[5]<-harmonicity$HarmonicityMean[11]-harmonicity$HarmonicityMean[7] # M7P5
data_pairs$Harmonicity_Delta[6]<-harmonicity$HarmonicityMean[6]- harmonicity$HarmonicityMean[7] # ttP5
data_pairs$Harmonicity_Delta[7]<-harmonicity$HarmonicityMean[1]- harmonicity$HarmonicityMean[4] # m2M3
data_pairs$Harmonicity_Delta[8]<-harmonicity$HarmonicityMean[2]- harmonicity$HarmonicityMean[7] # m2P5
data_pairs$Harmonicity_Delta<-abs(data_pairs$Harmonicity_Delta)

data_pairs$Roughness_Delta[1]<-roughness$RoughnessMean[1]- roughness$RoughnessMean[7] # m2P5
data_pairs$Roughness_Delta[2]<-roughness$RoughnessMean[1]- roughness$RoughnessMean[6] # m2tt
data_pairs$Roughness_Delta[3]<-roughness$RoughnessMean[4]- roughness$RoughnessMean[3] # m3M3
data_pairs$Roughness_Delta[4]<-roughness$RoughnessMean[9]- roughness$RoughnessMean[8] # m6M6
data_pairs$Roughness_Delta[5]<-roughness$RoughnessMean[11]-roughness$RoughnessMean[7] # M7P5
data_pairs$Roughness_Delta[6]<-roughness$RoughnessMean[6]- roughness$RoughnessMean[7] # ttP5
data_pairs$Roughness_Delta[7]<-roughness$RoughnessMean[1]- roughness$RoughnessMean[4] # m2M3
data_pairs$Roughness_Delta[8]<-roughness$RoughnessMean[2]- roughness$RoughnessMean[7] # m2P5
data_pairs

data_pairs$Empirical_Delta[1]<-empirical$EmpiricalMean[1]- empirical$EmpiricalMean[7] # m2P5
data_pairs$Empirical_Delta[2]<-empirical$EmpiricalMean[1]- empirical$EmpiricalMean[6] # m2tt
data_pairs$Empirical_Delta[3]<-empirical$EmpiricalMean[4]- empirical$EmpiricalMean[3] # m3M3
data_pairs$Empirical_Delta[4]<-empirical$EmpiricalMean[9]- empirical$EmpiricalMean[8] # m6M6
data_pairs$Empirical_Delta[5]<-empirical$EmpiricalMean[11]-empirical$EmpiricalMean[7] # M7P5
data_pairs$Empirical_Delta[6]<-empirical$EmpiricalMean[6]- empirical$EmpiricalMean[7] # ttP5
data_pairs$Empirical_Delta[7]<-empirical$EmpiricalMean[1]- empirical$EmpiricalMean[4] # m2M3
data_pairs$Empirical_Delta[8]<-empirical$EmpiricalMean[2]- empirical$EmpiricalMean[7] # m2P5
data_pairs$Empirical_Delta<-abs(data_pairs$Empirical_Delta)

print(knitr::kable(data_pairs,digits = 2))

data_pairs$Harm_D_Class <-cut(data_pairs$Harmonicity_Delta,breaks = c(0,median(data_pairs$Harmonicity_Delta),10),labels = c('Low','High'))
data_pairs$Rough_D_Class <-cut(data_pairs$Roughness_Delta,breaks = c(0,median(data_pairs$Roughness_Delta),10),labels = c('Low','High'))
data_pairs$Emp_D_Class <-cut(data_pairs$Empirical_Delta,breaks = c(0,median(data_pairs$Empirical_Delta),10),labels = c('Low','High'))

print(knitr::kable(data_pairs,digits = 2))

