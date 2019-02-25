
<!-- README.md is generated from README.Rmd. Please edit that file -->

# whoisxmlapi

Query ‘IP’ and Domain Information from ‘WhoisXMLAPI’

## Description

The ‘WhoisXMLAPI’ (<https://whoisxmlapi.com/>) service provides current
and historical metadata on ‘IP’ addresses and ‘WHOIS’ records for
internet domain names. Methods are provided to query and process query
results.

## What’s Inside the Tin?

The following functions are implemented:

  - `account_balance`: Query the account balance
  - `whois`: Retrieve WHOIS details for one or more domain names
  - `whoisxmlapi_key`: Get or set WHOISXMLAPI\_KEY

## Installation

``` r
devtools::install_github("hrbrmstr/whoisxmlapi")
```

## Usage

``` r
library(whoisxmlapi)

# current verison
packageVersion("whoisxmlapi")
## [1] '0.1.0'
```

``` r
dplyr::glimpse(account_balance())
## List of 1
##  $ data:'data.frame':    9 obs. of  3 variables:
##   ..$ product_id: int [1:9] 1 7 8 9 10 11 14 20 23
##   ..$ product   :'data.frame':   9 obs. of  2 variables:
##   .. ..$ id  : int [1:9] 1 7 8 9 10 11 14 20 23
##   .. ..$ name: chr [1:9] "WHOIS API" "Email Verification API" "IP Geolocation API" "Reverse IP/DNS API" ...
##   ..$ credits   : int [1:9] 494 1000 1000 250 250 250 100 100 1000
```

## `whoisxmlapi` Metrics

| Lang | \# Files |  (%) | LoC |  (%) | Blank lines |  (%) | \# Lines |  (%) |
| :--- | -------: | ---: | --: | ---: | ----------: | ---: | -------: | ---: |
| R    |        6 | 0.86 |  52 | 0.79 |          25 | 0.56 |       40 | 0.56 |
| Rmd  |        1 | 0.14 |  14 | 0.21 |          20 | 0.44 |       32 | 0.44 |

### Code of Conduct

Please note that this project is released with a [Contributor Code of
Conduct](CONDUCT.md). By participating in this project you agree to
abide by its terms.
