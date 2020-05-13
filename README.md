# Malaria
PF Plastids

The LR605956.fasta file is the base genome that we're working from.
The sequence.writer.r script converts the data found in LR605956, var, non, and ref into a FASTA file (containing a vector w/ the relevant sequence). From there, we use BEAUTi to make an XML file for BEAST to analyze.

Our current goal is to restrict sequence.writer.r to only handle single nucleotide polymorphisms (SNPs, or "snips") in the data; that is, we will leave for a later date any phenomena more complicated than one nucleotide shifting to another at a single position.
