

setwd("/Users/christopherkyriazis/Desktop/PopSim/analysis_04302020/analysis/two_population_analysis/homsap_results_full_genome")



######## Read in dadi and fsc files ##########
simulated_genome_length <- 2681441344.0 # genome length for humans chr 1-22 with masking
dadi <- read.table("Results/best_dadi_runs.txt", header=T)
dadi$Na <- dadi$theta/(4*1.29e-08*simulated_genome_length)
dadi$N1 <- dadi$nu1*dadi$Na
dadi$N2 <- dadi$nu2*dadi$Na
dadi$TDIV <- dadi$T*dadi$Na*25*2
dadi$MIG12 <- dadi$m1/(dadi$Na*2)
dadi$MIG21 <- dadi$m2/(dadi$Na*2)

fsc <- read.table("Results/best_fsc_runs.txt", header=T)
fsc$Na = fsc$ANCSIZE/2
fsc$N1 = fsc$NPOP2/2
fsc$N2 = fsc$NPOP1/2
fsc$TDIV = fsc$TDIV*25



######### create dataframes in the format for plotting ########

num_reps <- 3

plot_df_af <- data.frame(matrix(ncol = 4, nrow = 0))
colnames(plot_df_af) <- c("x", "y", "method", "rep")

plot_df_eu <- data.frame(matrix(ncol = 4, nrow = 0))
colnames(plot_df_eu) <- c("x", "y", "method", "rep")

step_size <- -1000

# need to set some arbitrary time (years ago) to begin plotting the dadi and fsc trajectories 
t_start <- 1250000

#### Add dadi output from Africa pop

for(i in 1:num_reps){
  
  dadi_x_pre_split <- seq(from=t_start, to=dadi$TDIV[i], by=step_size)
  dadi_x <- c(dadi_x_pre_split, seq(from=dadi$TDIV[i], to = 0, by = step_size))
  dadi_y_Na <- rep(x=dadi$Na[i], times=length(dadi_x_pre_split) )
  dadi_y_N1 <- c(dadi_y_Na, rep(x=dadi$N1[i], times=length(dadi_x)-length(dadi_x_pre_split)))
  
  start_row <- dim(plot_df_af)[1]
  end_row <- start_row + length(dadi_x)-1
  
  index <- 1
  for(j in start_row:end_row){
    
    x <- dadi_x[index]
    y <- dadi_y_N1[index]
    method <- "dadi"
    rep <- paste("r",i,sep="")
    
    row <- data.frame(x,y,method,rep)
    names(row)<-c("x", "y", "method", "rep")
    
    plot_df_af <- rbind(plot_df_af, row)
    
    index <- index + 1
  }
  ## add point where x=0
  x <- 0
  y <- dadi$N1[i]
  method <- "dadi"
  rep <- paste("r",i,sep="")
  
  row <- data.frame(x,y,method,rep)
  names(row)<-c("x", "y", "method", "rep")
  plot_df_af <- rbind(plot_df_af, row)
}

#### Add dadi output from Europe pop

for(i in 1:num_reps){
  
  dadi_x_pre_split <- seq(from=t_start, to=dadi$TDIV[i], by=step_size)
  dadi_x <- c(dadi_x_pre_split, seq(from=dadi$TDIV[i], to = 0, by =step_size))
  dadi_y_Na <- rep(x=dadi$Na[i], times=length(dadi_x_pre_split) )
  dadi_y_N2 <- c(dadi_y_Na, rep(x=dadi$N2[i], times=length(dadi_x)-length(dadi_x_pre_split)))
  
  start_row <- dim(plot_df_eu)[1]
  end_row <- start_row + length(dadi_x)-1
  
  index <- 1
  for(j in start_row:end_row){
    
    x <- dadi_x[index]
    y <- dadi_y_N2[index]
    method <- "dadi"
    rep <- paste("r",i,sep="")
    
    row <- data.frame(x,y,method,rep)
    names(row)<-c("x", "y", "method", "rep")
    
    plot_df_eu <- rbind(plot_df_eu, row)
    
    index <- index + 1
  }
  ## add point where x=0
  x <- 0
  y <- dadi$N2[i]
  method <- "dadi"
  rep <- paste("r",i,sep="")
  
  row <- data.frame(x,y,method,rep)
  names(row)<-c("x", "y", "method", "rep")
  plot_df_eu <- rbind(plot_df_eu, row)
}



#### Add fsc output from Africa pop

