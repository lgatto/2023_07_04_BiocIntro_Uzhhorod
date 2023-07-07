## Exercice

1. Install the `rWSBIM1322` package with the following command.

```
BiocManager::install("rWSBIM1322")
```
  Do not run the installation command in your R markdown file as it
  would download and install the package every time you knit the Rmd file.

2. Load the `cptac_se` data with

```
data(cptac_se)
```

3. Familiarise yourself with the data. What class is it? How many
   samples/features? Check the feature and sample annotations.

4. Proteins are identified/quantified by several peptides. Create a
   vector of protein names for the proteins that have at least 15
   peptides.

5. Visualise the intensity distributions of peptides intensities for
   each protein in each sample, making sure to discern sample from
   groups 6A and 6B.
