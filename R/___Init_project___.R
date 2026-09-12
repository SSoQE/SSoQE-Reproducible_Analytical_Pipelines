#----------------------------------------------------------#
#
#              Reproducible Analytical Pipelines
#
#                     Project setup
#
#                     O. Mottl
#                        2026
#
#----------------------------------------------------------#

# Run this script once when preparing a new local copy of the project.

if (!requireNamespace("renv", quietly = TRUE)) {
  utils::install.packages("renv")
}

renv::activate()

if (file.exists("renv.lock")) {
  renv::restore(
    lockfile = "renv.lock",
    prompt = FALSE
  )
}

project_packages <- c(
  "countdown",
  "fs",
  "here",
  "janitor",
  "jsonlite",
  "knitr",
  "languageserver",
  "palmerpenguins",
  "qrcode",
  "quarto",
  "renv",
  "rlang",
  "targets",
  "tidyverse",
  "usethis",
  "visNetwork"
)

renv::install(project_packages)

stopifnot(
  requireNamespace("palmerpenguins", quietly = TRUE),
  requireNamespace("targets", quietly = TRUE),
  requireNamespace("visNetwork", quietly = TRUE)
)

renv::snapshot(
  lockfile = "renv.lock",
  packages = project_packages,
  update = TRUE,
  prompt = FALSE
)

message("Project setup completed.")
