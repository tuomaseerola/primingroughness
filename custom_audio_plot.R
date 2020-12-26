custom_audio_plot <-function(audio=NULL,F0=NULL,title=NULL,fs=44100,maxHz=3200,minAmpl=-130){

  
  font<-"Palatino"
  
  #print(F0)
  ## SETTINGS
  library(ggplot2)
  source('~/Documents/computational/R/theme_fs.R')
  custom_theme_size <- theme_fs(13)
  
  sac <- spec(audio,f=fs,wl = 512,plot = FALSE,dB = 'A')
  SAC <- data.frame(Hz=sac[,1]*1000,Amplitude=sac[,2])
  SAC$Name<-NA
  for (k in 1:length(F0)) {
#    ind <- round(SAC$Hz)==round(F0[k])  # Old 
    ind<-which.min(abs(SAC$Hz - F0[k]))
    SAC$Name[ind]<-round(F0[k],1)
#    print(tail(SAC))
  }

  XTICK<-c(200,400,800,1600,3200)
    
  g1b<-ggplot(SAC,aes(x=Hz,y=Amplitude,label=Name))+
    geom_line(colour='black')+ # darkslateblue in SciReports
    scale_x_continuous(limits = c(160,maxHz),breaks = XTICK,expand = c(0.01,0.1),trans = 'log')+
    scale_y_continuous(limits = c(minAmpl,0),expand = c(0.01,0.01))+
#    geom_label(colour='white',fill='darkred',position=position_jitter())+
#    geom_text_repel(colour='red',segment.color='red')+ # ,fill='darkred'
    geom_label_repel(
      nudge_y      = 0.01,
      direction    = "both",
      angle        = 90,
      vjust        = 0.1,
      hjust        = 0.1,
      size         = 2.75,
      box.padding  = 0.75,
      segment.size = 0.3,
      label.padding=0.2,
      fill         = 'white',
      alpha        = 0.75,
      family       =font,
      color        = 'black'
      )+
    theme_bw()+
    ylab('Amplitude (dB-A)')+
    xlab('Frequency (Hz)')+
    custom_theme_size+
    ggtitle(title)+
    theme(plot.title = element_text(hjust = 0.5))+
    theme(text=element_text(family=font))
  
  #g1b
  
  t<-0:(length(audio)-1)/fs
  audio_mono <- tuneR::mono(audio,which = 'both')
  WAV<-data.frame(Amplitude=audio_mono@left,Time=t)
  
  g1a<-ggplot(WAV,aes(x=Time,y=Amplitude))+
    geom_line(colour='black',alpha=0.50)+ # was darkslategray4 in SciReports
    theme_bw()+
    scale_x_continuous(expand = c(0.01,0.01))+
    scale_y_continuous(breaks = seq(-0.50,0.50,by=0.25))+
    ylab('Amplitude')+
    xlab('Time (s)')+
    custom_theme_size+
    ggtitle(title)+
    theme(plot.title = element_text(hjust = 0.5))+
    theme(text=element_text(family=font))
  #g1a
  
  
  return<-list(g1a,g1b)
}