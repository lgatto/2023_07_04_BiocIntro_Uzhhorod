download.file(url = "https://github.com/carpentries-incubator/bioc-intro/raw/main/episodes/data/rnaseq.csv",
              destfile = "data/rnaseq.csv")

rna <- read.csv("data/rnaseq.csv")
class(rna)

rna

dim(rna)
nrow(rna)
ncol(rna)

head(names(rna))
head(colnames(rna))
head(rownames(rna))


head(rna)

tail(rna)


str(rna)

View(rna)

rna2 <- rna[1:2, c(2, 5)]
class(rna2)
dim(rna2)

dim(rna[1:2, ])

dim(rna[1:2, -(1:5)])
-(1:5)
## Ex: extract from rna, the 
## data for observations 1, 11 
## and 100 for variables 
## expression, gene, 
## and chromosome_name

rna[c(1, 11, 100), 
    c("expression", 
      "gene", 
      "chromosome_name")]

names(rna) %in% c("expression", 
                  "gene", 
                  "chromosome_name")

## Extract fill columns
rna[, "expression"]
rna$expression

range(rna$expression)

sum(rna$expression == 0)/nrow(rna)

rna[c(1, 11, 100), ]

c(rna$expression, rna$sample)

class(rna$expression)
class(rna$gene)

## length(c(rna$expression, rna$sample))

## Ex:

class(rna[200, ])
dim(rna[200, ])
rna_200 <- rna[200, ]

nrow(rna)
rna[32428, ]
rna_last <- rna[nrow(rna), ]

tail(rna)

rna_middle <- rna[nrow(rna)/2, ]

rna[16000.5, 1:3]

rna[16000:16001, 1:3]

round(16000.5)

head(rna)

rna[-(7:nrow(rna)), ]

## factors

sex <- c("M", "F", "F", "M")
sex

fsex <- factor(sex)
fsex
levels(fsex)

fsex2 <- factor(c("M", "F", "X"))

c(fsex, fsex2)

as.character(fsex)
str(rna)

rna$sex <- factor(rna$sex)

data.frame()

data.frame(c1 = 1:3, 
           c2 = letters[1:3],
           c3 = c(TRUE, FALSE, FALSE))

matrix()

matrix(1:12, ncol = 4)

m <- matrix(1:12, nrow = 4)


m[1:2, 2:3]

##----------------------------
## export tables






