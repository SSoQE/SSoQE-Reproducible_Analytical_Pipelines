#' Summarise measurements for one penguin species
#'
#' @param data_source Measurements for one penguin species.
#'
#' @return A one-row tibble with sample size and mean bill measurements.
#' @export
summarise_penguins <- function(data_source) {
  data_source |>
    dplyr::summarise(
      species = dplyr::first(.data$species),
      sample_size = dplyr::n(),
      mean_bill_length_mm = mean(.data$bill_length_mm),
      mean_bill_depth_mm = mean(.data$bill_depth_mm)
    )
}
