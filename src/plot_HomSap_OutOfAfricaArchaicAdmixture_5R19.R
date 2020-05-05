library(ggplot2)
library(cowplot)

## define variables
infile_pop0="../data/HomSap_OutOfAfricaArchaicAdmixture_5R19_pop0_sizes.txt"
infile_pop1="../data/HomSap_OutOfAfricaArchaicAdmixture_5R19_pop1_sizes.txt"
infile_pop2="../data/HomSap_OutOfAfricaArchaicAdmixture_5R19_pop2_sizes.txt"
outfile="../display_items/HomSap_OutOfAfricaArchaicAdmixture_5R19.pdf"
pop0_name="YRI"
pop1_name="CEU"
pop2_name="CHB"
method1_name="SMC++"
method2_name="stairway plot"
method3_name="MSMC (n = 2)"
method4_name="MSMC (n = 8)"
method1_id="smcpp"
method2_id="sp"
method3_id="msmc_2"
method4_id="msmc_8"
truth_color="gray30"
replicate_colors<-c("#66c2a4","#41b6c4","#225ea8")

## plot
cPal_legend<-c(truth_color, replicate_colors)

tab0 <- read.table(file=infile_pop0, h=T ,sep="\t")
tab1 <- read.table(file=infile_pop1, h=T ,sep="\t")
tab2 <- read.table(file=infile_pop2, h=T ,sep="\t")

tab0$x[tab0$x==0.0]<-1
tab1$x[tab1$x==0.0]<-1
tab2$x[tab2$x==0.0]<-1

xMin = 10
xMax = max(c(tab0$x,tab1$x,tab2$x))
y0Min = min(tab0$y)
y0Max = max(tab0$y)
y1Min = min(tab1$y)
y1Max = max(tab1$y)
y2Min = min(tab2$y)
y2Max = max(tab2$y)

tab0A = subset(tab0,method == method1_id)
tab0B = subset(tab0,method == method2_id)
tab0C = subset(tab0,method == method3_id)
tab0D = subset(tab0,method == method4_id)
tab0Y = subset(tab0,method == "census")
tab0Z = subset(tab0,method == "coal")

tab1A = subset(tab1,method == method1_id)
tab1B = subset(tab1,method == method2_id)
tab1C = subset(tab1,method == method3_id)
tab1D = subset(tab1,method == method4_id)
tab1Y = subset(tab1,method == "census")
tab1Z = subset(tab1,method == "coal")

tab2A = subset(tab2,method == method1_id)
tab2B = subset(tab2,method == method2_id)
tab2C = subset(tab2,method == method3_id)
tab2D = subset(tab2,method == method4_id)
tab2Y = subset(tab2,method == "census")
tab2Z = subset(tab2,method == "coal")

p0A<-ggplot(tab0A, aes(x=x, y=y, group=interaction(rep), colour=rep)) +
  coord_cartesian(xlim=c(xMin,xMax),ylim=c(y0Min,y0Max)) +
  geom_step(data=tab0Z,aes(x=x, y=y),size=3.3,alpha=1.0, col=truth_color) +
  geom_step(size=2, alpha=0.9, show.legend = FALSE) +
  scale_x_continuous(trans='log10') +
  scale_y_continuous(trans='log10') +
  annotation_logticks(sides="b") +
  annotation_logticks(sides="l") +
  scale_color_manual(values=replicate_colors) +
  guides(colour=guide_legend(keywidth=0.3,keyheight=0.21,default.unit="inch")) +
  theme_classic(base_size = 24) +
  labs(x="", y="", title="", subtitle=method1_name, colour="", fill="")+
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank(),
        plot.subtitle = element_text(size = 28))

p0B<-ggplot(tab0B, aes(x=x, y=y, group=interaction(rep), colour=rep)) +
  coord_cartesian(xlim=c(xMin,xMax),ylim=c(y0Min,y0Max)) +
  geom_step(data=tab0Z,aes(x=x, y=y),size=3.3,alpha=1.0, col=truth_color) +
  geom_step(size=2, alpha=0.9, show.legend = FALSE) +
  scale_x_continuous(trans='log10') +
  scale_y_continuous(trans='log10') +
  annotation_logticks(sides="b") +
  annotation_logticks(sides="l") +
  scale_color_manual(values=replicate_colors) +
  guides(colour=guide_legend(keywidth=0.3,keyheight=0.21,default.unit="inch")) +
  theme_classic(base_size = 24) +
  labs(x="", y="", title="", subtitle=method2_name) +
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank()) +
  theme(axis.title.y=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank(),
        plot.subtitle = element_text(size = 28))

