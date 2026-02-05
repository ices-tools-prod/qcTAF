#' SOFTWARE.bib Valid
#'
#' Check if a \verb{SOFTWARE.bib} file is valid.
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
#' qc.software.bib.valid("rjm-347d")
#' }
#'
#' @importFrom TAF boot.dir read.bib
#'
#' @export

qc.software.bib.valid <- function(analysis=".")
{
  # 1  Preamble
  if(!dir.exists(analysis))
    return(FALSE)
  owd <- setwd(analysis)
  on.exit(setwd(owd))

  # 2  Test
  bibfile <- file.path(boot.dir(), "SOFTWARE.bib")
  bib <- suppressWarnings(try(read.bib(bibfile), silent=TRUE))
  success <- !inherits(bib, "try-error") && !any(names(bib) == "NULL")

  # 3  Result
  success
}
