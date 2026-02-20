#' Initial Data
#'
#' Check if initial data files have the same contents as boot data files.
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
#' qc.initial.data("rjm-347d")
#' }
#'
#' @importFrom TAF boot.dir
#' @importFrom tools md5sum
#'
#' @export

qc.initial.data <- function(analysis=".")
{
  # 1  Preamble
  if(!dir.exists(analysis))
    return(FALSE)
  owd <- setwd(analysis)
  on.exit(setwd(owd))
  initfiles <- dir(file.path(boot.dir(), "initial/data"))
  datafiles <- dir(file.path(boot.dir(), "data"))
  files <- intersect(initfiles, datafiles)

  # 2  Test
  inithash <- md5sum(file.path(boot.dir(), "initial/data", files))
  datahash <- md5sum(file.path(boot.dir(), "data", files))
  success <- all(inithash == datahash)

  # 3  Result
  success
}
