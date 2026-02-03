#' SOFTWARE.bib Exists
#'
#' Check if a \verb{SOFTWARE.bib} file exists.
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
#' qc.software.bib.exists("rjm-347d")
#' }
#'
#' @importFrom TAF boot.dir
#'
#' @export

qc.software.bib.exists <- function(analysis=".")
{
  # 1  Preamble
  owd <- setwd(analysis)
  on.exit(setwd(owd))

  # 2  Test
  success <- file.exists(file.path(boot.dir(), "SOFTWARE.bib"))

  # 3  Result
  success
}
