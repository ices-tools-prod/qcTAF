#' Quality Check
#'
#' Run all TAF requirement checks on one or more analyses.
#'
#' @param analysis directory containing a TAF analysis.
#'
#' @return
#' Logical vector indicating the result from each test.
#'
#' @seealso
#' The checks are run in the following order:
#'
#' \code{\link{dir.exists}} checks if directory exists.
#'
#' \code{\link{qc.boot.exists}} checks if boot directory exists.
#'
#' \code{\link{qc.data.bib.exists}} checks if \verb{DATA.bib} file exists.
#'
#' \code{\link{qc.data.bib.valid}} checks if \verb{DATA.bib} is valid.
#'
#' \code{\link{qc.software.bib.exists}} checks if \verb{DATA.bib} file exists.
#'
#' \code{\link{qcTAF-package}} gives an overview of the package.
#'
#' @examples
#' \dontrun{
#' # TAF analysis
#' qc("rjm-347d")
#' }
#'
#' @importFrom stats setNames
#'
#' @export

qc <- function(analysis=".")
{
  # 1  Preamble
  tests <- c("dir.exists",
             "qc.boot.exists",
             "qc.data.bib.exists",
             "qc.data.bib.valid",
             "qc.software.bib.exists")
  s <- setNames(rep(NA, length(tests)), tests)

  # 2  Test
  s[1] <- get(tests[1])(analysis)
  s[2] <- get(tests[2])(analysis)
  s[3] <- get(tests[3])(analysis)
  s[4] <- get(tests[4])(analysis)
  s[5] <- get(tests[5])(analysis)

  # 3  Result
  s
}
