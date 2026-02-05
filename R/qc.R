#' Quality Check
#'
#' Run all quality checks for a given analysis.
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
#' \code{\link{qc.data.bib.exists}} checks if \verb{DATA.bib} exists.
#'
#' \code{\link{qc.data.bib.valid}} checks if \verb{DATA.bib} is valid.
#'
#' \code{\link{qc.data.bib.entries}} checks if \verb{DATA.bib} entries have been
#' processed.
#'
#' \code{\link{qc.software.bib.exists}} checks if \verb{SOFTWARE.bib} exists.
#'
#' \code{\link{qc.software.bib.valid}} checks if \verb{SOFTWARE.bib} is valid.
#'
#' \code{\link{qcTAF-package}} gives an overview of the package.
#'
#' @examples
#' \dontrun{
#' # TAF analysis
#' qc("rjm-347d")
#' }
#'
#' @export

qc <- function(analysis=".")
{
  # 1  Preamble
  tests <- c("dir.exists",
             "qc.boot.exists",
             "qc.data.bib.exists",
             "qc.data.bib.valid",
             "qc.data.bib.entries",
             "qc.software.bib.exists",
             "qc.software.bib.valid")

  # 2  Test
  s <- sapply(tests, function(x) get(x)(analysis))

  # 3  Result
  s
}
