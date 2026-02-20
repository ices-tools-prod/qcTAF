#' Software Declared
#'
#' Check if all files in the boot software folder are declared in the
#' \verb{SOFTWARE.bib} file.
#'
#' @param analysis directory containing a TAF analysis.
#'
#' @return \code{TRUE} if test succeeds, otherwise \code{FALSE}.
#'
#' @note
#' \code{qc.software.bib.processed} checks if all bib entries have made it into
#' the boot software folder: \preformatted{
#' SOFTWARE.bib | boot/software
#' -------------+--------------
#'       A      |
#'       B     ==>
#'       C      |
#' }
#'
#' \code{qc.software.declared} checks if all boot software files were declared
#' as bib entries: \preformatted{
#' SOFTWARE.bib | boot/software
#' -------------+--------------
#'              |      A
#'             <==     B
#'              |      C
#' }
#'
#' When used together, those two functions ensure that \verb{SOFTWARE.bib} and
#' \verb{boot/software} contain precisely the same entries.
#'
#' @seealso
#' \code{\link{qc}} runs all \code{qc.*} tests.
#'
#' \code{\link{qcTAF-package}} gives an overview of the package.
#'
#' @examples
#' \dontrun{
#' qc.software.declared("rjm-347d")
#' }
#'
#' @importFrom TAF boot.dir taf.sources
#'
#' @export

qc.software.declared <- function(analysis=".")
{
  # 1  Preamble
  if(!dir.exists(analysis))
    return(FALSE)
  owd <- setwd(analysis)
  on.exit(setwd(owd))
  files <- dir(file.path(boot.dir(), "software"))
  files <- sub("_[0-9a-f]{7}\\.tar\\.gz", "", files)  # strip _hash.tar.gz
  if(length(files) == 0)  # no files inside boot/software, so all were declared
    return(TRUE)
  bib <- suppressWarnings(try(taf.sources("software"), silent=TRUE))
  if(inherits(bib, "try-error"))
    return(FALSE)

  # 2  Test
  entries <- names(bib)
  success <- all(files %in% entries)

  # 3  Result
  success
}
