#' Select one penguin species
#'
#' @param data_source A cleaned penguin data frame.
#' @param species Character scalar naming the species to retain.
#'
#' @return A tibble containing measurements for the selected species.
#' @export
filter_penguins <- function(data_source, species) {
  if (!is.character(species) || length(species) != 1L) {
    stop("`species` must be one character value.", call. = FALSE)
  }

  data_selected <- data_source |>
    dplyr::filter(.data$species == .env$species)

  if (nrow(data_selected) == 0L) {
    stop("The selected species is absent from the data.", call. = FALSE)
  }

  data_selected
}
