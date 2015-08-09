<!-- README.md is generated from README.Rmd. Please edit that file -->
whoisxmlapi is an R package to interface with the [WhoisXMLAPI](https://www.whoisxmlapi.com/) service

The package expects the WhoisXMLAPI username and password to be in the `WHOISXMLAPI_USERNAME` and `WHOISXMLAPI_PASSWORD` variables, respectively.

The only functions curently available are retrieving a WHOIS record and looking up account information. If you have access to the other WhoisXMLAPI services please shoot me a note to help collaborate on this package.

The following functions are implemented:

-   `account_balance`: Query the account balance for the account associated with 'WHOISXMLAPI\_USERNAME'
-   `whois`: Retrieve WHOIS details for one or more domain names
-   `whoisxmlapi_password`: Get or set WHOISXMLAPI\_PASSWORD value
-   `whoisxmlapi_username`: Get or set WHOISXMLAPI\_USERNAME value

### News

-   Version 0.0.0.9000 released

### Installation

``` r
devtools::install_github("hrbrmstr/whoisxmlapi")
```

### Usage

``` r
library(whoisxmlapi)

# current verison
packageVersion("whoisxmlapi")
#> [1] '0.0.0.9000'

dplyr::glimpse(account_balance())
#> Observations: 1
#> Variables:
#> $ balance                       (dbl) 499
#> $ reserve                       (dbl) 500
#> $ monthly_balance               (dbl) 0
#> $ monthly_reserve               (dbl) 0
#> $ reverse_whois_balance         (dbl) 0
#> $ reverse_whois_reserve         (dbl) 0
#> $ reverse_whois_monthly_balance (dbl) 0
#> $ reverse_whois_monthly_reserve (dbl) 0
#> $ ba_query_balance              (dbl) NA
#> $ ba_query_reserve              (dbl) NA
#> $ ra_query_balance              (dbl) NA
#> $ ra_query_reserve              (dbl) NA
#> $ ds_query_balance              (dbl) NA
#> $ ds_query_reserve              (dbl) NA
#> $ reverse_ip_balance            (dbl) NA
#> $ reverse_ip_reserve            (dbl) NA
#> $ reverse_ip_monthly_balance    (dbl) NA
#> $ reverse_ip_monthly_reserve    (dbl) NA
```

### Test Results

``` r
library(whoisxmlapi)
library(testthat)

date()
#> [1] "Sat Aug  8 20:07:53 2015"

test_dir("tests/")
#> 
#> Attaching package: 'whoisxmapi'
#> 
#> The following objects are masked from 'package:whoisxmlapi':
#> 
#>     account_balance, whoisxmlapi_password, whoisxmlapi_username
#> testthat results ========================================================================================================
#> OK: 0 SKIPPED: 0 FAILED: 0
#> 
#> DONE
```

### Code of Conduct

Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.
