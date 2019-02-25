#' Retrieve WHOIS details for one or more domain names
#'
#' @md
#' @param domains character vector of domain names
#' @param api_key see [whoisxmlapi_key()]
#' @references <https://whoisapi.whoisxmlapi.com/docs>
#' @export
whois <- function(domains, api_key = whoisxmlapi_key()) {

  res <- lapply(domains, lookup_domain, api_key = api_key)

  # out <- do.call(rbind.data.frame, res)
  #
  # class(out) <- c("tbl_df", "tbl", "data.frame")

  res

}

lookup_domain <- function(domain, api_key) {

  httr::GET(
    url = "https://www.whoisxmlapi.com/whoisserver/WhoisService",
    query = list(
      domainName = domain,
      outputFormat = "JSON",
      apiKey = api_key
    )
  ) -> res

  httr::stop_for_status(res)

  out <- httr::content(res, as = "text")

  jsonlite::fromJSON(out)

}
