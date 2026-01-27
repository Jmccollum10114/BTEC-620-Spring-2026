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

> setwd/Users/jaylinmccollum/Desktop/Bioinformatics2