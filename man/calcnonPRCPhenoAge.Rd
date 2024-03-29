% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/calcnonPRCPhenoAge.R
\name{calcnonPRCPhenoAge}
\alias{calcnonPRCPhenoAge}
\title{calcnonPRCPhenoAge}
\usage{
calcnonPRCPhenoAge(DNAm, pheno, CpGImputation = NULL, imputation = T)
}
\arguments{
\item{DNAm}{The matrix of DNA methylation beta values from Illumina array data}

\item{pheno}{A dataframe of existing sample metadata (e.g. ages, sex, tissue type, etc.) to append calculations to}

\item{CpGImputation}{An optional named vector for the mean value of each CpG that will be input from another dataset if such values are missing here (due to sample processing)}

\item{imputation}{A logical vector determining whether imputation will be performed. If imputation = F, the weights of missing CpGs will not be used to calculate ages, making it less accurate.}
}
\value{
The value of the PRC-dissociated PhenoAge subscore for each sample, appended to your existing phenotype dataframe
}
\description{
calcnonPRCPhenoAge
}
\examples{
calcnonPRCPhenoAge(data("exampleBetas"), data("examplePheno"), imputation = F)
}
