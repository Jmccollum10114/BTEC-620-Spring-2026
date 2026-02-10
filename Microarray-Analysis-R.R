#Author: McCollum, Jaylin; Date: 01/27/2026; Purpose: Microarray Analysis

# Install Affy Package
if (!require("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
    
    BiocManager::install("affy")
    
# Ensure BiocManager is installed
if (!requireNamespace("BiocManager", quietly = TRUE)) {
  install.packages("BiocManager")
}

# Force reinstall of affy and dependencies
BiocManager::install(
  "affy",
  force = TRUE,
  update = FALSE,
  ask = FALSE
)

# Load the package to confirm
library(affy)


# Set Working Directory
setwd("/Users/jaylinmccollum/Desktop/Bioinformatics2")

# Read 4 .CEL Files in R
data <- ReadAffy()

# Generate a boxplat to visualize dataset
boxplot(data)

# Normalize the Dataset to remove any outliers and stable the median for all .CEL Files
# RMA Robust Multi Array
normalizeddata <- rma(data)

# Generate a boxplat to visualize normalized dataset
boxplot(exprs(normalizeddata))

# Fold change analyses while comparing treatment vs control samples
# Let's assume GSM4843.CEL + GSM4844 samples to be Leukemia/Blood cancer and GSM4845.CEL and GSM4548.CEL and GSSM4846.CEL to b Normal blood samples

# Take means/average on each row 
Newdata <- exprs(normalizeddata)
Treatment <- Newdata[,c(1,2)]
Control <- Newdata[,c(3,4)]

# Apply the rowmeans function to calculate averages 
Treatmentaverage <- rowMeans(Treatment)
ControlAverage <- rowMeans(Control)

# Apply fold change by subtraction
foldchange <- Treatmentaverage - Controlaverage

# If the genes fold change value is >2 its and upregulated gene, and if it's <-2 it's an down regualted gene. If the genes are between -2 and +2 they are insignificant genes.

#Export variable foldchange in an CSV file (excel)
write.csv(foldchange, "foldchange.csv")


