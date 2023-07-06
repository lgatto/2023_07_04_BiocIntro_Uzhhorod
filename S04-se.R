library(SummarizedExperiment)

## assay
count_matrix <- 
  read.csv("data/count_matrix.csv",
         row.names = 1) |> 
  as.matrix()

class(count_matrix)
dim(count_matrix)
head(rownames(count_matrix))
head(colnames(count_matrix))

## colData
coldata <- read.csv("data/sample_metadata.csv")
View(coldata)
dim(coldata)

identical(coldata$sample,
          colnames(count_matrix))

## rowData
rowdata <- read.csv("data/gene_metadata.csv")
dim(rowdata)
View(rowdata)

identical(rownames(count_matrix),
          rowdata$gene)

## create SE

se <- SummarizedExperiment(
  assay = count_matrix,
  colData = coldata,
  rowData = rowdata
)

se
class(se)

## save/load

saveRDS(se, "data/se.rds")

rm(se)

se <- readRDS("data/se.rds")

dim(assay(se))
class(assay(se))

colData(se)

rowData(se)


dim(se)

se1 <- se[1:5, 1:2]

colData(se1)
rowData(se1)

## Create a new SE containing
## only infected samples and 
## miRNA (see gene_biotype) 

colData(se)$infection
se$infection == "InfluenzaA"

names(rowData(se))

table(rowData(se)$gene_biotype)

rowData(se)$gene_biotype == "miRNA"

se[rowData(se)$gene_biotype == "miRNA", 
   se$infection == "InfluenzaA"]


## Extract the gene expression 
## levels of the 3 first genes 
## in samples at time 0 and at 
## time 8.

colData(se)$time

assay(se[1:3, se$time %in% c(0, 8)])

## Ex: extract the counts for
## our selected_genes and sample
## from time 8 and 0

rownames(se)

assay(se[selected_genes, 
         se$time %in% c(0, 8)])

## Add to col/rowData
names(colData(se))

se$operator <- 
  rep(c("Julia", "Luisa"),
    each = 11)

colData(se) |> 
  as.data.frame() |> 
  View()

pv <- runif(nrow(se))

rowData(se)$pvalue <- pv

rowData(se)$pvalue

boxplot(log(assay(se) + 1))

## Next steps SE:
## https://carpentries-incubator.github.io/bioc-rnaseq/


