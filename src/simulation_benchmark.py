"""
Run simulations and write timing/memory info to a CSV file.
"""
import tempfile
import sys
import os
import subprocess

import pandas as pd
import stdpopsim


def time_cmd(cmd, stdout=sys.stdout):
    """
    Runs the specified command line (a list suitable for subprocess.call)
    and writes the stdout to the specified file object.
    """
    if sys.platform == 'darwin':
        # on OS X, install gtime using `brew install gnu-time`
        time_cmd = "/usr/local/bin/gtime"
    else:
        time_cmd = "/usr/bin/time"
    full_cmd = [time_cmd, "-f%M %S %U"] + cmd
    with tempfile.TemporaryFile() as stderr:
        exit_status = subprocess.call(full_cmd, stderr=stderr, stdout=stdout)
        stderr.seek(0)
        if exit_status != 0:
            raise ValueError(
                "Error running '{}': status={}:stderr{}".format(
                    " ".join(cmd), exit_status, stderr.read()))

        split = stderr.readlines()[-1].split()
        # From the time man page:
        # M: Maximum resident set size of the process during its lifetime,
        #    in Kilobytes.
        # S: Total number of CPU-seconds used by the system on behalf of
        #    the process (in kernel mode), in seconds.
        # U: Total number of CPU-seconds that the process used directly
        #    (in user mode), in seconds.
        max_memory = int(split[0]) * 1024
        system_time = float(split[1])
        user_time = float(split[2])
    return user_time + system_time, max_memory


def main():

    num_samples = 100
    seed = 42

    data = {"species": [], "model": [], "cpu_time": [], "ram": [], "file_size": []}
    for species_id in ["PonAbe", "HomSap", "DroMel", "AraTha"]:
        species = stdpopsim.get_species(species_id)
        # Get the shortest chromosome
        chrom = sorted(species.genome.chromosomes, key=lambda x: x.length)[0]
        assert chrom.recombination_rate > 0
        for model in species.demographic_models:
            with tempfile.NamedTemporaryFile() as out:
                cmd = (
                    f"{species_id} -d {model.id} -c {chrom.id} {num_samples} "
                    f"-s {seed} -o {out.name}")
                cpu_time, ram = time_cmd(["stdpopsim"] + cmd.split())
                file_size = os.path.getsize(out.name)
                data["species"].append(species.id)
                data["model"].append(model.id)
                data["cpu_time"].append(cpu_time)
                data["ram"].append(ram)
                data["file_size"].append(file_size)

                df = pd.DataFrame(data)
                df.to_csv("data/benchmark.csv")
                print(df)


if __name__ == "__main__":
    main()
