#' Plot penguin measurements and their fitted relationship
#'
#' @param data_source Measurements for one penguin species.
#' @param model A fitted linear model returned by [fit_penguin_model()].
#'
#' @return A ggplot object.
#' @export
plot_penguin_model <- function(data_source, model) {
  model_coefficients <- stats::coef(model)
  species_label <- unique(data_source$species)

  ggplot2::ggplot(
    data = data_source,
    mapping = ggplot2::aes(
      x = bill_depth_mm,
      y = bill_length_mm
    )
  ) +
    ggplot2::geom_point(shape = 19, size = 2.2, alpha = 0.75) +
    ggplot2::geom_abline(
      intercept = unname(model_coefficients[[1]]),
      slope = unname(model_coefficients[[2]]),
      linewidth = 1.1
    ) +
    ggplot2::labs(
      title = species_label,
      x = "Bill depth (mm)",
      y = "Bill length (mm)"
    ) +
    ggplot2::theme_minimal(base_size = 14)
}
