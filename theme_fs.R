theme_fs <- function(fs=18){

tt <- theme(axis.text = element_text(size=fs-1, colour=NULL)) + 
  theme(legend.text = element_text(size=fs, colour=NULL)) + 
  theme(legend.title = element_text(size=fs, colour=NULL)) + 
  theme(axis.title = element_text(size=fs, colour=NULL)) + 
  theme(legend.text = element_text(size=fs, colour=NULL))
return <- tt
}