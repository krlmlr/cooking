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
peel(buy(I("carrots")))
#> peeled carrots, made of
#>   raw carrots, bought at
#>     supermarket
buy(I("potatoes"), I("local market"))
#> raw potatoes, bought at
#>   local market
```

Installation
------------

``` r
# install.packages("remotes")
remotes::install_github("krlmlr/cooking")
```
