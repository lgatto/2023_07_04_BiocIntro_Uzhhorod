library(tidyverse)

rna_mini <- 
  read_csv("data/rnaseq.csv") |> 
  select(gene, sample, expression) |> 
  head(10)

rna_mini

download.file(url = "https://carpentries-incubator.github.io/bioc-intro/data/annot1.csv",
              destfile = "data/annot1.csv")
annot1 <- read_csv(file = "data/annot1.csv")
annot1

full_join(rna_mini, annot1)


download.file(url = "https://carpentries-incubator.github.io/bioc-intro/data/annot2.csv",
              destfile = "data/annot2.csv")
annot2 <- read_csv(file = "data/annot2.csv")
annot2

full_join(rna_mini, 
          annot2, 
          by = 
            c("gene" = 
              "external_gene_name"))


## Ex: 

annot3 <- read_csv("data/annot3.csv")

full_join(rna_mini, 
          annot3)

left_join(rna_mini, 
           annot3)

right_join(rna_mini, 
           annot3)

inner_join(rna_mini, 
           annot3)

## Ex: use full_join() 
## and ... to get the 
## same result as 
## inner_join()

full_join(rna_mini, 
          annot3) |> 
  filter(!is.na(expression)) |> 
  filter(!is.na(gene_description))

full_join(rna_mini, 
          annot3) |> 
  na.exclude()

full_join(rna_mini, 
          annot3) |> 
  na.omit()

full_join(rna_mini, 
          annot3) |> 
  drop_na()

rna_mini[1, 3] <- NA

full_join(rna_mini, 
          annot3) |> 
  drop_na()

anyNA(annot3)
anyNA(rna_mini)

## More about joins:
## https://uclouvain-cbio.github.io/WSBIM1207/sec-join.html

