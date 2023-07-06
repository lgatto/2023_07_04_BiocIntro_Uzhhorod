library(ggplot2)
library(tidyverse)


ggplot(data = rna, 
       mapping = aes(x = expression)) +
  geom_histogram()

## 1. data
## 2. mapping 
## 3. geom 

## Ex: visualise log(expression + 1)
## 1. mutate()
## 2. set the mapping to log(expression + 1)
## 3. Represent the un-transformed expression 
##    on the log10 scale; see scale_x_log10(). 
##    Compare it with the previous graph. Why 
##    do you now have warning messages 
##    appearing?

rna |> 
  mutate(lexp1 = log(expression + 1)) |> 
  ggplot(aes(x = lexp1)) + 
  geom_histogram()

rna |> 
  ggplot(aes(x = log(expression + 1))) + 
  geom_histogram()

rna |> 
  ggplot(aes(x = (expression + 1))) + 
  geom_histogram() +
  scale_x_log10()

## Next: scatter plots of log fold-changes
## 8 vs 0 and 4 vs 0. Start by computing 
## these (see yesterday).

rna_fc <- rna |> 
  mutate(expression = log(expression + 1)) |> 
  group_by(gene, time) |> 
  summarise(mexp = mean(expression)) |> 
  pivot_wider(names_from = time, 
              values_from = mexp) |> 
  mutate(lfc8 = `8` - `0`,
         lfc4 = `4` - `0`)


rna_fc |> 
  pull(lfc8) |> 
  summary()

ggplot(rna_fc, 
       aes(x = lfc4)) + 
  geom_histogram()

ggplot(rna_fc, 
       aes(x = lfc8)) + 
  geom_histogram()

ggplot(rna_fc, 
       aes(x = lfc4, 
           y = lfc8)) +
  geom_point() +
  geom_abline(intercept = 0)

ggplot(rna_fc, 
       aes(x = lfc4, 
           y = lfc8)) +
  geom_point(colour = "red") 
  
ggplot(rna_fc, 
       aes(x = lfc4, 
           y = lfc8,
           colour = "red")) +
  geom_point() 

ggplot(rna_fc, 
       aes(x = lfc4, 
           y = lfc8)) +
  geom_point(aes(colour = "red")) 

rna_fc <- rna |> 
  mutate(expression = log(expression + 1)) |> 
  group_by(gene, time, gene_biotype) |> 
  summarise(mexp = mean(expression)) |> 
  pivot_wider(names_from = time, 
              values_from = mexp) |> 
  mutate(lfc8 = `8` - `0`,
         lfc4 = `4` - `0`)

ggplot(rna_fc, 
       aes(x = lfc4, 
           y = lfc8,
           colour = gene_biotype, 
           size = 2)) +
  geom_point() 

ggplot(rna_fc, 
       aes(x = lfc4, 
           y = lfc8,
           colour = gene_biotype, 
           size = `0`,
           alpha = 0.1)) +
  geom_point() 

ggplot(rna_fc, 
       aes(x = lfc4, 
           y = lfc8,
           colour = gene_biotype, 
           size = `0`,
           alpha = 0.1)) +
  geom_point() + 
  theme_bw()

ggplot(rna_fc, 
       aes(x = lfc4, 
           y = lfc8)) +
  geom_hex() 

rna |> 
  mutate(expression = log2(expression + 1)) |> 
  ggplot(aes(x = sample,
             y = expression,
             colour = time)) +
  geom_point()

rna |> 
  mutate(expression = log2(expression + 1)) |> 
  ggplot(aes(x = sample,
             y = expression)) +
  geom_boxplot()

rna |> 
  mutate(expression = log2(expression + 1)) |> 
  ggplot(aes(x = sample,
             y = expression)) +
  geom_boxplot() +
  geom_jitter(alpha = 0.1)

rna |> 
  mutate(expression = log2(expression + 1)) |> 
  ggplot(aes(x = sample,
             y = expression)) +
  geom_jitter(alpha = 0.1) + 
  geom_boxplot() 

rna |> 
  mutate(expression = log2(expression + 1)) |> 
  ggplot(aes(x = sample,
             y = expression)) +
  geom_jitter(alpha = 0.3, 
              aes(colour = as.character(time))) + 
  geom_boxplot() 

rna |> 
  mutate(expression = log2(expression + 1)) |> 
  ggplot(aes(x = sample,
             y = expression,
             fill = as.character(time))) +
  geom_jitter(alpha = 0.3) + 
  geom_boxplot() 

## Ex: same as above, but colour based
##     on sex and display the distributions
##     using violin plots. 

rna |> 
  mutate(expression = log2(expression + 1)) |> 
  ggplot(aes(x = sample,
             y = expression,
             fill = as.character(time))) +
  geom_violin() 

## How to re-order the columns according
## to time? Winner gets a lollipop!

## Find 10 genes with the highest 
## 8 vs. 0 log fold-changes 
## Store the genes names in a vector.
## Hint: use arrange()

selected_genes <- select(rna_fc, 1, 6) |> 
  arrange(desc(lfc8)) |> 
  head(n = 10) |> 
  pull(gene)

selected_genes

## Create a new rna_subset tibble
## for the 10 genes of interest.

rna_subset <- rna |> 
  filter(gene %in% selected_genes) |> 
  mutate(expression = 
           log(expression + 1))

## Calculate mean expression
## by gene and time point

rna_subset |> 
  group_by(gene, time) |> 
  summarise(mexp = mean(expression))