p0C<-ggplot(tab0C, aes(x=x, y=y, group=interaction(rep), colour=rep)) +
  coord_cartesian(xlim=c(xMin,xMax),ylim=c(y0Min,y0Max)) +
  geom_step(data=tab0Z,aes(x=x, y=y),size=3.3,alpha=1.0, col=truth_color) +
  geom_step(size=2, alpha=0.9, show.legend = FALSE) +
  scale_x_continuous(trans='log10') +
  scale_y_continuous(trans='log10') +
  annotation_logticks(sides="b") +
  annotation_logticks(sides="l") +
  scale_color_manual(values=replicate_colors) +
  guides(colour=guide_legend(keywidth=0.3,keyheight=0.21,default.unit="inch")) +
  theme_classic(base_size = 24) +
  labs(x="", y="", title="", subtitle=method3_name) +
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank()) +
  theme(axis.title.y=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank(),
        plot.subtitle = element_text(size = 28))

p0D<-ggplot(tab0D, aes(x=x, y=y, group=interaction(rep), colour=rep)) +
  coord_cartesian(xlim=c(xMin,xMax),ylim=c(y0Min,y0Max)) +
  geom_step(data=tab0Z,aes(x=x, y=y),size=3.3,alpha=1.0, col=truth_color) +
  geom_step(size=2, alpha=0.9, show.legend = FALSE) +
  scale_x_continuous(trans='log10') +
  scale_y_continuous(trans='log10') +
  annotation_logticks(sides="b") +
  annotation_logticks(sides="l") +
  scale_color_manual(values=replicate_colors) +
  guides(colour=guide_legend(keywidth=0.3,keyheight=0.21,default.unit="inch")) +
  theme_classic(base_size = 24) +
  labs(x="", y="", title="", subtitle=method4_name) +
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank()) +
  theme(axis.title.y=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank(),
        plot.subtitle = element_text(size = 28)) 

speciesPop <- bquote((.(pop1_name)))
p1A<-ggplot(tab1A, aes(x=x, y=y, group=interaction(rep), colour=rep)) +
  coord_cartesian(xlim=c(xMin,xMax),ylim=c(y1Min,y1Max)) +
  geom_step(data=tab1Z,aes(x=x, y=y),size=3.3,alpha=1.0, col=truth_color) +
  geom_step(size=2, alpha=0.9, show.legend = FALSE) +
  scale_x_continuous(trans='log10') +
  scale_y_continuous(trans='log10') +
  annotation_logticks(sides="b") +
  annotation_logticks(sides="l") +
  scale_color_manual(values=replicate_colors) +
  guides(colour=guide_legend(keywidth=0.3,keyheight=0.21,default.unit="inch")) +
  theme_classic(base_size = 24) +
  labs(x="", y="", title="") +
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank())

p1B<-ggplot(tab1B, aes(x=x, y=y, group=interaction(rep), colour=rep)) +
  coord_cartesian(xlim=c(xMin,xMax),ylim=c(y1Min,y1Max)) +
  geom_step(data=tab1Z,aes(x=x, y=y),size=3.3,alpha=1.0, col=truth_color) +
  geom_step(size=2, alpha=0.9, show.legend = FALSE) +
  scale_x_continuous(trans='log10') +
  scale_y_continuous(trans='log10') +
  annotation_logticks(sides="b") +
  annotation_logticks(sides="l") +
  scale_color_manual(values=replicate_colors) +
  guides(colour=guide_legend(keywidth=0.3,keyheight=0.21,default.unit="inch")) +
  theme_classic(base_size = 24) +
  labs(x="", y="", title="") +
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank())+
  theme(axis.title.y=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank())

p1C<-ggplot(tab1C, aes(x=x, y=y, group=interaction(rep), colour=rep)) +
  coord_cartesian(xlim=c(xMin,xMax),ylim=c(y1Min,y1Max)) +
  geom_step(data=tab1Z,aes(x=x, y=y),size=3.3,alpha=1.0, col=truth_color) +
  geom_step(size=2, alpha=0.9, show.legend = FALSE) +
  scale_x_continuous(trans='log10') +
  scale_y_continuous(trans='log10') +
  annotation_logticks(sides="b") +
  annotation_logticks(sides="l") +
  scale_color_manual(values=replicate_colors) +
  guides(colour=guide_legend(keywidth=0.3,keyheight=0.21,default.unit="inch")) +
  theme_classic(base_size = 24) +
  labs(x="", y="", title="") +
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank())+
  theme(axis.title.y=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank())

p1D<-ggplot(tab1D, aes(x=x, y=y, group=interaction(rep), colour=rep)) +
  coord_cartesian(xlim=c(xMin,xMax),ylim=c(y1Min,y1Max)) +
  geom_step(data=tab1Z,aes(x=x, y=y),size=3.3,alpha=1.0, col=truth_color) +
  geom_step(size=2, alpha=0.9, show.legend = FALSE) +
  scale_x_continuous(trans='log10') +
  scale_y_continuous(trans='log10') +
  annotation_logticks(sides="b") +
  annotation_logticks(sides="l") +
  scale_color_manual(values=replicate_colors) +
  guides(colour=guide_legend(keywidth=0.3,keyheight=0.21,default.unit="inch")) +
  theme_classic(base_size = 24) +
  labs(x="", y="", title="") +
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank())+
  theme(axis.title.y=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank())

