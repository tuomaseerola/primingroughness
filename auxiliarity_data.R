# auxiliarity_data.R
#setwd('/Users/tuomaseerola/Desktop/to_JASA/')

# Harmonicity 3 models: Harrison and Pearce 2018, Parncutt88, Milne13 
source('model_harmonicity_data.R')

# Roughness 3 models: Hutchinson, Vassilakis, Wang
source('model_roughness_data.R')

# Empirical data from Huron 94 and Bowling
source('empirical_data.R')

source('deltas.R')

# cor(empirical$EmpiricalMean,roughness$RoughnessMean) # 0.799
# cor(empirical$EmpiricalRank,roughness$RoughnessRank,method = "spearman") # 0.61
# 
# cor(empirical$EmpiricalMean,harmonicity$HarmonicityMean) # -0.618
# cor(empirical$EmpiricalRank,harmonicity$HarmonicityRank,method = "spearman") # -0.745
# 
# cor(roughness$RoughnessMean,harmonicity$HarmonicityMean) # -0.440
# cor(roughness$RoughnessRank,harmonicity$HarmonicityRank,method = "spearman") # -0.463

# Stimulus spectra. The stimuli were available, and now we have created a 
source('figure_stimuli.R') # Completed in 1 December 2020

