#' Boot Directory Exists
#'
#' Check if a boot directory exists.
#'
#' @param analysis directory containing a TAF analysis.
#'
#' @return
#' \code{TRUE} if test succeeds, otherwise \code{FALSE}.
#'
#' @seealso
#' \code{\link{qc}} runs all \code{qc.*} tests.
#'
#' \code{\link{qcTAF-package}} gives an overview of the package.
#'
#' @examples
#' \dontrun{
#' qc.boot.exists("rjm-347d")
#' }
#'
#' @importFrom TAF boot.dir
#'
#' @export

qc.boot.exists <- function(analysis=".")
{
  # 1  Preamble
  owd <- setwd(analysis)
  on.exit(setwd(owd))

  # 2  Test
  success <- dir.exists(boot.dir())

  # 3  Result
  success
}
