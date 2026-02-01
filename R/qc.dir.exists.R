#' Directory Exists
#'
#' Assert that a directory exists.
#'
#' @param path directory name.
#' @param short whether to show the directory name in a short
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
#' qc.dir.exists("rjm-347d")
#' }
#'
#' @export

qc.dir.exists <- function(path=".", short=TRUE, stop=TRUE, quiet=FALSE)
{
  ## 1  Preamble
  folder <- if(short) basename(path) else path
  if(!quiet)
    message("* checking '", folder, "' with qc.dir.exists ... ", appendLF=FALSE)

  ## 2  Test
  success <- is.character(path) && dir.exists(path)

  ## 3  Result
  if(!success)
  {
    if(!quiet) message("ERROR")
    msg <- paste0("directory '", folder, "' does not exist")
    if(stop) stop(msg) else warning(msg)
  }
  else if(!quiet)
    message("OK")
  success
}
