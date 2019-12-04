"""
Writes out a Latex description of the stdpopsim catalog to stdout.
"""
import stdpopsim


def main():

    print("\\begin{tabular}{lllll}")
    for species_id in ["homsap", "dromel", "aratha", "esccol"]:
        species = stdpopsim.get_species(species_id)
        escaped_id = species.id.replace("_", "\\_")
        species_header = f"{species.name} ({escaped_id})"
        print("\\hline")
        print("\\multicolumn{5}{l}{", species_header, "} \\\\")
        print("\\hline")
        # print(species.id)
        for model in species.models:
            # bibtex_key = "todo"
            escaped_id = model.id.replace("_", "\\_")
            print(escaped_id, end="& ")
            escaped_name = model.name.replace("&", "\\&")
            print(escaped_name, end="& ")
            # print(f"\\cite{{{bibtex_key}}} & ", end="")
            print("(TODO, 2010)", end="& ")
            print("10s", end="& ")
            print("1G ", end="")
            print("\\\\")
    print("\\end{tabular}{lllll}")


if __name__ == "__main__":
    main()
