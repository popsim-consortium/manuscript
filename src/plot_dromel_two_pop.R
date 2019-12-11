


####################### PLOTTING #############################
library(ggplot2)
library(cowplot)
library(RColorBrewer)


## read in data
setwd("~/Desktop/PopSim/figures/data/")
popsize_af <- read.csv("dromel_popsize_africa.csv")
popsize_eu <- read.csv("dromel_popsize_europe.csv")
tdiv <- read.csv("dromel_tdiv.csv")


## define custom palette for replicates
coal_col="gray30"
cPal_rep<-c("#66c2a4","#41b6c4","#225ea8")
cPal_legend<-c(coal_col, cPal_rep)

# change all year = 0 to year = 1 prior to log transform
popsize_af$x[popsize_af$x==0.0]<-1 
popsize_eu$x[popsize_eu$x==0.0]<-1

#y-axis on log scale and yMax the same for all
xMax = max(c(popsize_af$x, popsize_eu$x))
y0Min = min(popsize_af$y)
y0Max = max(popsize_af$y)
y1Min = min(popsize_eu$y)
y1Max = max(popsize_eu$y)


p0Z_data = subset(popsize_af,method == "census")
p0A_data = subset(popsize_af,method == "dadi")
p0B_data = subset(popsize_af,method == "fsc")
p0C_data = subset(popsize_af,method == "smcpp")

p1Z_data = subset(popsize_eu,method == "census")
p1A_data = subset(popsize_eu,method == "dadi")
p1B_data = subset(popsize_eu,method == "fsc")
p1C_data = subset(popsize_eu,method == "smcpp")

p2A_data = subset(tdiv, method == "dadi")
p2B_data = subset(tdiv, method == "fsc")
p2C_data = subset(tdiv, method == "smcpp")


#PLOT
species<-"D. melanogaster"
population<-"Africa"
speciesPop <- bquote(italic(.(species)) ~ (.(population)))
p0A<-ggplot(p0A_data, aes(x=x, y=y, group=interaction(rep), colour=rep)) +
  coord_cartesian(xlim=c(25,xMax),ylim=c(y0Min,y0Max)) +
  geom_step(data=p0Z_data,aes(x=x, y=y),size=2.5,alpha=1.0, col=coal_col) +
  geom_step(size=1.2, alpha=0.9, show.legend = FALSE) +
  scale_x_continuous(trans='log10') +
  scale_y_continuous(trans='log10') +
  annotation_logticks(sides="b") +
  annotation_logticks(sides="l") +
  scale_color_manual(values=cPal_rep) +
  guides(colour=guide_legend(keywidth=0.3,keyheight=0.21,default.unit="inch")) +
  theme_classic(base_size = 20) +
  labs(x="", y="", title=speciesPop, subtitle="dadi", colour="", fill="")+
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank())


p0B<-ggplot(p0B_data, aes(x=x, y=y, group=interaction(rep), colour=rep)) +
  coord_cartesian(xlim=c(25,xMax),ylim=c(y0Min,y0Max)) +
  geom_step(data=p0Z_data,aes(x=x, y=y),size=2.5,alpha=1.0, col=coal_col) +
  geom_step(size=1.2, alpha=0.9, show.legend = FALSE) +
  scale_x_continuous(trans='log10') +
  scale_y_continuous(trans='log10') +
  annotation_logticks(sides="b") +
  annotation_logticks(sides="l") +
  scale_color_manual(values=cPal_rep) +
  guides(colour=guide_legend(keywidth=0.3,keyheight=0.21,default.unit="inch")) +
  theme_classic(base_size = 20) +
  labs(x="", y="", title=" ", subtitle="fastsimcoal2") +
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank()) +
  theme(axis.title.y=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank())

p0C<-ggplot(p0C_data, aes(x=x, y=y, group=interaction(rep), colour=rep)) +
  coord_cartesian(xlim=c(25,xMax),ylim=c(y0Min,y0Max)) +
  geom_step(data=p0Z_data,aes(x=x, y=y),size=2.5,alpha=1.0, col=coal_col) +
  geom_step(size=1.2, alpha=0.9, show.legend = FALSE) +
  scale_x_continuous(trans='log10') +
  scale_y_continuous(trans='log10') +
  annotation_logticks(sides="b") +
  annotation_logticks(sides="l") +
  scale_color_manual(values=cPal_rep) +
  guides(colour=guide_legend(keywidth=0.3,keyheight=0.21,default.unit="inch")) +
  theme_classic(base_size = 20) +
  labs(x="", y="", title=" ", subtitle="smc++") +
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank()) +
  theme(axis.title.y=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank())



###############################################################################################
population<-"Europe"
speciesPop <- bquote((.(population)))
p1A<-ggplot(p1A_data, aes(x=x, y=y, group=interaction(rep), colour=rep)) +
  coord_cartesian(xlim=c(25,xMax),ylim=c(y1Min,y1Max)) +
  geom_step(data=p1Z_data,aes(x=x, y=y),size=2.5,alpha=1.0, col=coal_col) +
  geom_step(size=1.2, alpha=0.9, show.legend = FALSE) +
  scale_x_continuous(trans='log10') +
  scale_y_continuous(trans='log10') +
  annotation_logticks(sides="b") +
  annotation_logticks(sides="l") +
  scale_color_manual(values=cPal_rep) +
  guides(colour=guide_legend(keywidth=0.3,keyheight=0.21,default.unit="inch")) +
  theme_classic(base_size = 20) +
  labs(x="", y="", title=speciesPop) +
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank()) 

