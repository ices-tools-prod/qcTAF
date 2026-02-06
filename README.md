# TAF Checks

TAF complete analyses are characterized by the following criteria:

1. The main analysis folder must contain a `boot` folder. For older analyses, this folder may be named `bootstrap`.

2. The boot folder must contain a `DATA.bib` file, declaring the initial data used as a starting point in the analysis. The boot folder may also contain a `SOFTWARE.bib` file.

3. After running the TAF function `taf.boot()`, data files must be present in the `boot/data` folder, corresponding to the declarations in the `DATA.bib` file. Similarly, after running `taf.boot()`, software files must be present in the `boot/software` folder if a `SOFTWARE.bib` file exists.

4. The main analysis folder should contain TAF scripts named `data.R`, `model.R`, `output.R`, and `report.R`. These scripts may call other R scripts and/or dynamic reports with file extensions such as `*.qmd`, `*.Rmd`, or `*.rmd`. For some analyses, the model script may be named `method.R`.

5. R code should use relative paths rather than absolute paths.

6. After running the TAF function `source.all()`, data files should be present in the `data` folder and output files should be present in the `output` folder. The `model` folder may contain intermediate results, and the `report` folder may contain final formatted results. For some analyses, the model folder may be named `method`.

7. To make it easy for the scientific community to browse and review the main data and results from the analysis, the file formats CSV (`*.csv` for tables), PNG (`*.png` for raster images), and PDF (`*.pdf` for vector images) should be used. These file formats are easy to open on any computer and are also easy to view on GitHub.

The above criteria can be evaluated by examining files and folders without running or modifying any part of the analysis. In contrast, the following criteria (marked with *) are best evaluated by running the full analysis, which can take a long time to run and may require special software or user authorization, and in some edge cases make irreversible changes to files.

8.* Regardless of which data and result files are stored online on GitHub, it should be possible to clone the analysis to a local computer and perform a full clean before rerunning the analysis successfully. A full clean consists of running the TAF functions `clean.boot(force=TRUE)` for the boot folder and `clean()` for the folders produced by the TAF scripts. A successful rerun of the analysis consists of running taf.boot() and source.all() without errors, producing the same or similar results as the original analysis.

9.* The TAF scripts (`data.R`, `model.R`, `output.R`, `report.R`) should run sequentially, with each script starting by reading files from a previous step and ending by writing out files.

10.* The `data.R` script should create the data folder and write files into that folder. Likewise, the `model.R`, `output.R`, and `report.R` scripts should create and write into the corresponding folders.
