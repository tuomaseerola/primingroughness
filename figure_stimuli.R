# figure_stimuli.R
# TE 30 November 2020

# Choose three pairs
#  a=smallest delta : ttP5   two sounds and roughness delta visualised
#  b=middle delta   : m2M3
#  c=maximum delta  : m2P5

library(seewave)
library(tuneR)
fs<-44100

tt <- readMP3("../stimuli/Interval06.mp3")
P5 <- readMP3("../stimuli/Interval07.mp3")
m2 <- readMP3("../stimuli/Interval01.mp3")
M3 <- readMP3("../stimuli/Interval04.mp3")


tt<-tuneR::normalize(tt,unit="1",center = TRUE,level = 1)
P5<-tuneR::normalize(P5,unit="1",center = TRUE,level = 1)
m2<-tuneR::normalize(m2,unit="1",center = TRUE,level = 1)
M3<-tuneR::normalize(M3,unit="1",center = TRUE,level = 1)


library(ggplot2)
library(ggrepel)
source('theme_fs.R')
custom_theme_size <- theme_fs(13)
source('custom_audio_plot.R')

####### PAIR 1 a
Title_a <-"TT {0, 6}"
f1<-hrep::midi_to_freq(60-3)
f2<-hrep::midi_to_freq(66-3)
f0_a<-c(f1,f2)

####### PAIR 1 b
Title_b <- "P5 {0,7}"
f1<-hrep::midi_to_freq(60-4)  # 
f2<-hrep::midi_to_freq(67-4)  # 
f0_b<-c(f1,f2)

####### PAIR 1 c
Title_c <- "m2 {0,1}"
f1<-hrep::midi_to_freq(60-1)  # 
f2<-hrep::midi_to_freq(61-1)  # 
f0_c<-c(f1,f2)

####### PAIR 1 d
Title_d <- "M3 {0,4}"
f1<-hrep::midi_to_freq(60-2)  # 
f2<-hrep::midi_to_freq(64-2)  # 
f0_d<-c(f1,f2)
f0_d

tt_plot <- custom_audio_plot(audio=tt,F0=f0_a,title=Title_a,maxHz=2000,minAmpl=-100)
P5_plot <- custom_audio_plot(audio=P5,F0=f0_b,title=Title_b,maxHz=2000,minAmpl=-100)
m2_plot <- custom_audio_plot(audio=m2,F0=f0_c,title=Title_c,maxHz=2000,minAmpl=-100)
M3_plot <- custom_audio_plot(audio=M3,F0=f0_d,title=Title_d,maxHz=2000,minAmpl=-100)

#M3_plot[[1]]
#M3_plot[[2]]

library("cowplot")

G2<-plot_grid(tt_plot[[1]], P5_plot[[1]], m2_plot[[1]],M3_plot[[1]], 
              tt_plot[[2]], P5_plot[[2]], m2_plot[[2]], M3_plot[[2]],
#              labels = c("A1", "A2", "A3", "B1", "B2", "B3"),
              ncol = 4, nrow = 2)
print(G2)
#ggsave("spectra.pdf", G2,height = 7,width = 14)

source('plot_curves.R')
G3 <- plot_grid(tt_plot[[1]], P5_plot[[1]], m2_plot[[1]],M3_plot[[1]], 
              tt_plot[[2]], P5_plot[[2]], m2_plot[[2]], M3_plot[[2]],
              g1,g2,g3,g4,
              #              labels = c("A1", "A2", "A3", "B1", "B2", "B3"),
              ncol = 4, nrow = 3)
G3
#ggsave("spectra_explanation.pdf", G3,height = 11,width = 14)
