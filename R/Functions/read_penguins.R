#' Read the penguin input data
#'
#' @param file Character scalar giving the path to the CSV input file.
#'
#' @return A tibble containing the unmodified input data.
#' @export
read_penguins <- function(file) {
  if (!is.character(file) || length(file) != 1L || !file.exists(file)) {
    stop("`file` must identify one existing CSV file.", call. = FALSE)
  }

  readr::read_csv(
    file = file,
    show_col_types = FALSE
  )
}
