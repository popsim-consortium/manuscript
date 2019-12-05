import pandas
import seaborn as sns
import matplotlib
from matplotlib import pyplot as plt
import numpy as np
import subprocess



dadi_infile = "dmel_n50_LSTP_joint_3Mb_no_mask/Results/best_dadi_runs.txt"
fsc_infile = "dmel_n50_LSTP_joint_3Mb_no_mask/Results/best_fsc_runs.txt"
simulated_genome_length = 3000000.0

outfile = "dromel_migration_rates.pdf"


dadi = pandas.read_csv(dadi_infile, skiprows=0, sep="\t")
dadi['A-Na'] = dadi['theta']/(4*8.4e-9*simulated_genome_length)
dadi['A-N2'] = dadi['nu2']*dadi['A-Na']
dadi['A-N1'] = dadi['nu1']*dadi['A-Na']
dadi['A-TDIV'] = dadi['T']*dadi['A-Na']*2
dadi['A-MIG_EU_AF'] = dadi['m1']/(dadi['A-Na']*2)
dadi['A-MIG_AF_EU'] = dadi['m2']/(dadi['A-Na']*2)
dadi = dadi[0:3]

fsc = pandas.read_csv(fsc_infile, skiprows=0, sep="\t")
fsc['A-Na'] = fsc['ANCSIZE']/2
fsc['A-N1'] = fsc['NPOP2']/2
fsc['A-N2'] = fsc['NPOP1']/2
fsc['A-TDIV'] = fsc['TDIV']
fsc['A-MIG_EU_AF'] =fsc['MIG12']
fsc['A-MIG_AF_EU'] =fsc['MIG21']
fsc = fsc[0:3]


f, ax = plt.subplots(figsize=(10, 10))
truth_M = pandas.DataFrame(np.array([[0,0]]), columns=['A-MIG_EU_AF','A-MIG_AF_EU'])

data_M = fsc[['A-MIG_EU_AF','A-MIG_AF_EU']]
data_M=data_M.append(dadi[['A-MIG_EU_AF','A-MIG_AF_EU']], sort=True)
data_M=data_M.append(truth_M, sort=True)
num_sims = dadi.shape[0]
data_M['method']=['fastsimcoal2']*num_sims+['dadi']*num_sims+['truth']
data_M=data_M.reset_index(drop=True).reset_index()
data_M_long=pandas.wide_to_long(df=data_M,stubnames=["A"],i='index',j='parameter',sep="-",suffix='(\d+|\w+)').reset_index().rename(columns={'A':'estimate','method':'method'})

sns.stripplot(data=data_M_long,x='parameter',y='estimate', hue='method', jitter=0.1, palette='muted', size=10, linewidth=1)
ax.set_title("Migration rate estimates for DroMel OutOfAfrica_2L06 model",fontsize=18)
ax.set_xlabel("Parameter",fontsize=20)
ax.set_ylabel("Estimate",fontsize=20)
ax.tick_params(labelsize=14)
plt.ticklabel_format(style='sci', axis='y')
plt.setp(ax.get_legend().get_texts(), fontsize='16')
plt.setp(ax.get_legend().get_title(), fontsize='18')
ax.set(ylim=(-1e-7, 1e-6))
f.savefig(outfile, bbox_inches='tight', alpha=0.8)
