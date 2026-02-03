#' Directory Exists
#'
#' Check if a directory exists.
#'
#' @param path directory name.
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
#' qc.dir.exists("rjm-347d")
#' }
#'
#' @export

qc.dir.exists <- function(path=".")
{
  # 1  Preamble

  # 2  Test
  success <- dir.exists(path)

  # 3  Result
  success
}
