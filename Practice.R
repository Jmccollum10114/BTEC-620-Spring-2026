#Author: McCollum, Jaylin; Date: 02/17/2026; Purpose: Pracitce Microarray Analysis


# Perform a GEO search for following 4 files: GSM4844 GSM4845 GSM4846 GSM4847 

# Download CEL file, Read the 4 .CEL files in R, 

# Generate a boxplot to visualize dataset, Normalize the dataset to remove any outliers and stable the median for all .CEL files, 

# Generate a boxplot to visualize normalized dataset, assume GSM4844.CEL and GSM4845.CEL samples to be cancer and GSM4846.CEL and GSM4847.CEL to be Normal samples,

 # Apply fold change by subtraction, Export foldchanges in an CSV file called “Practice.CSV”. 

# Save raw plot as “Practice-Raw.pdf”, save normalized plot as “Practice-Normalized.pdf, and save R program as “Practice.R”, Push all files on GitHub to receive full points.


# Load the package to confirm
 library(affy)

# Set Working Directory 
> setwd("/Users/jaylinmccollum/Desktop/Bioinformatics2/GSE344_RAW")

# Read 4 .CEL Files in R
> data <- ReadAffy()

# Generate a box plot to visualize dataset
> boxplot(data)

# Normalize the Dataset to remove any outliers and stable the median for all .CEL Files
# RMA Robust Multi Array
> normalizeddata <- rma(data)

# Generate a boxplot to visualize normalized dataset
> boxplot(exprs(normalizeddata))

# Fold Change analysis while comparing treatment vs control samples
# Let’s assume GSM4844.CEL + GSM4845.CEL samples to be cancer and GSM4846.CEL + GSM4847.CEL to be Normal blood samples 

# Take means/average on each row
> Newdata <- exprs(normalizeddata)
> Treatment <- Newdata[,c(1,2)]
> Control <- Newdata[,c(3,4)]

# Apply the rowmeans function to calculate averages
>Treatmentaverage <- rowMeans(Treatment)
>Controlaverage <- rowMeans(Control)

# Apply fold change by subtraction
> foldchange <- Treatmentaverage - Controlaverage

# If the genes fold change value is >2 its and upregulated gene, and if it's <-2 it's an down regulated gene. If the genes are between -2 and +2 they are insignificant genes.

#Export variable foldchange in an CSV file (excel)
> write.csv(foldchange, "practice.csv")

