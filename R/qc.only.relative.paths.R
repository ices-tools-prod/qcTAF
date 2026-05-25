#' Only Relative Paths
#'
#' Check if scripts (\verb{*.R}, \verb{*.Rmd}, \verb{Rnw}, \verb{*.qmd}) use
#' only relative paths.
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
#' qc.only.relative.paths("rjm-347d")
#' }
#'
#' @importFrom TAF model.script
#'
#' @export

qc.only.relative.paths <- function(analysis=".")
{
  # 1  Preamble
  if(!dir.exists(analysis))
    return(FALSE)
  owd <- setwd(analysis)
  on.exit(setwd(owd))
  files <- dir(pattern="\\.(R|Rmd|Rnw|r|rmd|rnw|qmd)$")
  if(length(files) == 0)
    return(FALSE)

  # 2  Test
  code <- lapply(files, readLines, warn=FALSE)
  code <- lapply(code, function(x)
    grep("^[[:space:]]*#", x, invert=TRUE, value=TRUE))
  pattern <- ":/|:\\\\|~/|/home/"  # absolute path and URL
  absolute <- lapply(code, grepl, pattern=pattern)
  success <- !any(unlist(absolute))

  # 3  Result
  success
}
