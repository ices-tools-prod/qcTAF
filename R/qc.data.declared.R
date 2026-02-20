#' Data Declared
#'
#' Check if all files in the boot data folder are declared in the
#' \verb{DATA.bib} file.
#'
#' @param analysis directory containing a TAF analysis.
#'
#' @return \code{TRUE} if test succeeds, otherwise \code{FALSE}.
#'
#' @note
#' \code{qc.data.bib.processed} checks if all bib entries have made it into the
#' boot data folder: \preformatted{
#' DATA.bib | boot/data
#' ---------+----------
#'     A    |
#'     B   ==>
#'     C    |
#' }
#'
#' \code{qc.data.declared} checks if all boot data files were declared as bib
#' entries: \preformatted{
#' DATA.bib | boot/data
#' ---------+----------
#'          |    A
#'         <==   B
#'          |    C
#' }
#'
#' When used together, those two functions ensure that \verb{DATA.bib} and
#' \verb{boot/data} contain precisely the same entries.
#'
#' @seealso
#' \code{\link{qc}} runs all \code{qc.*} tests.
#'
#' \code{\link{qcTAF-package}} gives an overview of the package.
#'
#' @examples
#' \dontrun{
#' qc.data.declared("rjm-347d")
#' }
#'
#' @importFrom TAF boot.dir taf.sources
#'
#' @export

qc.data.declared <- function(analysis=".")
{
  # 1  Preamble
  if(!dir.exists(analysis))
    return(FALSE)
  owd <- setwd(analysis)
  on.exit(setwd(owd))
  files <- dir(file.path(boot.dir(), "data"))
  if(length(files) == 0)  # no files inside boot/data, so 'all' were declared
    return(TRUE)
  bib <- suppressWarnings(try(taf.sources("data"), silent=TRUE))
  if(inherits(bib, "try-error"))
    return(FALSE)

  # 2  Test
  entries <- names(bib)
  success <- all(files %in% entries)

  # 3  Result
  success
}
