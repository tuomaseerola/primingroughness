# plot_curves.R

df<-data.frame(x=1,y=2)

arrow_size <- 1.50
arrow_colour<-'grey50'
library(latex2exp)
font<-"Palatino"

eqn <-'$\\Delta = 1.70$ (Low)'
g1 <-ggplot(df,aes(x=x,y=y))+
  geom_curve(aes(x = x, y = y, xend = x+1, yend = y-1), colour=arrow_colour, size=arrow_size,data = df, curvature = 0.2,arrow = arrow(length = unit(0.3, "inches")),show.legend = FALSE)+
  scale_y_continuous(limits = c(0,2))+
  scale_x_continuous(limits = c(0,2))+
  geom_label(x = 1,y=2,label='Roughness = 2.70',size=5,hjust=0.5,family=font)+
  annotate("text",x = 2, y=0.75, label = TeX(eqn, output="character"),hjust=1,parse=TRUE,size=4.5,family=font) +
  theme_void()
##g1

eqn2 <-'$\\Delta = 9.00$ (High)'
g2 <-ggplot(df,aes(x=x,y=y))+
  geom_curve(aes(x = x, y = y, xend = x-1, yend = y-1), colour=arrow_colour, size=arrow_size, data = df, curvature = -0.2,arrow = arrow(length = unit(0.3, "inches")),show.legend = FALSE)+
  geom_curve(aes(x = x, y = y, xend = x+1, yend = y-1), colour=arrow_colour, size=arrow_size, data = df, curvature =  0.2,arrow = arrow(length = unit(0.3, "inches")),show.legend = FALSE)+
  scale_y_continuous(limits = c(0,2))+
  scale_x_continuous(limits = c(0,2))+
  geom_label(x = 1,y=2,label='Roughness = 1.00',size=5,hjust=0.5,family=font)+
#  annotate("text",x = 0, y=0.75, label = TeX(eqn1, output="character"),hjust=0,parse=TRUE) +
  annotate("text",x = 2, y=0.75, label = TeX(eqn2, output="character"),hjust=1,parse=TRUE,size=4.5,family=font) +
  theme_void()
##g2

eqn3b <-'$\\Delta = 5.34$ (High)'
g3 <-ggplot(df,aes(x=x,y=y))+
  geom_curve(aes(x = x, y = y, xend = x-1, yend = y-1), colour=arrow_colour, size=arrow_size, data = df, curvature = -0.2,arrow = arrow(length = unit(0.3, "inches")),show.legend = FALSE)+
  geom_curve(aes(x = x, y = y, xend = x+1, yend = y-1), colour=arrow_colour, size=arrow_size,data = df, curvature = 0.2,arrow = arrow(length = unit(0.3, "inches")),show.legend = FALSE)+
  scale_y_continuous(limits = c(0,2))+
  scale_x_continuous(limits = c(0,2))+
  geom_label(x = 1,y=2,label='Roughness = 10.00',size=5,hjust=0.5,family=font)+
#  annotate("text",x = 0, y=0.75, label = TeX(eqn3a, output="character"),hjust=0,parse=TRUE) +
  annotate("text",x = 2, y=0.75, label = TeX(eqn3b, output="character"),hjust=1,parse=TRUE,size=4.5,family=font) +
  theme_void()
##g3

#eqn <-'$\\delta = 0.1$'
g4 <-ggplot(df,aes(x=x,y=y))+
  geom_curve(aes(x = x, y = y, xend = x-1, yend = y-1), colour=arrow_colour, size=arrow_size, data = df, curvature = -0.2,arrow = arrow(length = unit(0.3, "inches")),show.legend = FALSE)+
  scale_y_continuous(limits = c(0,2))+
  scale_x_continuous(limits = c(0,2))+
  geom_label(x = 1,y=2,label='Roughness = 4.66',size=5,hjust=0.5,family=font)+
#  annotate("text",x = 0, y=0.75, label = TeX(eqn, output="character"),hjust=0,parse=TRUE) +
  theme_void()
#g4


#library("cowplot")

#G0<-plot_grid(g1,g2,g3,g4,ncol = 4, nrow = 1)
#G0

