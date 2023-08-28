
<!-- README.md is generated from README.Rmd. Please edit that file -->

# prcPhenoAge

<!-- badges: start -->

<!-- badges: end -->

The goal of prcPhenoAge is to perform a calculation of PhenoAge (2018)
while subscoring the epigenetic age into the portion of PhenoAge reliant
upon beta values annotated to be in PRC associated CpGs, and non-PRC
associated CpGs. The determination of PRC-associated CpGs was desrived from
Lee et al. (2006) PMID: 16630818.

## Installation

You can install the released version of prcPhenoAge from
[GitHub](https://github.com/MorganLevineLab/prcPhenoAge) with:

``` r
devtools::install_github("MorganLevineLab/prcPhenoAge")
```

## Example

Here is a template code using example data (Lehne et al. 2015) available
as part of this package:

``` r
library(prcPhenoAge)
data("exampleBetas")
data("examplePheno")
PRC_PhenoAge <- calcnonPRCPhenoAge(exampleBetas, examplePheno, imputation = F)
PRC_PhenoAge <- calcPRCPhenoAge(exampleBetas, PRC_PhenoAge, imputation = F)
PRC_PhenoAge
#>                name geo_accession gender  age group sample nonPRC_PhenoAge
#> 1 7786915023_R02C02    GSM1343050      M 57.9     1      1       -26.98018
#> 2 7786915135_R04C02    GSM1343051      M 42.0     1      2       -34.64179
#> 3 7471147149_R06C01    GSM1343052      M 47.4     1      3       -35.04189
#> 4 7786915035_R05C01    GSM1343053      M 49.3     1      4       -33.56565
#> 5 7786923035_R01C01    GSM1343054      M 52.5     1      5       -37.31548
#>   PRC_PhenoAge
#> 1     18.60933
#> 2     15.03647
#> 3     17.92249
#> 4     16.86863
#> 5     17.00389
```
