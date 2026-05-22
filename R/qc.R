#' Quality Check
#'
#' Run all quality checks for a given analysis.
#'
#' @param analysis directory containing a TAF analysis.
#'
#' @return Logical vector indicating the result from each test.
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
#' \code{\link{qc.data.bib.processed}} checks if \verb{DATA.bib} entries have
#' been processed.
#'
#' \code{\link{qc.data.declared}} checks if data files are declared.
#'
#' \code{\link{qc.software.bib.exists}} checks if \verb{SOFTWARE.bib} exists.
#'
#' \code{\link{qc.software.bib.valid}} checks if \verb{SOFTWARE.bib} is valid.
#'
#' \code{\link{qc.software.bib.processed}} checks if \verb{SOFTWARE.bib} entries
#' have been processed.
#'
#' \code{\link{qc.data.declared}} checks if software files are declared.
#'
#' \code{\link{qc.initial.data}} checks if initial data files have the same
#' contents as boot data files.
#'
#' \code{\link{qc.any.scripts.exist}} checks if any scripts exist.
#'
#' \code{\link{qc.all.scripts.exist}} checks if all scripts exist.
#'
#' \code{\link{qc.only.relative.paths}} checks if scripts use only relative
#' paths.
#'
#' \code{\link{qcTAF-package}} gives an overview of the package.
#'
#' @examples
#' \dontrun{
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
             "qc.data.bib.processed",
             "qc.data.declared",
             "qc.software.bib.exists",
             "qc.software.bib.valid",
             "qc.software.bib.processed",
             "qc.software.declared",
             "qc.initial.data",
             "qc.any.scripts.exist",
             "qc.all.scripts.exist",
             "qc.only.relative.paths")

  # 2  Test
  s <- sapply(tests, function(x) get(x)(analysis))

  # 3  Result
  s
}
