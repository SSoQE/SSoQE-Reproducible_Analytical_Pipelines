library(targets)

targets::tar_source("R/Functions")

targets::tar_option_set(
  packages = c(
    "dplyr",
    "ggplot2",
    "readr",
    "tidyr"
  )
)

list(
  targets::tar_target(
    penguins_file,
    "Data/Input/penguins.csv",
    format = "file"
  ),
  targets::tar_target(
    penguins_raw,
    read_penguins(penguins_file)
  ),
  targets::tar_target(
    penguins_clean,
    clean_penguins(penguins_raw)
  ),
  targets::tar_target(
    selected_species,
    "Adelie"
  ),
  targets::tar_target(
    penguins_species,
    filter_penguins(penguins_clean, selected_species)
  ),
  targets::tar_target(
    penguin_model,
    fit_penguin_model(penguins_species)
  ),
  targets::tar_target(
    penguin_figure,
    plot_penguin_model(penguins_species, penguin_model)
  )
)
