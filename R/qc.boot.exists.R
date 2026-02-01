#' Boot Directory Exists
#'
#' Assert that a boot directory exists.
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
#' \code{\link{qcTAF-package}} gives an overview of the package.
#'
#' @examples
#' \dontrun{
#' qc.boot.exists("rjm-347d")
#' }
#'
#' @importFrom TAF boot.dir
#'
#' @export

qc.boot.exists <- function(analysis=".", short=TRUE, stop=TRUE, quiet=FALSE)
{
  # 1  Preamble
  owd <- setwd(analysis)
  on.exit(setwd(owd))
  folder <- if(short) basename(analysis) else analysis
  if(!quiet)
    message("* checking '", folder, "' with qc.boot.exists ... ", appendLF=FALSE)

  # 2  Test
  success <- dir.exists(boot.dir())

  # 3  Result
  if(!success)
  {
    if(!quiet) message("ERROR")
    msg <- paste0("'", folder, "' does not contain a boot directory")
    if(stop) stop(msg) else warning(msg)
  }
  else if(!quiet)
    message("OK")
  success
}
