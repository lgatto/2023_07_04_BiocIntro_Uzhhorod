library(tidyverse)

rna <- read_csv("data/rnaseq.csv")
class(rna)
dim(rna)
names(rna)

rna

select(rna, 
       age, sex)


## Select three columns/variables
## of interest
select(rna, 
       age, sex, tissue)

select(rna, 
       -age, -sex)

filter(rna, 
       sex == "Male")

filter(rna, 
       sex == "Female")
filter(rna, 
       sex != "Male")

unique(rna$infection)

filter(rna, 
       sex == "Male",
       infection == "InfluenzaA")


filter(rna, 
       sex == "Male" &
         infection == "InfluenzaA")


## find all observation that have
## a missing hsapiens_homolog_associated_gene_name
## Hint: is.na()

filter(rna, 
       is.na(hsapiens_homolog_associated_gene_name))

is.na(rna$hsapiens_homolog_associated_gene_name)




