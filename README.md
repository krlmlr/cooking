<!-- README.md is generated from README.Rmd. Please edit that file -->
cooking
=======

Chopping, peeling, frying, and cooking various ingredients.

Example
-------

``` r
chopped_meat <- chop("raw_meat.csv")
chopped_meat
#> chopped meat, made of
#>   raw meat
fry(chopped_meat, with = I("vegetables"))
#> fried meat, made of
#>   chopped meat, made of
#>     raw meat
#>   vegetables
```

Installation
------------

``` r
# install.packages("remotes")
remotes::install_github("krlmlr/cooking")
```
