<!-- README.md is generated from README.Rmd. Please edit that file -->
cooking
=======

[![Travis-CI Build Status](https://travis-ci.org/krlmlr/cooking.svg?branch=master)](https://travis-ci.org/krlmlr/cooking) [![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/cooking)](https://cran.r-project.org/package=cooking)

Chopping, peeling, frying, and cooking various ingredients, and combining them to a delicious ragout. Also includes buying them from a local supermarket.

![dependency graph](assets/dep_graph.png)

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
buy(I("potatoes"), from = I("local market"))
#> raw potatoes, bought at
#>   local market
```

Installation
------------

``` r
# install.packages("remotes")
remotes::install_github("krlmlr/cooking")
```
