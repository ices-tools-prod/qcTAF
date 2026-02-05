#' SOFTWARE.bib Entries
#'
#' Check if a \verb{SOFTWARE.bib} entries appear to have been processed, i.e., found
#' as files and directories inside the boot folder.
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
#' qc.software.bib.entries("rjm-347d")
#' }
#'
#' @importFrom TAF boot.dir read.bib
#'
#' @export

qc.software.bib.entries <- function(analysis=".")
{
  # 1  Preamble
  if(!dir.exists(analysis))
    return(FALSE)
  owd <- setwd(analysis)
  on.exit(setwd(owd))
  bibfile <- file.path(boot.dir(), "SOFTWARE.bib")
  bib <- suppressWarnings(try(read.bib(bibfile), silent=TRUE))
  if(inherits(bib, "try-error") ||      # bib file can be loaded
     any(names(bib) == "NULL") ||       # bib file contains entries
     !is.character(bib[[1]]$source) ||  # entry contains source element
     nchar(bib[[1]]$source) == 0)       # source element is not empty
    return(FALSE)

  # 2  Test
  entries <- names(read.bib(bibfile))
  filenames <- file.path(boot.dir(), "software", entries)
  success <- all(file.exists(filenames))

  # 3  Result
  success
}
