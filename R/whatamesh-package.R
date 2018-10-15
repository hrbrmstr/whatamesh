#' Tools to Work with ASCII MeSH Files
#'
#' Ref:
#'
#' - <ftp://nlmpubs.nlm.nih.gov/online/mesh/MESH_FILES/asciimesh/>
#' - <https://stackoverflow.com/questions/52814022/how-to-split-txt-file-at-specific-location-and-import-each-part-as-table-in-r/52815428?noredirect=1#comment92554994_52815428>
#'
#' @section Support:
#'
#' - URL: <https://gitlab.com/hrbrmstr/whatamesh>
#' - BugReports: <https://gitlab.com/hrbrmstr/whatamesh/issues>
#'
#' @md
#' @name whatamesh
#' @docType package
#' @author Bob Rudis (bob@@rud.is)
#' @importFrom purrr map map2_df set_names
#' @importFrom dplyr as_data_frame
#' @import httr stringi
#' @importFrom jsonlite fromJSON
NULL
