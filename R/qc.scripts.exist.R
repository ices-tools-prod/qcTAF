#' Scripts Exist
#'
#' Check if TAF scripts (\verb{data.R}, \verb{model.R}, \verb{output.R}, and
#' \verb{report.R}) exist.
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
#' qc.boot.exists("rjm-347d")
#' }
#'
#' @importFrom TAF model.script
#'
#' @export

qc.scripts.exist <- function(analysis=".")
{
  # 1  Preamble
  if(!dir.exists(analysis))
    return(FALSE)
  owd <- setwd(analysis)
  on.exit(setwd(owd))

  # 2  Test
  scripts <- c("data.R", model.script(), "output.R", "report.R")
  success <- all(file.exists(scripts))

  # 3  Result
  success
}
