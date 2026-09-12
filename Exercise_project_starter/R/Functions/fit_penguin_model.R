#' Fit the penguin bill model
#'
#' @param data_source Measurements for one penguin species.
#'
#' @return A linear model of bill length as a function of bill depth.
#' @export
fit_penguin_model <- function(data_source) {
  stats::lm(
    formula = bill_length_mm ~ bill_depth_mm,
    data = data_source
  )
}
