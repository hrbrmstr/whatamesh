#' Download and parse an ASCII MeSH File
#'
#' If the string passed in matches a local filename it will be read in locally,
#' otherwise it will be downloaded. NOTE: large files take a while.
#'
#' @param fil filename of a local (`.bin`) ASCII MeSH file to parse or downlaod
#'        and parse. `fil` will be checked to see if it exists locally and if not
#'        the `nlmpubs.nlm.nih.gov` prefix FTP URL will be added to the file
#'        and the file will be read into memory before parsing.
#' @param wide if `TRUE` then the repeating column names will be made unique and
#'        spread out into a wide data frame; otherwise a data frame with nested
#'        columns will be returned.
#' @export
read_mesh_file <- function(fil, wide = FALSE) {

  if (file.exists(fil)) {

    lines <- stri_read_lines(fil)

  } else {

    suppressWarnings(
      suppressMessages(
        if (interactive()) {
          res <- httr::GET(sprintf("%s%s", ascii_mesh_url, fil), httr::progress())
        } else {
          res <- httr::GET(sprintf("%s%s", ascii_mesh_url, fil))
        }
      )
    )

    httr::stop_for_status(res)

    lines <- httr::content(res, as="text", encoding="UTF-8")
    lines <- stri_split_lines(lines)[[1]]

  }

  starts <- which(stri_detect_fixed(lines, "*NEWRECORD"))
  ends <- c(starts[-1], length(lines))

  if (wide) {

    map2_df(starts, ends, ~{
      rec <- stri_trim_both(lines[.x:.y])
      rec <- rec[!(stri_detect_regex(rec, "^$|NEWRECORD"))]
      rec <- stri_split_regex(rec, "[[:space:]]*=[[:space:]]*", simplify = TRUE)
      as.list(set_names(rec[,2], make.names(rec[,1], unique=TRUE)))
    })

  } else {

    map2_df(starts, ends, ~{

      rec <- stri_trim_both(lines[.x:.y])
      rec <- rec[!(stri_detect_regex(rec, "^$|NEWRECORD"))]
      rec <- stri_split_regex(rec, "[[:space:]]*=[[:space:]]*", simplify = FALSE)
      out <- list()

      for(r in rec) out[[ r[1] ]] <- c(out[[ r[1] ]], r[2])

      for (field in c(
        "RR", "SY", "PI", "SO", "HM", "NM_TH", "PA", "II", "ST",
        "QX", "TN",
        "ENTRY", "MH_TH", "MN", "PRINT ENTRY", "PI", "RR", "FX", "ST", "PA", "EC"
      )) {
        if (field %in% names(out)) out[[field]] <- list(out[[field]])
      }

      dplyr::as_data_frame(out)

    })

  }

}
