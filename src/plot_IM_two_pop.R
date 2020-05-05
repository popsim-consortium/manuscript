
####################### PLOTTING #############################
library(ggplot2)
library(cowplot)
library(RColorBrewer)


## read in data
setwd("~/Desktop/PopSim/figures/data/")
popsize_1 <- read.csv("IM_popsize_pop1.csv")
popsize_2 <- read.csv("IM_popsize_pop2.csv")
tdiv <- read.csv("IM_tdiv.csv")


## define custom palette for replicates
coal_col="gray30"
cPal_rep<-c("#66c2a4","#41b6c4","#225ea8")
cPal_legend<-c(coal_col, cPal_rep)

# change all year = 0 to year = 1 prior to log transform
popsize_1$x[popsize_1$x==0.0]<-1 
popsize_2$x[popsize_2$x==0.0]<-1

#y-axis on log scale and yMax the same for all
xMax = max(c(popsize_1$x, popsize_2$x))
y0Min = min(popsize_1$y)
y0Max = max(popsize_1$y)
y1Min = min(popsize_2$y)
y1Max = max(popsize_2$y)


p0Z_data = subset(popsize_1,method == "census")
p0A_data = subset(popsize_1,method == "dadi")
p0B_data = subset(popsize_1,method == "fsc")
p0C_data = subset(popsize_1,method == "smcpp")

p1Z_data = subset(popsize_2,method == "census")
p1A_data = subset(popsize_2,method == "dadi")
p1B_data = subset(popsize_2,method == "fsc")
p1C_data = subset(popsize_2,method == "smcpp")

p2A_data = subset(tdiv, method == "dadi")
p2B_data = subset(tdiv, method == "fsc")
p2C_data = subset(tdiv, method == "smcpp")



#PLOT
speciesPop <- "Population 1"
p0A<-ggplot(p0A_data, aes(x=x, y=y, group=interaction(rep), colour=rep)) +
  coord_cartesian(xlim=c(25,xMax),ylim=c(y0Min,y0Max)) +
  geom_step(data=p0Z_data,aes(x=x, y=y),size=3.3,alpha=1.0, col=coal_col) +
  geom_step(size=2, alpha=0.9, show.legend = FALSE) +
  scale_x_continuous(trans='log10', breaks=c(1e2,1e3,1e4,1e5,1e6)) +
  scale_y_continuous(trans='log10', breaks=c(5e3,1e4,2e4), labels=scales::scientific) +
  annotation_logticks(sides="b") +
  annotation_logticks(sides="l") +
  scale_color_manual(values=cPal_rep) +
  guides(colour=guide_legend(keywidth=0.3,keyheight=0.21,default.unit="inch")) +
  theme_classic(base_size = 24) +
  labs(x="", y="", title=speciesPop, subtitle="dadi", colour="", fill="")+
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank())


p0B<-ggplot(p0B_data, aes(x=x, y=y, group=interaction(rep), colour=rep)) +
  coord_cartesian(xlim=c(25,xMax),ylim=c(y0Min,y0Max)) +
  geom_step(data=p0Z_data,aes(x=x, y=y),size=3.3,alpha=1.0, col=coal_col) +
  geom_step(size=2, alpha=0.9, show.legend = FALSE) +
  scale_x_continuous(trans='log10', breaks=c(1e2,1e3,1e4,1e5,1e6)) +
  scale_y_continuous(trans='log10', breaks=c(5e3,1e4,2e4), labels=scales::scientific) +
  annotation_logticks(sides="b") +
  annotation_logticks(sides="l") +
  scale_color_manual(values=cPal_rep) +
  guides(colour=guide_legend(keywidth=0.3,keyheight=0.21,default.unit="inch")) +
  theme_classic(base_size = 24) +
  labs(x="", y="", title=" ", subtitle="fastsimcoal2") +
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank()) +
  theme(axis.title.y=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank())

p0C<-ggplot(p0C_data, aes(x=x, y=y, group=interaction(rep), colour=rep)) +
  coord_cartesian(xlim=c(25,xMax),ylim=c(y0Min,y0Max)) +
  geom_step(data=p0Z_data,aes(x=x, y=y),size=3.3,alpha=1.0, col=coal_col) +
  geom_step(size=2, alpha=0.9, show.legend = FALSE) +
  scale_x_continuous(trans='log10', breaks=c(1e2,1e3,1e4,1e5,1e6)) +
  scale_y_continuous(trans='log10', breaks=c(5e3,1e4,2e4), labels=scales::scientific) +
  annotation_logticks(sides="b") +
  annotation_logticks(sides="l") +
  scale_color_manual(values=cPal_rep) +
  guides(colour=guide_legend(keywidth=0.3,keyheight=0.21,default.unit="inch")) +
  theme_classic(base_size = 24) +
  labs(x="", y="", title=" ", subtitle="smc++") +
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank()) +
  theme(axis.title.y=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank())



