#' Retrieve API account balance
#'
#' @md
#' @param api_key see [whoisxmlapi_key()]
#' @references <https://whoisapi.whoisxmlapi.com/docs>
#' @export
account_balance <- function(api_key = whoisxmlapi_key()) {

  httr::GET(
    url = "https://user.whoisxmlapi.com/service/account-balance",
    query = list(
      apiKey = api_key
    )
  ) -> res

  httr::stop_for_status(res)

  out <- httr::content(res, as = "text")

  jsonlite::fromJSON(out)

}
