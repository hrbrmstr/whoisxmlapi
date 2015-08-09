#' Retrieve WHOIS details for one or more domain names
#'
#' @param domains character vector of domain names
#' @return nested list of WHOIS information for each domain
#' @references \url{https://www.whoisxmlapi.com/whois-api-doc.php} and
#'             \url{https://www.whoisxmlapi.com/documentation/whoisapi_documentation/index.html}
#' @export
whois <- function(domains) {
  lapply(domains, lookup_domain)
}

lookup_domain <- function(domain) {

  res <- POST("https://www.whoisxmlapi.com/whoisserver/WhoisService",
              query=list(domainName=domain,
                         username=whoisxmlapi_username(),
                         password=whoisxmlapi_password()))

  stop_for_status(res)

  XML::xmlToList(content(res, as="parsed"))

}
