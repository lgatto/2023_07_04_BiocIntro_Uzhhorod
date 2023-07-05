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

## filter males
## select gene tissue age sex

rna2 <- filter(rna, sex == "Male")
rna3 <- select(rna2, gene, tissue, age, sex)
rna3

select(filter(rna, sex == "Male"),
       gene, tissue, age, sex)

rna |> 
  select(gene, tissue, age, sex) |> 
  filter(sex == "Male")

## Ex:

rna |> 
  filter(sex == "Female", 
         time == 0,
         expression > 50000) |> 
  select(gene, sample, time, 
         expression, age)

## mutate(rna, ...)

rna |> 
  mutate(time_hours = time * 24) |> 
  select(time, time_hours)

rna |> 
  mutate(time_hours = time * 24,
         time_min = time_hours * 60) |> 
  select(time, time_hours, time_min)

log(rna$expression)
  
rna |> 
  filter(rna$expression > 10000) ## NOT!!

rna |> 
  filter(expression > 10000)

## Ex

rna2 <- rna |> 
  mutate(log_expression = log(expression)) |> 
  filter(log_expression > 5,
         !is.na(phenotype_description),
         chromosome_name %in% c("X", "Y")) |> 
  select(gene, chromosome_name, 
         phenotype_description, 
         sample, expression) 

rna |> 
  group_by(gene)

rna |> 
  group_by(sample)

rna |> 
  group_by(gene) |> 
  summarise(mean_exp = mean(expression))

rna |> 
  group_by(gene) |> 
  summarise(mean_exp = mean(expression),
            min_exp = min(expression),
            max_exp = max(expression))


rna |> 
  group_by(sample) |> 
  summarise(mean_exprs_in_sample = 
              mean(expression))
rna |> 
  group_by(gene,
           infection,
           time) |> 
  summarise(
    mean_expr = mean(expression)
  )


rna |> 
  filter(gene == "Dok3") |> 
  group_by(time) |> 
  summarise(mean_exp = mean(expression))


table(rna$infection)

rna |> 
  count(infection)

rna |> 
  group_by(infection) |> 
  summarise(n = n())

rna |> 
  count(infection, 
        time)


rna |> 
  count(infection, 
        time) |> 
  arrange(time)

rna |> 
  count(infection, 
        time) |> 
  arrange(desc(time))

## Ex:

rna |> 
  count(sample)

rna |> 
  count(sample) |> 
  pull(n) |> 
  unique()

rna |> 
  count(gene)

View(rna)

rna |> 
  group_by(sample) |> 
  summarise(depth = sum(expression)) |> 
  arrange(desc(depth))

rna |> 
  group_by(sample) |> 
  summarise(depth = sum(expression)) |> 
  filter(depth == max(depth))
rna |> 
  group_by(sample) |> 
  summarise(depth = sum(expression)) |> 
  filter(depth == min(depth))

rna |> 
  group_by(sample) |> 
  summarise(depth = sum(expression)) |> 
  pull(depth) |> 
  summary()

## Reshaping data

rna_exp <- rna |> 
  select(sample, gene, expression)
rna_exp  

rna_wide <- 
  rna_exp |> 
  pivot_wider(names_from = sample,
              values_from = expression)

dim(rna_wide)  
names(rna_wide)  

View(rna_wide) 

rna_long <- 
  rna_wide |> 
  pivot_longer(
    names_to = "samples",
    values_to = "expression",
    -gene
  )

View(rna_long)  

rna_wide |> 
  pivot_longer(
    names_to = "samples",
    values_to = "expression",
    -1 ## 2:23
  )

rna_wide |> 
  pivot_longer(
    names_to = "samples",
    values_to = "expression",
    GSM2545336:GSM2545380
  )

rna_wide |> 
  pivot_longer(
    names_to = "samples",
    values_to = "expression",
    starts_with("GSM")
  )




