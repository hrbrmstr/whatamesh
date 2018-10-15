#' List ASCII MeSH Files Available For Download
#'
#' @export
list_mesh_files <- function() {

  suppressWarnings(
    suppressMessages(
      res <- httr::GET(ascii_mesh_url)
    )
  )

  httr::stop_for_status(res)

  out <- httr::content(res, as="text", encoding = "UTF-8")
  out <- stri_split_lines(out)[[1]]
  out <- out[out != ""]

  stri_sub(out, 1, 29) <- ""

  out <- stri_trim_both(out)
  out <- stri_match_first_regex(out, "^([[:digit:]]+)[[:space:]]+(.*)[[:space:]]([[:alnum:]]+\\.bin)$")[,2:4]

  out <- as.data.frame(out, stringsAsFactors = FALSE)
  colnames(out) <- c("Size (Bytes)", "Last Modified", "File")
  class(out) <- c("tbl_df", "tbl", "data.frame")

  out

}