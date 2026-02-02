#' SOFTWARE.bib Exists
#'
#' Assert that a \verb{SOFTWARE.bib} file exists.
#'
#' @param analysis directory containing a TAF analysis.
#' @param short whether to show the TAF directory name in a short
#'        \code{\link{basename}} format.
#' @param stop whether to stop if test fails.
#' @param quiet whether to suppress messages.
#'
#' @return
#' \code{TRUE} if test succeeds, otherwise an error message
#' (if \code{stop = TRUE}) or \code{FALSE} and a warning message
#' (if \code{stop = FALSE}).
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

qc.software.bib.exists <- function(analysis=".", short=TRUE, stop=TRUE,
                                   quiet=FALSE)
{
  # 1  Preamble
  owd <- setwd(analysis)
  on.exit(setwd(owd))
  folder <- if(short) basename(analysis) else analysis
  if(!quiet)
    message("* checking '", folder, "' with qc.software.bib.exists ... ",
            appendLF=FALSE)

  # 2  Test
  success <- file.exists(file.path(boot.dir(), "SOFTWARE.bib"))

  # 3  Result
  if(!success)
  {
    if(!quiet) message("ERROR")
    msg <- paste0("'", folder, "' does not contain a SOFTWARE.bib file")
    if(stop) stop(msg) else warning(msg)
  }
  else if(!quiet)
    message("OK")
  success
}
