#' Split penguin measurements by species
#'
#' @param data_source A cleaned penguin data frame.
#'
#' @return A named list containing one tibble per species.
#' @export
split_penguins <- function(data_source) {
  split(
    x = data_source,
    f = data_source$species
  )
}
