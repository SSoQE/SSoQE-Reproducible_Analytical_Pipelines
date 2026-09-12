#' Prepare penguin measurements for analysis
#'
#' @param data_source A data frame containing Palmer penguin measurements.
#'
#' @return A tibble with complete analysis columns and character species names.
#' @export
clean_penguins <- function(data_source) {
  required_columns <- c(
    "species",
    "bill_length_mm",
    "bill_depth_mm",
    "body_mass_g"
  )

  missing_columns <- setdiff(required_columns, names(data_source))

  if (length(missing_columns) > 0L) {
    stop(
      "The penguin data are missing required analysis columns.",
      call. = FALSE
    )
  }

  data_source |>
    dplyr::select(dplyr::all_of(required_columns)) |>
    tidyr::drop_na() |>
    dplyr::mutate(species = as.character(species))
}
