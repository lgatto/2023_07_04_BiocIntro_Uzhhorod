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



## Next: scatter plots of log fold-changes
## 8 vs 0 and 4 vs 0. Start by computing 
## these (see yesterday).


