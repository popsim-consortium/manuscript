"""
Writes out a Latex description of the stdpopsim catalog to stdout.
"""
import stdpopsim
import pandas as pd
import humanize


def main():

    df = pd.read_csv("data/benchmark.csv")
    df.set_index(["species", "model"])

    print("\\begin{tabular}{lllll}")
    for species_id in ["homsap", "dromel", "aratha"]:
        species = stdpopsim.get_species(species_id)
        escaped_id = species.id.replace("_", "\\_")
        species_header = f"{species.name} ({escaped_id})"
        print("\\hline")
        print("\\multicolumn{5}{l}{", species_header, "} \\\\")
        print("\\hline")
        # print(species.id)
        for model in species.models:
            row = df[(df.species == species.id) & (df.model == model.id)]
            cpu_time = float(row.cpu_time)
            ram = humanize.naturalsize(float(row.ram))
            # Not currently used.
            # file_size = humanize.naturalsize(float(row.file_size))
            # bibtex_key = "todo"
            escaped_id = model.id.replace("_", "\\_")
            print(escaped_id, end="& ")
            escaped_name = model.name.replace("&", "\\&")
            print(escaped_name, end="& ")
            # print(f"\\cite{{{bibtex_key}}} & ", end="")
            print("[x]", end="& ")
            print("{:.1f}s".format(cpu_time), end="& ")
            print(ram, end="")
            print("\\\\")
    print("\\end{tabular}")


if __name__ == "__main__":
    main()
