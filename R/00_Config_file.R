#----------------------------------------------------------#
#
#              Reproducible Analytical Pipelines
#
#                     Config file
#
#                     O. Mottl
#                        2026
#
#----------------------------------------------------------#

here::i_am("R/00_Config_file.R")

# This file is sourced during rendering. It checks dependencies and prepares
# the visual theme. Package installation and restoration belong in
# R/___Init_project___.R, not in the render path.

required_packages <- c(
  "countdown",
  "fs",
  "here",
  "jsonlite",
  "knitr",
  "purrr",
  "qrcode",
  "quarto"
)

missing_packages <- required_packages[
  !vapply(
    X = required_packages,
    FUN = requireNamespace,
    FUN.VALUE = logical(1),
    quietly = TRUE
  )
]

if (length(missing_packages) > 0L) {
  stop(
    paste0(
      "Missing project packages: ",
      paste(missing_packages, collapse = ", "),
      ". Run R/___Init_project___.R before rendering."
    ),
    call. = FALSE
  )
}

set.seed(900723)

source(here::here("R/generate_theme.R"))
source(here::here("R/set_r_theme.R"))