for(i in 1:num_reps){
  fsc_x_pre_split <- seq(from=t_start, to=fsc$TDIV[i], by=step_size)
  fsc_x <- c(fsc_x_pre_split, seq(from=fsc$TDIV[i], to = 0, by = step_size))
  fsc_y_Na <- rep(x=fsc$Na[i], times=length(fsc_x_pre_split) )
  fsc_y_N1 <- c(fsc_y_Na, rep(x=fsc$N1[i], times=length(fsc_x)-length(fsc_x_pre_split)))
  
  start_row <- dim(plot_df_af)[1]
  end_row <- start_row + length(fsc_x)-1
  
  index <- 1
  for(j in start_row:end_row){
    
    x <- fsc_x[index]
    y <- fsc_y_N1[index]
    method <- "fsc"
    rep <- paste("r",i,sep="")
    
    row <- data.frame(x,y,method,rep)
    names(row)<-c("x", "y", "method", "rep")
    
    plot_df_af <- rbind(plot_df_af, row)
    
    index <- index + 1
  }
  ## add point where x=0
  x <- 0
  y <- fsc$N1[i]
  method <- "fsc"
  rep <- paste("r",i,sep="")
  
  row <- data.frame(x,y,method,rep)
  names(row)<-c("x", "y", "method", "rep")
  plot_df_af <- rbind(plot_df_af, row)
}



#### Add fsc output from Europe pop

for(i in 1:num_reps){
  fsc_x_pre_split <- seq(from=t_start, to=fsc$TDIV[i], by=step_size)
  fsc_x <- c(fsc_x_pre_split, seq(from=fsc$TDIV[i], to = 0, by = step_size))
  fsc_y_Na <- rep(x=fsc$Na[i], times=length(fsc_x_pre_split) )
  fsc_y_N2 <- c(fsc_y_Na, rep(x=fsc$N2[i], times=length(fsc_x)-length(fsc_x_pre_split)))
  
  start_row <- dim(plot_df_eu)[1]
  end_row <- start_row + length(fsc_x)-1
  
  index <- 1
  for(j in start_row:end_row){
    
    x <- fsc_x[index]
    y <- fsc_y_N2[index]
    method <- "fsc"
    rep <- paste("r",i,sep="")
    
    row <- data.frame(x,y,method,rep)
    names(row)<-c("x", "y", "method", "rep")
    
    plot_df_eu <- rbind(plot_df_eu, row)
    
    index <- index + 1
  }
  x <- 0
  y <- fsc$N2[i]
  method <- "fsc"
  rep <- paste("r",i,sep="")
  
  row <- data.frame(x,y,method,rep)
  names(row)<-c("x", "y", "method", "rep")
  plot_df_eu <- rbind(plot_df_eu, row)
}



###### Read in smcpp output and add to df

### read in data for africa pop
smc1_af <- read.csv(file ="Intermediate/1358822686/split/joint.csv")
smc1_af <- subset(smc1_af, label =='pop1')
smc1_af <- smc1_af[ -c(1,4,5)]
smc1_af$x <- smc1_af$x*25
smc1_af$method <- "smcpp"
smc1_af$rep <- "r1"
max(smc1_af$x)


smc2_af <- read.csv(file ="Intermediate/1675701734/split/joint.csv")
smc2_af <- subset(smc2_af, label =='pop1')
smc2_af <- smc2_af[ -c(1,4,5)]
smc2_af$x <- smc2_af$x*25
smc2_af$method <- "smcpp"
smc2_af$rep <- "r2"

smc3_af <- read.csv(file ="Intermediate/1845187043//split/joint.csv")
smc3_af <- subset(smc3_af, label =='pop1')
smc3_af <- smc3_af[ -c(1,4,5)]
smc3_af$x <- smc3_af$x*25
smc3_af$method <- "smcpp"
smc3_af$rep <- "r3"

plot_df_af_2 <- rbind(plot_df_af, smc1_af, smc2_af, smc3_af)



### read in data for europe pop

#first rep
smc1_eu <- read.csv(file ="Intermediate/1358822686/split/joint.csv")
smc1_eu <- subset(smc1_eu, label =='pop2')
smc1_eu <- smc1_eu[ -c(1,4,5)]
smc1_eu$x <- smc1_eu$x*25
smc1_eu$method <- "smcpp"
smc1_eu$rep <- "r1"
# append more ancient demography from africa pop
smc1_anc <- subset(smc1_af, smc1_af$x >max(smc1_eu$x) )
smc1_eu_anc <- rbind(smc1_eu,smc1_anc)

