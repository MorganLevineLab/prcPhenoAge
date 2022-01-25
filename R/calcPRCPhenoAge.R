
#' calcPRCPhenoAge
#'
#' @param DNAm  The matrix of DNA methylation beta values from Illumina array data
#' @param pheno  A dataframe of existing sample metadata (e.g. ages, sex, tissue type, etc.) to append calculations to
#' @param CpGImputation  An optional named vector for the mean value of each CpG that will be input from another dataset if such values are missing here (due to sample processing)
#' @param imputation A logical vector determining whether imputation will be performed. If imputation = F, the weights of missing CpGs will not be used to calculate ages, making it less accurate.
#'
#' @return The value of the PRC-associated PhenoAge subscore for each sample, appended to your existing phenotype dataframe
#' @export
#'
#' @examples calcPRCPhenoAge(data("exampleBetas"), data("examplePheno"), imputation = F)
calcPRCPhenoAge <- function(DNAm, pheno, CpGImputation = NULL, imputation = T){

  #######################
  ### Read in the Data###
  #######################

  data("prcPhenoAge")

  ###################################################
  ### Check if all necessary CpGs are in the data ###
  ###################################################
  CpGCheck <- length(prcPhenoAge$CpG) == sum(prcPhenoAge$CpG %in% colnames(DNAm))

  ###################################################################################
  ### The calculation will be performed or an error will be thrown as appropriate ###
  ###################################################################################

  if(CpGCheck == F && is.null(CpGImputation) && imputation == T){

    stop("Need to provide of named vector of CpG Imputations; Necessary CpGs are missing!")

  } else if(CpGCheck == T | imputation == F){

    present <- prcPhenoAge$CpG %in% colnames(DNAm)

    betas <- DNAm[,na.omit(match(prcPhenoAge$CpG,colnames(DNAm)))]
    tt <- rep(0, dim(DNAm)[1])

    tt <- rowSums(sweep(as.matrix(betas), MARGIN = 2, prcPhenoAge$Weight[present],`*`), na.rm = T)

    pheno$PRC_PhenoAge <- tt

  } else {
    message("Imputation of mean CpG Values occured for PhenoAge")
    missingCpGs <- prcPhenoAge$CpG[!(prcPhenoAge$CpG %in% colnames(DNAm))]
    tempDNAm <- matrix(nrow = dim(DNAm)[1], ncol = length(missingCpGs))

    for(j in 1:length(missingCpGs)){
      meanVals <- CpGImputation[match(missingCpGs[j],names(CpGImputation))]
      tempDNAm[,j] <- rep(meanVals,dim(DNAm)[1])
    }
    colnames(tempDNAm) <- missingCpGs
    DNAm <- cbind(DNAm,tempDNAm)

    betas <- DNAm[,match(prcPhenoAge$CpG,colnames(DNAm))]
    tt <- rep(0, dim(DNAm)[1])
    tt <- rowSums(sweep(betas, MARGIN = 2, prcPhenoAge$Weight,`*`))

    pheno$PRC_PhenoAge <- tt

  }

  pheno

}
