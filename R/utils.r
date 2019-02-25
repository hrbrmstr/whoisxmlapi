#' Get or set WHOISXMLAPI_KEY value
#'
#' The API wrapper functions in this package all rely on a WhoisXMLAPI
#' key residing in the environment variable `WHOISXMLAPI_KEY`.
#' The easiest way to accomplish this is to set it
#' in the `.Renviron` file in your home directory.
#'
#' @md
#' @param force Force setting a new WhoisXMLAPI key for the current environment?
#' @return atomic character vector containing the WhoisXMLAPI username
#' @export
whoisxmlapi_key <- function(force = FALSE) {

  env <- Sys.getenv('WHOISXMLAPI_KEY')
  if (!identical(env, "") && !force) return(env)

  if (!interactive()) {
    stop("Please set env var WHOISXMLAPI_KEY to your WhoisXMLAPI key",
         call. = FALSE)
  }

  message("Couldn't find env var WHOISXMLAPI_KEY See ?whoisxmlapi_key for more details.")
  message("Please enter your username and press enter:")
  pat <- readline(": ")

  if (identical(pat, "")) {
    stop("WhoisXMLAPI key entry failed", call. = FALSE)
  }

  message("Updating WHOISXMLAPI_KEY env var")
  Sys.setenv(WHOISXMLAPI_KEY = pat)

  pat

}
