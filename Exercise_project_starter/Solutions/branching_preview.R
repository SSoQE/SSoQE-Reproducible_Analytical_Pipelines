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
    penguins_by_species,
    split_penguins(penguins_clean),
    iteration = "list"
  ),
  targets::tar_target(
    penguin_model,
    fit_penguin_model(penguins_by_species),
    pattern = map(penguins_by_species),
    iteration = "list"
  ),
  targets::tar_target(
    penguin_figure,
    plot_penguin_model(penguins_by_species, penguin_model),
    pattern = map(penguins_by_species, penguin_model),
    iteration = "list"
  ),
  targets::tar_target(
    penguin_summary,
    summarise_penguins(penguins_by_species),
    pattern = map(penguins_by_species)
  )
)