# second rep
smc2_eu <- read.csv(file ="Intermediate/1675701734/split/joint.csv")
smc2_eu <- subset(smc2_eu, label =='pop2')
smc2_eu <- smc2_eu[ -c(1,4,5)]
smc2_eu$x <- smc2_eu$x*25
smc2_eu$method <- "smcpp"
smc2_eu$rep <- "r2"
# append more ancient demography from africa pop
smc2_anc <- subset(smc2_af, smc2_af$x >max(smc2_eu$x) )
smc2_eu_anc <- rbind(smc2_eu,smc2_anc)

#third rep
smc3_eu <- read.csv(file ="Intermediate/1845187043//split/joint.csv")
smc3_eu <- subset(smc3_eu, label =='pop2')
smc3_eu <- smc3_eu[ -c(1,4,5)]
smc3_eu$x <- smc3_eu$x*25
smc3_eu$method <- "smcpp"
smc3_eu$rep <- "r3"
# append more ancient demography from africa pop
smc3_anc <- subset(smc3_af, smc3_af$x >max(smc3_eu$x) )
smc3_eu_anc <- rbind(smc3_eu,smc3_anc)

plot_df_eu_2 <- rbind(plot_df_eu, smc1_eu_anc, smc2_eu_anc, smc3_eu_anc)




########### Add truth to df ###########

N_A <- 7300
N_B <- 2100
N_AF <- 12300
N_EU0 <- 1000
T_AF <- 220e3
T_B <- 140e3 
T_EU_AS <- 21.2e3 
r_EU = 0.004
N_EU = N_EU0 / exp(-r_EU/25 * T_EU_AS)
step_size_truth <- -50

### census size for africa pop

truth_x_af <- seq(from=t_start, to = 0, by = step_size_truth)
truth_y_af <- rep(x=N_A, times = -(t_start-T_AF)/step_size_truth )
truth_y_af <- c(truth_y_af, rep(x=N_AF, times = -T_AF/step_size_truth+1))
truth_df_af <- data.frame(truth_x_af,truth_y_af)

colnames(truth_df_af) <- c("x", "y")
truth_df_af$method <- "census"
truth_df_af$rep <- "r1"

plot_df_af_3 <- rbind(plot_df_af_2, truth_df_af)


### census size for eu pop after split

truth_x_eu <- seq(from=t_start, to = 0, by = step_size_truth)

truth_y_eu <- rep(x=N_A, times = -(t_start-T_AF)/step_size_truth )
truth_y_eu <- c(truth_y_eu, rep(x=N_AF, times = -(T_AF-T_B)/step_size_truth))
truth_y_eu <- c(truth_y_eu, rep(x=N_B, times = -(T_B-T_EU_AS)/step_size_truth))
truth_y_eu <- c(truth_y_eu, N_EU0)

N_EU <- N_EU0
for(i in 1:(-T_EU_AS/step_size_truth)){
  N_EU <- N_EU / exp(-r_EU/25 * -step_size_truth)
  truth_y_eu <- c(truth_y_eu, N_EU)
}

truth_df_eu <- data.frame(truth_x_eu,truth_y_eu)

colnames(truth_df_eu) <- c("x", "y")
truth_df_eu$method <- "census"
truth_df_eu$rep <- "r1"

plot_df_eu_3 <- rbind(plot_df_eu_2, truth_df_eu)



### write csv of pop size trajectories
setwd("~/Desktop/PopSim/figures/data/")

write.csv(plot_df_eu_3,"homsap_popsize_europe.csv", row.names=FALSE)
write.csv(plot_df_af_3,"homsap_popsize_africa.csv", row.names=FALSE)



### make data frames of divergence times
dadi_tdiv = data.frame(c(dadi$TDIV[1:3],T_B ), c("rep1","rep2", "rep3", "truth"), c("dadi","dadi","dadi","dadi"))
colnames(dadi_tdiv) <- c("x","rep", "method")

fsc_tdiv = data.frame(c(fsc$TDIV[1:3],T_B ), c("rep1","rep2", "rep3", "truth"), c("fsc","fsc","fsc","fsc"))
colnames(fsc_tdiv) <- c("x","rep", "method")

smcpp_tdiv = data.frame(c(max(smc1_eu$x), max(smc2_eu$x), max(smc3_eu$x),T_B ), c("rep1","rep2", "rep3", "truth"), c("smcpp","smcpp","smcpp","smcpp"))
colnames(smcpp_tdiv) <- c("x","rep", "method")

div_times <- rbind(dadi_tdiv, fsc_tdiv, smcpp_tdiv)

### write csv of div times
setwd("~/Desktop/PopSim/figures/data/")
write.csv(div_times, "homsap_tdiv.csv", row.names=FALSE)





