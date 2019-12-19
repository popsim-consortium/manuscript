"""
Writes out a Latex description of the stdpopsim catalog to stdout.
"""
import stdpopsim
import pandas as pd
import bibtexparser


def get_bibtex_key(bibtex_str, output):
    bib_database = bibtexparser.loads(bibtex_str)
    entry = bib_database.entries[0]
    author = entry["author"].split(",")[0].lower()
    year = entry["year"]
    title = entry["title"].split()[0].split("-")[0].lower()
    key = f"{author}{year}{title}"
    entry["ID"] = key
    writer = bibtexparser.bwriter.BibTexWriter()
    output.write(writer.write(bib_database))
    return key


def main():

    df = pd.read_csv("data/benchmark.csv")
    df.set_index(["species", "model"])
    # Using decimal values here as it's easier than explaining what a real mibibyte is
    megabyte = 10**6

    with open("model_refs.bib", "w") as model_refs:
        header = (
            "\\begin{tabular}{lllS[table-format=3.1]S[table-format=3.1]"
            "S[table-format=2.1]}")
        print(header)
        print("\\toprule")
        print("& Model ID & Citation & ")
        for j, title in enumerate(["CPU(s)", "RAM(MB)", "File(MB)"]):
            print("\\multicolumn{1}{c}{", title, "} ")
            if j < 2:
                print("&")
        print("\\\\")
        for species_id in ["HomSap", "DroMel", "AraTha", "PonPyg"]:
            species = stdpopsim.get_species(species_id)
            escaped_id = species.id.replace("_", "\\_")
            species_header = f"{escaped_id} (\\emph{{{species.name}}})"
            print("\\midrule")
            print("\\multicolumn{6}{l}{", species_header, "} \\\\")
            sorted_models = sorted(
                species.demographic_models, key=lambda x: len(x.id))
            for model in sorted_models:
                row = df[(df.species == species.id) & (df.model == model.id)]
                cpu_time = float(row.cpu_time)
                ram = float(row.ram) / megabyte
                file_size = float(row.file_size) / megabyte
                bibtex = model.citations[0].fetch_bibtex()
                bibtex_key = get_bibtex_key(bibtex, model_refs)
                # bibtex_key = "ragsdale2019models"
                escaped_id = model.id.replace("_", "\\_")
                print("&")
                print(escaped_id, end="& ")
                print(f"\\cite{{{bibtex_key}}} & ", end="")
                print("{:.1f}".format(cpu_time), end="& ")
                print("{:.1f}".format(ram), end="& ")
                print("{:.1f}".format(file_size), end="")
                print("\\\\")
        print("\\bottomrule")
        print("\\end{tabular}")


if __name__ == "__main__":
    main()
