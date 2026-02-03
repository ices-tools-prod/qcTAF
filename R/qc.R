#' Quality Check
#'
#' Run all TAF requirement checks on one or more analyses.
#'
#' @param x directory containing a TAF analysis or a directory containing
#'        multiple TAF analyses.
#' @param short whether to show the TAF directory name in a short
#'        \code{\link{basename}} format.
#' @param quiet whether to suppress messages.
#'
#' @return
#' Logical vector indicating the result from each test.
#'
#' @seealso
#' The checks are run in the following order:
#'
#' \code{\link{dir.exists}} checks if directory exists.
#'
#' \code{\link{qc.boot.exists}} checks if boot directory exists.
#'
#' \code{\link{qc.data.bib.exists}} checks if \verb{DATA.bib} file exists.
#'
#' \code{\link{qcTAF-package}} gives an overview of the package.
#'
#' @examples
#' \dontrun{
#' # TAF analysis
#' qc("rjm-347d")
#'
#' # Multiple TAF analyses
#' qc("2026/wgnssk")
#' }
#'
#' @export

qc <- function(x, short=TRUE, quiet=FALSE)
{
  # Print warnings as they occur, rather than all at the end
  owarn <- options(warn=1); on.exit(options(owarn))

  if(qc.boot.exists(x))  # one TAF dir
  {
    s <- ""
    if(s == "" && !dir.exists(x))
      s <- "dir exists"
    if(s == "" && !qc.boot.exists(x))
      s <- "boot exists"
    if(s == "" && !qc.data.bib.exists(x))
      s <- "DATA.bib exists"
  }
  else if(dir.exists(x))  # directory containing many TAF analyses
  {
    subdirs <- dir(x, full.names=TRUE)[dir.exists(dir(x, full.names=TRUE))]
    folders <- if(short) basename(subdirs) else subdirs
    s <- rep(NA_character_, length(folders))
    for(i in seq_along(folders))
    {
      if(!quiet) cat("[", i, "] ", folders[i], "\n", sep="")
      s[i] <- qc(subdirs[i], short=short, quiet=quiet)
    }
    names(s) <- folders
  }
  else
  {
    stop("'x' must be an existing directory name")
  }

  invisible(s)
}