p1B<-ggplot(p1B_data, aes(x=x, y=y, group=interaction(rep), colour=rep)) +
  coord_cartesian(xlim=c(25,xMax),ylim=c(y1Min,y1Max)) +
  geom_step(data=p1Z_data,aes(x=x, y=y),size=2.5,alpha=1.0, col=coal_col) +
  geom_step(size=1.2, alpha=0.9, show.legend = FALSE) +
  scale_x_continuous(trans='log10') +
  scale_y_continuous(trans='log10') +
  annotation_logticks(sides="b") +
  annotation_logticks(sides="l") +
  scale_color_manual(values=cPal_rep) +
  guides(colour=guide_legend(keywidth=0.3,keyheight=0.21,default.unit="inch")) +
  theme_classic(base_size = 20) +
  labs(x="", y="", title=" ") +
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank()) +
  theme(axis.title.y=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank())


p1C<-ggplot(p1C_data, aes(x=x, y=y, group=interaction(rep), colour=rep)) +
  coord_cartesian(xlim=c(25,xMax),ylim=c(y1Min,y1Max)) +
  geom_step(data=p1Z_data,aes(x=x, y=y),size=2.5,alpha=1.0, col=coal_col) +
  geom_step(size=1.2, alpha=0.9, show.legend = FALSE) +
  scale_x_continuous(trans='log10') +
  scale_y_continuous(trans='log10') +
  annotation_logticks(sides="b") +
  annotation_logticks(sides="l") +
  scale_color_manual(values=cPal_rep) +
  guides(colour=guide_legend(keywidth=0.3,keyheight=0.21,default.unit="inch")) +
  theme_classic(base_size = 20) +
  labs(x="", y="", title=" ") +
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank()) +
  theme(axis.title.y=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank())


###############################################################################################
speciesPop <- "Divergence times"
p2A<-ggplot(p2A_data, aes(y=rep, x=x), colour = rep, group=interaction(rep)) +
  coord_cartesian(xlim=c(25,xMax)) +
  geom_point(col=rev(cPal_legend),cex=3)+
  scale_x_continuous(trans='log10') +
  annotation_logticks(sides="b") +
  scale_color_manual(values=cPal_rep) +
  guides(colour=guide_legend(keywidth=0.3,keyheight=0.21,default.unit="inch")) +
  theme_classic(base_size = 20) +
  labs(x="", y="", title=speciesPop) +
  theme(axis.text.x = element_text(angle = 45,hjust = 0.5,vjust = 0.5)) 

p2B<-ggplot(p2B_data, aes(y=rep, x=x), colour = rep, group=interaction(rep)) +
  coord_cartesian(xlim=c(25,xMax)) +
  geom_point(col=rev(cPal_legend), cex=3)+
  scale_x_continuous(trans='log10') +
  annotation_logticks(sides="b") +
  scale_color_manual(values=cPal_rep) +
  guides(colour=guide_legend(keywidth=0.3,keyheight=0.21,default.unit="inch")) +
  theme_classic(base_size = 20) +
  labs(x="", y="", title = " ") +
  theme(axis.text.x = element_text(angle = 45,hjust = 0.5,vjust = 0.5)) +
  theme(axis.title.y=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank())

p2C<-ggplot(p2C_data, aes(y=rep, x=x), colour = rep, group=interaction(rep)) +
  coord_cartesian(xlim=c(25,xMax)) +
  geom_point(col=rev(cPal_legend),cex=3)+
  scale_x_continuous(trans='log10') +
  annotation_logticks(sides="b") +
  scale_color_manual(values=cPal_rep) +
  guides(colour=guide_legend(keywidth=0.3,keyheight=0.21,default.unit="inch")) +
  theme_classic(base_size = 20) +
  labs(x="", y="", title = " ") +
  theme(axis.text.x = element_text(angle = 45,hjust = 0.5,vjust = 0.5)) +
  theme(axis.title.y=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank())


###PLOTSAVE
pg<-plot_grid(p0A, p0B, p0C, p1A, p1B, p1C, p2A, p2B, p2C, ncol=3, rel_widths = c(1.3,1,1), rel_heights = c(1,1,0.9))
pg_custom<-ggdraw(add_sub(pg, expression(paste("Years ago")), vpadding=grid::unit(0,"lines"),y=6, x=0.535, vjust=5, size=22)) +
  draw_label("Population size", x=0, y=0.51, vjust= 1.5, angle=90, size=22)
pg_custom

setwd("~/Desktop/PopSim/figures/")
save_plot("dromel_3mb_no_mask_3rep_anc_tdiv.pdf", pg_custom,base_height = 10 , base_width = 14)











