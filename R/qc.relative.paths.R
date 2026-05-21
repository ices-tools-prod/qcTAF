#' Relative Paths
#'
#' Check if scripts (\verb{*.R}, \verb{*.Rmd}, \verb{*.qmd} use only relative
#' paths.
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
#' qc.relative.paths("rjm-347d")
#' }
#'
#' @importFrom TAF model.script
#'
#' @export

qc.relative.paths <- function(analysis=".")
{
  # 1  Preamble
  if(!dir.exists(analysis))
    return(FALSE)
  owd <- setwd(analysis)
  on.exit(setwd(owd))
  files <- dir(pattern="\\.(R|Rmd|r|rmd|qmd)$")
  if(length(files) == 0)
    return(FALSE)

  # 2  Test
  code <- lapply(files, readLines, warn=FALSE)
  pattern <- ":/|:\\\\|~/|^/"  # absolute path
  absolute <- lapply(code, grepl, pattern=pattern)
  success <- !any(unlist(absolute))

  # 3  Result
  success
}