###############################################################################################
speciesPop <- "Population 2"
p1A<-ggplot(p1A_data, aes(x=x, y=y, group=interaction(rep), colour=rep)) +
  coord_cartesian(xlim=c(25,xMax),ylim=c(y1Min,y1Max)) +
  geom_step(data=p1Z_data,aes(x=x, y=y),size=3.3,alpha=1.0, col=coal_col) +
  geom_step(size=2, alpha=0.9, show.legend = FALSE) +
  scale_x_continuous(trans='log10', breaks=c(1e2,1e3,1e4,1e5,1e6)) +
  scale_y_continuous(trans='log10', breaks=c(5e3,1e4,2e4,1e5), labels=scales::scientific) +
  annotation_logticks(sides="b") +
  annotation_logticks(sides="l") +
  scale_color_manual(values=cPal_rep) +
  guides(colour=guide_legend(keywidth=0.3,keyheight=0.21,default.unit="inch")) +
  theme_classic(base_size = 24) +
  labs(x="", y="", title=speciesPop) +
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank()) 

p1B<-ggplot(p1B_data, aes(x=x, y=y, group=interaction(rep), colour=rep)) +
  coord_cartesian(xlim=c(25,xMax),ylim=c(y1Min,y1Max)) +
  geom_step(data=p1Z_data,aes(x=x, y=y),size=3.3,alpha=1.0, col=coal_col) +
  geom_step(size=2, alpha=0.9, show.legend = FALSE) +
  scale_x_continuous(trans='log10', breaks=c(1e2,1e3,1e4,1e5,1e6)) +
  scale_y_continuous(trans='log10', breaks=c(5e3,1e4,2e4,5e4), labels=scales::scientific) +
  annotation_logticks(sides="b") +
  annotation_logticks(sides="l") +
  scale_color_manual(values=cPal_rep) +
  guides(colour=guide_legend(keywidth=0.3,keyheight=0.21,default.unit="inch")) +
  theme_classic(base_size = 24) +
  labs(x="", y="", title=" ") +
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank()) +
  theme(axis.title.y=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank())


p1C<-ggplot(p1C_data, aes(x=x, y=y, group=interaction(rep), colour=rep)) +
  coord_cartesian(xlim=c(25,xMax),ylim=c(y1Min,y1Max)) +
  geom_step(data=p1Z_data,aes(x=x, y=y),size=3.3,alpha=1.0, col=coal_col) +
  geom_step(size=2, alpha=0.9, show.legend = FALSE) +
  scale_x_continuous(trans='log10', breaks=c(1e2,1e3,1e4,1e5,1e6)) +
  scale_y_continuous(trans='log10', breaks=c(5e3,1e4,2e4,5e4), labels=scales::scientific) +
  annotation_logticks(sides="b") +
  annotation_logticks(sides="l") +
  scale_color_manual(values=cPal_rep) +
  guides(colour=guide_legend(keywidth=0.3,keyheight=0.21,default.unit="inch")) +
  theme_classic(base_size = 24) +
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
  geom_point(col=rev(cPal_legend),cex=4)+
  scale_x_continuous(trans='log10', breaks=c(1e2,1e3,1e4,1e5,1e6)) +
  annotation_logticks(sides="b") +
  scale_color_manual(values=cPal_rep) +
  guides(colour=guide_legend(keywidth=0.3,keyheight=0.21,default.unit="inch")) +
  theme_classic(base_size = 24) +
  labs(x="", y="", title=speciesPop) +
  theme(axis.text.x = element_text(angle = 45,hjust = 0.5,vjust = 0.5)) 

p2B<-ggplot(p2B_data, aes(y=rep, x=x), colour = rep, group=interaction(rep)) +
  coord_cartesian(xlim=c(25,xMax)) +
  geom_point(col=rev(cPal_legend), cex=4)+
  scale_x_continuous(trans='log10', breaks=c(1e2,1e3,1e4,1e5,1e6)) +
  annotation_logticks(sides="b") +
  scale_color_manual(values=cPal_rep) +
  guides(colour=guide_legend(keywidth=0.3,keyheight=0.21,default.unit="inch")) +
  theme_classic(base_size = 24) +
  labs(x="", y="", title = " ") +
  theme(axis.text.x = element_text(angle = 45,hjust = 0.5,vjust = 0.5)) +
  theme(axis.title.y=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank())

p2C<-ggplot(p2C_data, aes(y=rep, x=x), colour = rep, group=interaction(rep)) +
  coord_cartesian(xlim=c(25,xMax)) +
  geom_point(col=rev(cPal_legend),cex=4)+
  scale_x_continuous(trans='log10', breaks=c(1e2,1e3,1e4,1e5,1e6)) +
  annotation_logticks(sides="b") +
  scale_color_manual(values=cPal_rep) +
  guides(colour=guide_legend(keywidth=0.3,keyheight=0.21,default.unit="inch")) +
  theme_classic(base_size = 24) +
  labs(x="", y="", title = " ") +
  theme(axis.text.x = element_text(angle = 45,hjust = 0.5,vjust = 0.5)) +
  theme(axis.title.y=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank())


###PLOTSAVE
pg<-plot_grid(p0A, p0B, p0C, p1A, p1B, p1C, p2A, p2B, p2C, ncol=3, rel_widths = c(1.3,1,1), rel_heights = c(1,1,0.9))
pg_custom<-ggdraw(add_sub(pg, expression(paste("Years ago")), vpadding=grid::unit(0,"lines"),y=6, x=0.535, vjust=5, size=30)) +
  draw_label(expression(paste("Population size ", italic("N(t)"))), x=0, y=0.67, vjust= 1.5, angle=90, size=28)
#pg_custom

setwd("~/Desktop/PopSim/figures/")
save_plot("generic_IM.pdf", pg_custom, base_height = 10 , base_width = 14)



