speciesPop <- bquote((.(pop2_name)))
p2A<-ggplot(tab2A, aes(x=x, y=y, group=interaction(rep), colour=rep)) +
  coord_cartesian(xlim=c(xMin,xMax),ylim=c(y2Min,y2Max)) +
  geom_step(data=tab2Z,aes(x=x, y=y),size=3.3,alpha=1.0, col=truth_color) +
  geom_step(size=2, alpha=0.9, show.legend = FALSE) +
  scale_x_continuous(trans='log10') +
  scale_y_continuous(trans='log10') +
  annotation_logticks(sides="b") +
  annotation_logticks(sides="l") +
  scale_color_manual(values=replicate_colors) +
  guides(colour=guide_legend(keywidth=0.3,keyheight=0.21,default.unit="inch")) +
  theme_classic(base_size = 24) +
  labs(x="", y="", title="") +
  theme(axis.text.x = element_text(angle = 45,hjust = 0.5,vjust = 0.5)) 

p2B<-ggplot(tab2B, aes(x=x, y=y, group=interaction(rep), colour=rep)) +
  coord_cartesian(xlim=c(xMin,xMax),ylim=c(y2Min,y2Max)) +
  geom_step(data=tab2Z,aes(x=x, y=y),size=3.3,alpha=1.0, col=truth_color) +
  geom_step(size=2, alpha=0.9, show.legend = FALSE) +
  scale_x_continuous(trans='log10') +
  scale_y_continuous(trans='log10') +
  annotation_logticks(sides="b") +
  annotation_logticks(sides="l") +
  scale_color_manual(values=replicate_colors) +
  guides(colour=guide_legend(keywidth=0.3,keyheight=0.21,default.unit="inch")) +
  theme_classic(base_size = 24) +
  labs(x="", y="", title="") +
  theme(axis.text.x = element_text(angle = 45,hjust = 0.5,vjust = 0.5)) +
  theme(axis.title.y=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank())

p2C<-ggplot(tab2C, aes(x=x, y=y, group=interaction(rep), colour=rep)) +
  coord_cartesian(xlim=c(xMin,xMax),ylim=c(y2Min,y2Max)) +
  geom_step(data=tab2Z,aes(x=x, y=y),size=3.3,alpha=1.0, col=truth_color) +
  geom_step(size=2, alpha=0.9, show.legend = FALSE) +
  scale_x_continuous(trans='log10') +
  scale_y_continuous(trans='log10') +
  annotation_logticks(sides="b") +
  annotation_logticks(sides="l") +
  scale_color_manual(values=replicate_colors) +
  guides(colour=guide_legend(keywidth=0.3,keyheight=0.21,default.unit="inch")) +
  theme_classic(base_size = 24) +
  labs(x="", y="", title="") +
  theme(axis.text.x = element_text(angle = 45,hjust = 0.5,vjust = 0.5))+
  theme(axis.title.y=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank())

p2D<-ggplot(tab2D, aes(x=x, y=y, group=interaction(rep), colour=rep)) +
  coord_cartesian(xlim=c(xMin,xMax),ylim=c(y2Min,y2Max)) +
  geom_step(data=tab2Z,aes(x=x, y=y),size=3.3,alpha=1.0, col=truth_color) +
  geom_step(size=2, alpha=0.9, show.legend = FALSE) +
  scale_x_continuous(trans='log10') +
  scale_y_continuous(trans='log10') +
  annotation_logticks(sides="b") +
  annotation_logticks(sides="l") +
  scale_color_manual(values=replicate_colors) +
  guides(colour=guide_legend(keywidth=0.3,keyheight=0.21,default.unit="inch")) +
  theme_classic(base_size = 24) +
  labs(x="", y="", title="") +
  theme(axis.text.x = element_text(angle = 45,hjust = 0.5,vjust = 0.5))+
  theme(axis.title.y=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank())

pg<-plot_grid(p0A, p0B, p0C, p0D, p1A, p1B, p1C, p1D, p2A, p2B, p2C, p2D, ncol=4, rel_widths = c(1.38,1,1,1), rel_heights = c(1.055,1,1.21))
pg_custom<-ggdraw(add_sub(pg, expression(paste("Years ago")), vpadding=grid::unit(0,"lines"),y=6, x=0.55, vjust=5, size=28)) +
  draw_label(expression("Population size "*italic(N)*"(t)"), x=0, y=0.52, vjust= 1.25, angle=90, size=28)
save_plot(outfile, pg_custom, base_height = 18 , base_width = 14)

