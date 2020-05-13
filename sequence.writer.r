# Read in the data and references ##
library("seqinr")
reference.genome <- read.fasta("LR605956.fasta", as.string=TRUE, seqonly=TRUE)
ref <- read.table("ref.tab", header=TRUE, sep="\t")
non <- read.table("non.tab", header=TRUE, sep="\t")
var <- read.table("var.tab", header=TRUE, sep="\t")

g.c <- unlist(strsplit(unlist(reference.genome),"")) # converts to vector

# ref.counts <- ref[,-c(1:2)]
# non.counts <- non[,-c(1:2)]

var.trunc <- substr(var[,4],1,1) # truncating vars to just the first nucleotide

## Sequence Writer Script ##

sequences <- matrix(g.c, nrow = length(g.c), ncol = length(ref[1,])) # make as many copies of the reference genome as we have samples

i = 2 # pick the sample (column), this will eventually be a for loop

  for (j in 1:length(ref[,1])) # cycle through all positions
  {
    pos <- ref[j,2] # which nucleotide does the position start on?
    if(ref[j,i] <= non[j,i]) # does the alternative outweigh the reference?
    {
      sequences[pos,i] <- var.trunc[j] # change the "pos" position of the ith genome to the alt nucleotide (truncated)
    } # else keep the reference
  }

seq <- sequences[,2]
my_fasta_sub <- seq[names(seq)]
write.fasta(sequences = seq, names = names(my_fasta_sub), nbchar = 80, file.out = "example.fasta")


print("hello Josh")



