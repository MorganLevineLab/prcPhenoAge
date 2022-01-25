#' @title non-PRC PhenoAge Weights
#'
#' @description The regression values to calculate the PRC dissociated subscore of PhenoAge
#'
#' @format A data frame with 458 rows and 11 variables:
#' \describe{
#'   \item{CpG:}{The Illumina ID of the CpG included}
#'   \item{Chromosome:}{The reported Chromosome location of the CpG by Illumina annotation files for CpG arrays}
#'   \item{Weight:}{The weight when performing weighted linear regression for calculating the PhenoAge subscore}
#'   \item{Univariate Age Correlation:}{Calculated age correlation of CpG beta value}
#'   \item{Horvath Overlap:}{Does the CpG also get included in the Horvath Multi-Tissue clock?}
#'   \item{Hannum Overlap:}{Does the CpG also get included in the Hannum Epigenetic Clock?}
#'   \item{PRC:}{Confirmation that the CpG is not PRC associated}
#' }
#' @source <[Add-here-the-PRC-annotation-file]>
"non_prcPhenoAge"
