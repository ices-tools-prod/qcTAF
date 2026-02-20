#' SOFTWARE.bib Processed
#'
#' Check if a \verb{SOFTWARE.bib} entries appear to have been processed, i.e., found
#' as files and directories inside the boot folder.
#'
#' @param analysis directory containing a TAF analysis.
#'
#' @return \code{TRUE} if test succeeds, otherwise \code{FALSE}.
#'
#' @seealso
#' \code{\link{qc}} runs all \code{qc.*} tests.
#'
#' \code{\link{qcTAF-package}} gives an overview of the package.
#'
#' @examples
#' \dontrun{
#' qc.software.bib.processed("rjm-347d")
#' }
#'
#' @importFrom TAF boot.dir taf.sources
#'
#' @export

qc.software.bib.processed <- function(analysis=".")
{
  # 1  Preamble
  if(!dir.exists(analysis))
    return(FALSE)
  owd <- setwd(analysis)
  on.exit(setwd(owd))
  bib <- suppressWarnings(try(taf.sources("software"), silent=TRUE))
  if(inherits(bib, "try-error"))
    return(FALSE)

  # 2  Test
  entries <- names(bib)
  filenames <- file.path(boot.dir(), "software", entries)
  success <- all(file.exists(filenames))

  # 3  Result
  success
}
