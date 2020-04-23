library(ggplot2)
library(cowplot)

## define variables
infile_pop0="../data/HomSap_OutOfAfricaArchaicAdmixture_5R19_pop0_sizes.txt"
infile_pop1="../data/HomSap_OutOfAfricaArchaicAdmixture_5R19_pop1_sizes.txt"
infile_pop2="../data/HomSap_OutOfAfricaArchaicAdmixture_5R19_pop2_sizes.txt"
outfile="../display_items/HomSap_OutOfAfricaArchaicAdmixture_5R19_census_vs_IRC.pdf"
species="Homo sapiens"
pop0_name="(YRI)"
pop1_name="(CEU)"
pop2_name="(CHB)"
IRC="#bd0026"
census="black"


## plot
tab0 <- read.table(file=infile_pop0, h=T ,sep="\t")
tab1 <- read.table(file=infile_pop1, h=T ,sep="\t")
tab2 <- read.table(file=infile_pop2, h=T ,sep="\t")


tab0Y = subset(tab0,method == "census")
tab0Z = subset(tab0,method == "coal")


tab1Y = subset(tab1,method == "census")
tab1Z = subset(tab1,method == "coal")


tab2Y = subset(tab2,method == "census")
tab2Z = subset(tab2,method == "coal")


xMin = 10
xMax = max(c(tab0$x,tab1$x,tab2$x))
yMin = min(tab0Y$y, tab1Y$y, tab2Y$y)
yMax = max(tab0Y$y, tab1Y$y, tab2Y$y)


speciesPop <- bquote(italic(.(species)) ~ (.(pop0_name)))
p0A<-ggplot() +
  coord_cartesian(xlim=c(xMin,xMax),ylim=c(yMin,yMax)) +
  geom_step(data=tab0Y,aes(x=x, y=y),size=3,alpha=0.9, col=census, linetype=1) +
  geom_step(data=tab0Z,aes(x=x, y=y),size=3,alpha=0.7, col=IRC) +
  scale_x_continuous(trans='log10') +
  scale_y_continuous(trans='log10') +
  annotation_logticks(sides="b") +
  annotation_logticks(sides="l") +
  theme_classic(base_size = 24) +
  labs(x="", y="", title="", subtitle=pop0_name, colour="", fill="")+
  theme(axis.text.x = element_text(angle = 45,hjust = 0.5,vjust = 0.5)) 


p0B<-ggplot() +
  coord_cartesian(xlim=c(xMin,xMax),ylim=c(yMin,yMax)) +
  geom_step(data=tab1Y,aes(x=x, y=y),size=3,alpha=0.9, col=census, linetype=1) +
  geom_step(data=tab1Z,aes(x=x, y=y),size=3,alpha=0.7, col=IRC) +
  scale_x_continuous(trans='log10') +
  scale_y_continuous(trans='log10') +
  annotation_logticks(sides="b") +
  annotation_logticks(sides="l") +
  theme_classic(base_size = 24) +
  labs(x="", y="", title="", subtitle=pop1_name) +
  theme(axis.text.x = element_text(angle = 45,hjust = 0.5,vjust = 0.5)) +
  theme(axis.title.y=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank())


p0C<-ggplot() +
  coord_cartesian(xlim=c(xMin,xMax),ylim=c(yMin,yMax)) +
  geom_step(data=tab2Y,aes(x=x, y=y),size=3,alpha=0.9, col=census, linetype=1) +
  geom_step(data=tab2Z,aes(x=x, y=y),size=3,alpha=0.7, col=IRC) +
  scale_x_continuous(trans='log10') +
  scale_y_continuous(trans='log10') +
  annotation_logticks(sides="b") +
  annotation_logticks(sides="l") +
  theme_classic(base_size = 24) +
  labs(x="", y="", title="", subtitle=pop2_name) +
  theme(axis.text.x = element_text(angle = 45,hjust = 0.5,vjust = 0.5)) +
  theme(axis.title.y=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank())


pg<-plot_grid(p0A, p0B, p0C, ncol=3, rel_widths = c(1.25,1,1))
pg_custom<-ggdraw(add_sub(pg, expression(paste("Years ago")), vpadding=grid::unit(0,"lines"),y=6, x=0.535, vjust=5, size=30)) +
draw_label("Population size", x=0, y=0.51, vjust= 1.5, angle=90, size=30)
save_plot(outfile, pg_custom, base_height = 6, base_width = 14)

