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
