#' Quality Check
#'
#' Run all TAF requirement checks on one or more analyses.
#'
#' @param x directory containing a TAF analysis or a directory containing
#'        multiple TAF analyses.
#' @param short whether to show the TAF directory name in a short
#'        \code{\link{basename}} format.
#' @param stop whether to stop if test fails.
#' @param quiet whether to suppress messages.
#'
#' @details
#' If \code{x} is a directory, \code{stop} is set to \code{FALSE} unless the
#' user passes an explicit \code{stop = TRUE}.
#'
#' @return
#' String indicating which test did not succeed, or a vector of strings if
#' \code{x} is a directory. A value of \code{""} means all tests succeeded for
#' that file.
#'
#' @seealso
#' The checks are run in the following order:
#'
#' \code{\link{qc.dir.exists}} checks if directory exists.
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

qc <- function(x, short=TRUE, stop=TRUE, quiet=FALSE)
{
  # Print warnings as they occur, rather than all at the end
  owarn <- options(warn=1); on.exit(options(owarn))

  if(suppressWarnings(qc.boot.exists(x, stop=FALSE, quiet=TRUE)))  # one TAF dir
  {
    s <- ""
    if(s == "" && !qc.dir.exists(x, short=short, stop=stop, quiet=quiet))
      s <- "dir exists"
    if(s == "" && !qc.boot.exists(x, short=short, stop=stop, quiet=quiet))
      s <- "boot exists"
    if(s == "" && !qc.data.bib.exists(x, short=short, stop=stop, quiet=quiet))
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
      s[i] <- qc(subdirs[i], short=short, stop=stop, quiet=quiet)
    }
    names(s) <- folders
  }
  else
  {
    stop("'x' must be an existing directory name")
  }

  invisible(s)
}
