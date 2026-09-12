library(targets)

targets::tar_source("R/Functions")

list(
  targets::tar_target(
    penguins_species,
    read_penguins("Data/Input/penguins.csv") |>
      clean_penguins() |>
      filter_penguins("Adelie")
  ),
  targets::tar_target(
    penguin_model,
    fit_penguin_model(penguins_species)
  ),
  targets::tar_target(
    penguin_figure,
    plot_penguin_model(
      penguins_species,
      penguin_model
    )
  )
)
