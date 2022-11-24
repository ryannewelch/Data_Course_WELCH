#bioconductor is cran for bioinformatics stuff
install.packages("BiocManager",force=TRUE)

BiocManager::install("ShortRead")
BiocManager::install("Biostring")
BiocManager::install("dada2")

library(tidyverse)
library(ShortRead)
library(Biostrings)
library(dada2)


list.files("Data/Fastq_16S",full.names = TRUE)
readLines("Data/Fastq_16S/F3D2_S190_L001_R1_001.fastq")

fq<- readFastq("Data/Fastq_16S/F3D2_S190_L001_R1_001.fastq")
quality(fq)[[8]]


filterAndTrim(fwd="Data/Fastq_16S/F3D2_S190_L001_R1_001.fastq",
              filt="Data/Fastq_16S/F3D2_S190_L001_R1_001_trimmed.fastq",
              maxN = 0)

fq<- readFastq("Data/Fastq_16S/F3D2_S190_L001_R1_001_trimmed.fastq")
translate(sread(fq))

filterAndTrim("Data/Fastq_16S/F3D2_S190_L001_R1_001_trimmed.fastq",
              filt = "Data/Fastq_16S/F3D2_S190_L001_R1_001_extratrimmed.fastq",
              truncQ = 30,
              trimLeft = 50)

p1<- plotQualityProfile("Data/Fastq_16S/F3D2_S190_L001_R1_001_trimmed.fastq")
#40 is the highest score, so we're looking good
#quality of 20 is 99.9% that we're right

p2 <- plotQualityProfile("Data/Fastq_16S/F3D2_S190_L001_R1_001_extratrimmed.fastq")
#now we're too clean, but here's how to do it if you need to, threw out ~5000 reads

library(patchwork)
p1/p2

trimEnds(fq,"#") %>% 
  translate()

fq@quality

sread(fq) %>% translate() 
#access actual reads from that file (don't need to pipe to translate, just for fun)
#DNAStringSet is the class


reverseComplement(sread(fq))
reverse(sread(fq))

ShortRead::

#can easily look up tutorials online



