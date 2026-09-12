#----------------------------------------------------------#
#
#              Reproducible Analytical Pipelines
#
#                    Render exercises
#
#                     O. Mottl
#                        2026
#
#----------------------------------------------------------#

source(here::here("R/00_Config_file.R"))

quarto::quarto_render(
  input = here::here("R/Exercises/01_targets_workshop.qmd")
)
