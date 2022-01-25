## code to prepare data
prcPhenoAgeWeights <- readr::read_csv(file = "data-raw/Clock_Levine_PRC.csv")
exampleData <- load("data-raw/Example_PCClock_Data.RData")

prcPhenoAgeWeights$PRC[is.na(prcPhenoAgeWeights$PRC)] <- 0
prcPhenoAge <-  prcPhenoAgeWeights[prcPhenoAgeWeights$PRC == 1, ]
non_prcPhenoAge <- prcPhenoAgeWeights[prcPhenoAgeWeights$PRC != 1, ]

set.seed(123)
keepCpGs <- colnames(datMeth) %in% prcPhenoAgeWeights$CpG
keepCpGs2 <- colnames(datMeth) %in% colnames(datMeth)[sample(c(1:dim(datMeth)[2]), 1000, replace = FALSE)]
keepCpGs3 <- Reduce(`|`, list(keepCpGs, keepCpGs2))
exampleBetas <- datMeth[1:5,keepCpGs3]
examplePheno <- datPheno[1:5,]

usethis::use_data(prcPhenoAge, overwrite = TRUE)
usethis::use_data(non_prcPhenoAge, overwrite = TRUE)
usethis::use_data(exampleBetas, overwrite = TRUE)
usethis::use_data(examplePheno, overwrite = TRUE)
