#' Get or set WHOISXMLAPI_USERNAME value
#'
#' The API wrapper functions in this package all rely on a WhoisXMLAPI
#' username & password residing in the environment variables \code{WHOISXMLAPI_USERNAME}
#' and \code{WHOISXMLAPI_PASSWORD}. The easiest way to accomplish this is to set it
#' in the `.Renviron` file in your home directory.
#'
#' @param force Force setting a new WhoisXMLAPI username for the current environment?
#' @return atomic character vector containing the WhoisXMLAPI username
#' @export
whoisxmlapi_username <- function(force = FALSE) {

  env <- Sys.getenv('WHOISXMLAPI_USERNAME')
  if (!identical(env, "") && !force) return(env)

  if (!interactive()) {
    stop("Please set env var WHOISXMLAPI_USERNAME to your WhoisXMLAPI username",
         call. = FALSE)
  }

  message("Couldn't find env var WHOISXMLAPI_USERNAME See ?whoisxmlapi_username for more details.")
  message("Please enter your username and press enter:")
  pat <- readline(": ")

  if (identical(pat, "")) {
    stop("WhoisXMLAPI username entry failed", call. = FALSE)
  }

  message("Updating WHOISXMLAPI_USERNAME env var")
  Sys.setenv(WHOISXMLAPI_USERNAME = pat)

  pat

}
#' Get or set WHOISXMLAPI_PASSWORD value
#'
#' The API wrapper functions in this package all rely on a WhoisXMLAPI
#' username & password residing in the environment variables \code{WHOISXMLAPI_USERNAME}
#' and \code{WHOISXMLAPI_PASSWORD}. The easiest way to accomplish this is to set it
#' in the `.Renviron` file in your home directory.
#'
#' @param force Force setting a new WhoisXMLAPI password for the current environment?
#' @return atomic character vector containing the WhoisXMLAPI username
#' @export
whoisxmlapi_password <- function(force = FALSE) {

  env <- Sys.getenv('WHOISXMLAPI_PASSWORD')
  if (!identical(env, "") && !force) return(env)

  if (!interactive()) {
    stop("Please set env var WHOISXMLAPI_PASSWORD to your WhoisXMLAPI password",
         call. = FALSE)
  }

  message("Couldn't find env var WHOISXMLAPI_PASSWORD See ?whoisxmlapi_password for more details.")
  message("Please enter your password and press enter:")
  pat <- readline(": ")

  if (identical(pat, "")) {
    stop("WhoisXMLAPI password entry failed", call. = FALSE)
  }

  message("Updating WHOISXMLAPI_PASSWORD env var")
  Sys.setenv(WHOISXMLAPI_PASSWORD = pat)

  pat

}

#' Query the account balance for the account associated with \code{WHOISXMLAPI_USERNAME}
#'
#' @export
#' @return \code{data.frame} with fields represeting the various API balance
#' @references \url{https://www.whoisxmlapi.com/whois-api-doc.php}
#' @examples
#' account_balance()
account_balance <- function() {

  res <- POST("https://www.whoisxmlapi.com/accountServices.php",
              query=list(servicetype="accountbalance",
                         username=whoisxmlapi_username(),
                         password=whoisxmlapi_password()))

  stop_for_status(res)

  tmp <- read_xml(content(res, as="text"))

  out <- as.list(as.numeric(xml_text(xml_children(tmp))))
  names(out) <- xml_name(xml_children(tmp))

  as.data.frame(out)

}








