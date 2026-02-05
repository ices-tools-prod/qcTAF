#' DATA.bib Valid
#'
#' Check if a \verb{DATA.bib} file is valid.
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
#' qc.data.bib.valid("rjm-347d")
#' }
#'
#' @importFrom TAF boot.dir read.bib
#'
#' @export

qc.data.bib.valid <- function(analysis=".")
{
  # 1  Preamble
  if(!dir.exists(analysis))
    return(FALSE)
  owd <- setwd(analysis)
  on.exit(setwd(owd))

  # 2  Test
  bibfile <- file.path(boot.dir(), "DATA.bib")
  bib <- suppressWarnings(try(read.bib(bibfile), silent=TRUE))
  success <-
    !inherits(bib, "try-error") &&    # bib file can be loaded
    !any(names(bib) == "NULL") &&     # bib file contains entries
    is.character(bib[[1]]$source) &&  # entry contains source element
    nchar(bib[[1]]$source) > 0        # source element is not empty

  # 3  Result
  success
}
