# Prepare the SSoQE penguin targets exercise.
# Generated from Exercise_project_starter/ by R/build_exercise_bootstrap.R.
# Inspect this file before sourcing it from raw GitHub.

exercise_files <- 
list(.gitignore = c(".Rhistory", ".RData", ".Rproj.user/", "/_targets/", 
"/Outputs/"), `Checkpoints/01_default_targets.R` = c("# Created by use_targets().", 
"# Follow the comments below to fill in this target script.", 
"# Then follow the manual to check and run the pipeline:", "#   https://books.ropensci.org/targets/walkthrough.html#inspect-the-pipeline", 
"", "# Load packages required to define the pipeline:", "library(targets)", 
"# library(tarchetypes) # Load other packages as needed.", "", 
"# Set target options:", "tar_option_set(", "  packages = c(\"tibble\") # Packages that your targets need for their tasks.", 
"  # format = \"qs\", # Optionally set the default storage format. qs is fast.", 
"  #", "  # Pipelines that take a long time to run may benefit from", 
"  # optional distributed computing. To use this capability", 
"  # in tar_make(), supply a {crew} controller", "  # as discussed at https://books.ropensci.org/targets/crew.html.", 
"  # Choose a controller that suits your needs. For example, the following", 
"  # sets a controller that scales up to a maximum of two workers", 
"  # which run as local R processes. Each worker launches when there is work", 
"  # to do and exits if 60 seconds pass with no tasks to run.", 
"  #", "  #   controller = crew::crew_controller_local(workers = 2, seconds_idle = 60)", 
"  #", "  # Alternatively, if you want workers to run on a high-performance computing", 
"  # cluster, select a controller from the {crew.cluster} package.", 
"  # For the cloud, see plugin packages like {crew.aws.batch}.", 
"  # The following example is a controller for Sun Grid Engine (SGE).", 
"  #", "  #   controller = crew.cluster::crew_controller_sge(", 
"  #     # Number of workers that the pipeline can scale up to:", 
"  #     workers = 10,", "  #     # It is recommended to set an idle time so workers can shut themselves", 
"  #     # down if they are not running tasks.", "  #     seconds_idle = 120,", 
"  #     # Many clusters install R as an environment module, and you can load it", 
"  #     # with the script_lines argument. To select a specific verison of R,", 
"  #     # you may need to include a version string, e.g. \"module load R/4.3.2\".", 
"  #     # Check with your system administrator if you are unsure.", 
"  #     script_lines = \"module load R\"", "  #   )", "  #", 
"  # Set other options as needed.", ")", "", "# Run the R scripts in the R/ folder with your custom functions:", 
"tar_source()", "# tar_source(\"other_functions.R\") # Source other scripts as needed.", 
"", "# Replace the target list below with your own:", "list(", 
"  tar_target(", "    name = data,", "    command = tibble(x = rnorm(100), y = rnorm(100))", 
"    # format = \"qs\" # Efficient storage for general data objects.", 
"  ),", "  tar_target(", "    name = model,", "    command = coefficients(lm(y ~ x, data = data))", 
"  )", ")"), `Checkpoints/02_penguin_pipeline.R` = c("library(targets)", 
"", "targets::tar_source(\"R/Functions\")", "", "targets::tar_option_set(", 
"  packages = c(", "    \"dplyr\",", "    \"ggplot2\",", "    \"readr\",", 
"    \"tidyr\"", "  )", ")", "", "list(", "  targets::tar_target(", 
"    penguins_file,", "    \"Data/Input/penguins.csv\",", "    format = \"file\"", 
"  ),", "  targets::tar_target(", "    penguins_raw,", "    read_penguins(penguins_file)", 
"  ),", "  targets::tar_target(", "    penguins_clean,", "    clean_penguins(penguins_raw)", 
"  ),", "  targets::tar_target(", "    selected_species,", "    \"Adelie\"", 
"  ),", "  targets::tar_target(", "    penguins_species,", "    filter_penguins(penguins_clean, selected_species)", 
"  ),", "  targets::tar_target(", "    penguin_model,", "    fit_penguin_model(penguins_species)", 
"  ),", "  targets::tar_target(", "    penguin_figure,", "    plot_penguin_model(penguins_species, penguin_model)", 
"  )", ")"), `Checkpoints/03_extended_pipeline.R` = c("library(targets)", 
"", "targets::tar_source(\"R/Functions\")", "", "targets::tar_option_set(", 
"  packages = c(", "    \"dplyr\",", "    \"ggplot2\",", "    \"readr\",", 
"    \"tidyr\"", "  )", ")", "", "list(", "  targets::tar_target(", 
"    penguins_file,", "    \"Data/Input/penguins.csv\",", "    format = \"file\"", 
"  ),", "  targets::tar_target(", "    penguins_raw,", "    read_penguins(penguins_file)", 
"  ),", "  targets::tar_target(", "    penguins_clean,", "    clean_penguins(penguins_raw)", 
"  ),", "  targets::tar_target(", "    selected_species,", "    \"Adelie\"", 
"  ),", "  targets::tar_target(", "    penguins_species,", "    filter_penguins(penguins_clean, selected_species)", 
"  ),", "  targets::tar_target(", "    penguin_model,", "    fit_penguin_model(penguins_species)", 
"  ),", "  targets::tar_target(", "    penguin_figure,", "    plot_penguin_model(penguins_species, penguin_model)", 
"  ),", "  targets::tar_target(", "    penguin_summary,", "    summarise_penguins(penguins_species)", 
"  )", ")"), `Data/Input/penguins.csv` = c("species,island,bill_length_mm,bill_depth_mm,flipper_length_mm,body_mass_g,sex,year", 
"Adelie,Torgersen,39.1,18.7,181,3750,male,2007", "Adelie,Torgersen,39.5,17.4,186,3800,female,2007", 
"Adelie,Torgersen,40.3,18,195,3250,female,2007", "Adelie,Torgersen,,,,,,2007", 
"Adelie,Torgersen,36.7,19.3,193,3450,female,2007", "Adelie,Torgersen,39.3,20.6,190,3650,male,2007", 
"Adelie,Torgersen,38.9,17.8,181,3625,female,2007", "Adelie,Torgersen,39.2,19.6,195,4675,male,2007", 
"Adelie,Torgersen,34.1,18.1,193,3475,,2007", "Adelie,Torgersen,42,20.2,190,4250,,2007", 
"Adelie,Torgersen,37.8,17.1,186,3300,,2007", "Adelie,Torgersen,37.8,17.3,180,3700,,2007", 
"Adelie,Torgersen,41.1,17.6,182,3200,female,2007", "Adelie,Torgersen,38.6,21.2,191,3800,male,2007", 
"Adelie,Torgersen,34.6,21.1,198,4400,male,2007", "Adelie,Torgersen,36.6,17.8,185,3700,female,2007", 
"Adelie,Torgersen,38.7,19,195,3450,female,2007", "Adelie,Torgersen,42.5,20.7,197,4500,male,2007", 
"Adelie,Torgersen,34.4,18.4,184,3325,female,2007", "Adelie,Torgersen,46,21.5,194,4200,male,2007", 
"Adelie,Biscoe,37.8,18.3,174,3400,female,2007", "Adelie,Biscoe,37.7,18.7,180,3600,male,2007", 
"Adelie,Biscoe,35.9,19.2,189,3800,female,2007", "Adelie,Biscoe,38.2,18.1,185,3950,male,2007", 
"Adelie,Biscoe,38.8,17.2,180,3800,male,2007", "Adelie,Biscoe,35.3,18.9,187,3800,female,2007", 
"Adelie,Biscoe,40.6,18.6,183,3550,male,2007", "Adelie,Biscoe,40.5,17.9,187,3200,female,2007", 
"Adelie,Biscoe,37.9,18.6,172,3150,female,2007", "Adelie,Biscoe,40.5,18.9,180,3950,male,2007", 
"Adelie,Dream,39.5,16.7,178,3250,female,2007", "Adelie,Dream,37.2,18.1,178,3900,male,2007", 
"Adelie,Dream,39.5,17.8,188,3300,female,2007", "Adelie,Dream,40.9,18.9,184,3900,male,2007", 
"Adelie,Dream,36.4,17,195,3325,female,2007", "Adelie,Dream,39.2,21.1,196,4150,male,2007", 
"Adelie,Dream,38.8,20,190,3950,male,2007", "Adelie,Dream,42.2,18.5,180,3550,female,2007", 
"Adelie,Dream,37.6,19.3,181,3300,female,2007", "Adelie,Dream,39.8,19.1,184,4650,male,2007", 
"Adelie,Dream,36.5,18,182,3150,female,2007", "Adelie,Dream,40.8,18.4,195,3900,male,2007", 
"Adelie,Dream,36,18.5,186,3100,female,2007", "Adelie,Dream,44.1,19.7,196,4400,male,2007", 
"Adelie,Dream,37,16.9,185,3000,female,2007", "Adelie,Dream,39.6,18.8,190,4600,male,2007", 
"Adelie,Dream,41.1,19,182,3425,male,2007", "Adelie,Dream,37.5,18.9,179,2975,,2007", 
"Adelie,Dream,36,17.9,190,3450,female,2007", "Adelie,Dream,42.3,21.2,191,4150,male,2007", 
"Adelie,Biscoe,39.6,17.7,186,3500,female,2008", "Adelie,Biscoe,40.1,18.9,188,4300,male,2008", 
"Adelie,Biscoe,35,17.9,190,3450,female,2008", "Adelie,Biscoe,42,19.5,200,4050,male,2008", 
"Adelie,Biscoe,34.5,18.1,187,2900,female,2008", "Adelie,Biscoe,41.4,18.6,191,3700,male,2008", 
"Adelie,Biscoe,39,17.5,186,3550,female,2008", "Adelie,Biscoe,40.6,18.8,193,3800,male,2008", 
"Adelie,Biscoe,36.5,16.6,181,2850,female,2008", "Adelie,Biscoe,37.6,19.1,194,3750,male,2008", 
"Adelie,Biscoe,35.7,16.9,185,3150,female,2008", "Adelie,Biscoe,41.3,21.1,195,4400,male,2008", 
"Adelie,Biscoe,37.6,17,185,3600,female,2008", "Adelie,Biscoe,41.1,18.2,192,4050,male,2008", 
"Adelie,Biscoe,36.4,17.1,184,2850,female,2008", "Adelie,Biscoe,41.6,18,192,3950,male,2008", 
"Adelie,Biscoe,35.5,16.2,195,3350,female,2008", "Adelie,Biscoe,41.1,19.1,188,4100,male,2008", 
"Adelie,Torgersen,35.9,16.6,190,3050,female,2008", "Adelie,Torgersen,41.8,19.4,198,4450,male,2008", 
"Adelie,Torgersen,33.5,19,190,3600,female,2008", "Adelie,Torgersen,39.7,18.4,190,3900,male,2008", 
"Adelie,Torgersen,39.6,17.2,196,3550,female,2008", "Adelie,Torgersen,45.8,18.9,197,4150,male,2008", 
"Adelie,Torgersen,35.5,17.5,190,3700,female,2008", "Adelie,Torgersen,42.8,18.5,195,4250,male,2008", 
"Adelie,Torgersen,40.9,16.8,191,3700,female,2008", "Adelie,Torgersen,37.2,19.4,184,3900,male,2008", 
"Adelie,Torgersen,36.2,16.1,187,3550,female,2008", "Adelie,Torgersen,42.1,19.1,195,4000,male,2008", 
"Adelie,Torgersen,34.6,17.2,189,3200,female,2008", "Adelie,Torgersen,42.9,17.6,196,4700,male,2008", 
"Adelie,Torgersen,36.7,18.8,187,3800,female,2008", "Adelie,Torgersen,35.1,19.4,193,4200,male,2008", 
"Adelie,Dream,37.3,17.8,191,3350,female,2008", "Adelie,Dream,41.3,20.3,194,3550,male,2008", 
"Adelie,Dream,36.3,19.5,190,3800,male,2008", "Adelie,Dream,36.9,18.6,189,3500,female,2008", 
"Adelie,Dream,38.3,19.2,189,3950,male,2008", "Adelie,Dream,38.9,18.8,190,3600,female,2008", 
"Adelie,Dream,35.7,18,202,3550,female,2008", "Adelie,Dream,41.1,18.1,205,4300,male,2008", 
"Adelie,Dream,34,17.1,185,3400,female,2008", "Adelie,Dream,39.6,18.1,186,4450,male,2008", 
"Adelie,Dream,36.2,17.3,187,3300,female,2008", "Adelie,Dream,40.8,18.9,208,4300,male,2008", 
"Adelie,Dream,38.1,18.6,190,3700,female,2008", "Adelie,Dream,40.3,18.5,196,4350,male,2008", 
"Adelie,Dream,33.1,16.1,178,2900,female,2008", "Adelie,Dream,43.2,18.5,192,4100,male,2008", 
"Adelie,Biscoe,35,17.9,192,3725,female,2009", "Adelie,Biscoe,41,20,203,4725,male,2009", 
"Adelie,Biscoe,37.7,16,183,3075,female,2009", "Adelie,Biscoe,37.8,20,190,4250,male,2009", 
"Adelie,Biscoe,37.9,18.6,193,2925,female,2009", "Adelie,Biscoe,39.7,18.9,184,3550,male,2009", 
"Adelie,Biscoe,38.6,17.2,199,3750,female,2009", "Adelie,Biscoe,38.2,20,190,3900,male,2009", 
"Adelie,Biscoe,38.1,17,181,3175,female,2009", "Adelie,Biscoe,43.2,19,197,4775,male,2009", 
"Adelie,Biscoe,38.1,16.5,198,3825,female,2009", "Adelie,Biscoe,45.6,20.3,191,4600,male,2009", 
"Adelie,Biscoe,39.7,17.7,193,3200,female,2009", "Adelie,Biscoe,42.2,19.5,197,4275,male,2009", 
"Adelie,Biscoe,39.6,20.7,191,3900,female,2009", "Adelie,Biscoe,42.7,18.3,196,4075,male,2009", 
"Adelie,Torgersen,38.6,17,188,2900,female,2009", "Adelie,Torgersen,37.3,20.5,199,3775,male,2009", 
"Adelie,Torgersen,35.7,17,189,3350,female,2009", "Adelie,Torgersen,41.1,18.6,189,3325,male,2009", 
"Adelie,Torgersen,36.2,17.2,187,3150,female,2009", "Adelie,Torgersen,37.7,19.8,198,3500,male,2009", 
"Adelie,Torgersen,40.2,17,176,3450,female,2009", "Adelie,Torgersen,41.4,18.5,202,3875,male,2009", 
"Adelie,Torgersen,35.2,15.9,186,3050,female,2009", "Adelie,Torgersen,40.6,19,199,4000,male,2009", 
"Adelie,Torgersen,38.8,17.6,191,3275,female,2009", "Adelie,Torgersen,41.5,18.3,195,4300,male,2009", 
"Adelie,Torgersen,39,17.1,191,3050,female,2009", "Adelie,Torgersen,44.1,18,210,4000,male,2009", 
"Adelie,Torgersen,38.5,17.9,190,3325,female,2009", "Adelie,Torgersen,43.1,19.2,197,3500,male,2009", 
"Adelie,Dream,36.8,18.5,193,3500,female,2009", "Adelie,Dream,37.5,18.5,199,4475,male,2009", 
"Adelie,Dream,38.1,17.6,187,3425,female,2009", "Adelie,Dream,41.1,17.5,190,3900,male,2009", 
"Adelie,Dream,35.6,17.5,191,3175,female,2009", "Adelie,Dream,40.2,20.1,200,3975,male,2009", 
"Adelie,Dream,37,16.5,185,3400,female,2009", "Adelie,Dream,39.7,17.9,193,4250,male,2009", 
"Adelie,Dream,40.2,17.1,193,3400,female,2009", "Adelie,Dream,40.6,17.2,187,3475,male,2009", 
"Adelie,Dream,32.1,15.5,188,3050,female,2009", "Adelie,Dream,40.7,17,190,3725,male,2009", 
"Adelie,Dream,37.3,16.8,192,3000,female,2009", "Adelie,Dream,39,18.7,185,3650,male,2009", 
"Adelie,Dream,39.2,18.6,190,4250,male,2009", "Adelie,Dream,36.6,18.4,184,3475,female,2009", 
"Adelie,Dream,36,17.8,195,3450,female,2009", "Adelie,Dream,37.8,18.1,193,3750,male,2009", 
"Adelie,Dream,36,17.1,187,3700,female,2009", "Adelie,Dream,41.5,18.5,201,4000,male,2009", 
"Gentoo,Biscoe,46.1,13.2,211,4500,female,2007", "Gentoo,Biscoe,50,16.3,230,5700,male,2007", 
"Gentoo,Biscoe,48.7,14.1,210,4450,female,2007", "Gentoo,Biscoe,50,15.2,218,5700,male,2007", 
"Gentoo,Biscoe,47.6,14.5,215,5400,male,2007", "Gentoo,Biscoe,46.5,13.5,210,4550,female,2007", 
"Gentoo,Biscoe,45.4,14.6,211,4800,female,2007", "Gentoo,Biscoe,46.7,15.3,219,5200,male,2007", 
"Gentoo,Biscoe,43.3,13.4,209,4400,female,2007", "Gentoo,Biscoe,46.8,15.4,215,5150,male,2007", 
"Gentoo,Biscoe,40.9,13.7,214,4650,female,2007", "Gentoo,Biscoe,49,16.1,216,5550,male,2007", 
"Gentoo,Biscoe,45.5,13.7,214,4650,female,2007", "Gentoo,Biscoe,48.4,14.6,213,5850,male,2007", 
"Gentoo,Biscoe,45.8,14.6,210,4200,female,2007", "Gentoo,Biscoe,49.3,15.7,217,5850,male,2007", 
"Gentoo,Biscoe,42,13.5,210,4150,female,2007", "Gentoo,Biscoe,49.2,15.2,221,6300,male,2007", 
"Gentoo,Biscoe,46.2,14.5,209,4800,female,2007", "Gentoo,Biscoe,48.7,15.1,222,5350,male,2007", 
"Gentoo,Biscoe,50.2,14.3,218,5700,male,2007", "Gentoo,Biscoe,45.1,14.5,215,5000,female,2007", 
"Gentoo,Biscoe,46.5,14.5,213,4400,female,2007", "Gentoo,Biscoe,46.3,15.8,215,5050,male,2007", 
"Gentoo,Biscoe,42.9,13.1,215,5000,female,2007", "Gentoo,Biscoe,46.1,15.1,215,5100,male,2007", 
"Gentoo,Biscoe,44.5,14.3,216,4100,,2007", "Gentoo,Biscoe,47.8,15,215,5650,male,2007", 
"Gentoo,Biscoe,48.2,14.3,210,4600,female,2007", "Gentoo,Biscoe,50,15.3,220,5550,male,2007", 
"Gentoo,Biscoe,47.3,15.3,222,5250,male,2007", "Gentoo,Biscoe,42.8,14.2,209,4700,female,2007", 
"Gentoo,Biscoe,45.1,14.5,207,5050,female,2007", "Gentoo,Biscoe,59.6,17,230,6050,male,2007", 
"Gentoo,Biscoe,49.1,14.8,220,5150,female,2008", "Gentoo,Biscoe,48.4,16.3,220,5400,male,2008", 
"Gentoo,Biscoe,42.6,13.7,213,4950,female,2008", "Gentoo,Biscoe,44.4,17.3,219,5250,male,2008", 
"Gentoo,Biscoe,44,13.6,208,4350,female,2008", "Gentoo,Biscoe,48.7,15.7,208,5350,male,2008", 
"Gentoo,Biscoe,42.7,13.7,208,3950,female,2008", "Gentoo,Biscoe,49.6,16,225,5700,male,2008", 
"Gentoo,Biscoe,45.3,13.7,210,4300,female,2008", "Gentoo,Biscoe,49.6,15,216,4750,male,2008", 
"Gentoo,Biscoe,50.5,15.9,222,5550,male,2008", "Gentoo,Biscoe,43.6,13.9,217,4900,female,2008", 
"Gentoo,Biscoe,45.5,13.9,210,4200,female,2008", "Gentoo,Biscoe,50.5,15.9,225,5400,male,2008", 
"Gentoo,Biscoe,44.9,13.3,213,5100,female,2008", "Gentoo,Biscoe,45.2,15.8,215,5300,male,2008", 
"Gentoo,Biscoe,46.6,14.2,210,4850,female,2008", "Gentoo,Biscoe,48.5,14.1,220,5300,male,2008", 
"Gentoo,Biscoe,45.1,14.4,210,4400,female,2008", "Gentoo,Biscoe,50.1,15,225,5000,male,2008", 
"Gentoo,Biscoe,46.5,14.4,217,4900,female,2008", "Gentoo,Biscoe,45,15.4,220,5050,male,2008", 
"Gentoo,Biscoe,43.8,13.9,208,4300,female,2008", "Gentoo,Biscoe,45.5,15,220,5000,male,2008", 
"Gentoo,Biscoe,43.2,14.5,208,4450,female,2008", "Gentoo,Biscoe,50.4,15.3,224,5550,male,2008", 
"Gentoo,Biscoe,45.3,13.8,208,4200,female,2008", "Gentoo,Biscoe,46.2,14.9,221,5300,male,2008", 
"Gentoo,Biscoe,45.7,13.9,214,4400,female,2008", "Gentoo,Biscoe,54.3,15.7,231,5650,male,2008", 
"Gentoo,Biscoe,45.8,14.2,219,4700,female,2008", "Gentoo,Biscoe,49.8,16.8,230,5700,male,2008", 
"Gentoo,Biscoe,46.2,14.4,214,4650,,2008", "Gentoo,Biscoe,49.5,16.2,229,5800,male,2008", 
"Gentoo,Biscoe,43.5,14.2,220,4700,female,2008", "Gentoo,Biscoe,50.7,15,223,5550,male,2008", 
"Gentoo,Biscoe,47.7,15,216,4750,female,2008", "Gentoo,Biscoe,46.4,15.6,221,5000,male,2008", 
"Gentoo,Biscoe,48.2,15.6,221,5100,male,2008", "Gentoo,Biscoe,46.5,14.8,217,5200,female,2008", 
"Gentoo,Biscoe,46.4,15,216,4700,female,2008", "Gentoo,Biscoe,48.6,16,230,5800,male,2008", 
"Gentoo,Biscoe,47.5,14.2,209,4600,female,2008", "Gentoo,Biscoe,51.1,16.3,220,6000,male,2008", 
"Gentoo,Biscoe,45.2,13.8,215,4750,female,2008", "Gentoo,Biscoe,45.2,16.4,223,5950,male,2008", 
"Gentoo,Biscoe,49.1,14.5,212,4625,female,2009", "Gentoo,Biscoe,52.5,15.6,221,5450,male,2009", 
"Gentoo,Biscoe,47.4,14.6,212,4725,female,2009", "Gentoo,Biscoe,50,15.9,224,5350,male,2009", 
"Gentoo,Biscoe,44.9,13.8,212,4750,female,2009", "Gentoo,Biscoe,50.8,17.3,228,5600,male,2009", 
"Gentoo,Biscoe,43.4,14.4,218,4600,female,2009", "Gentoo,Biscoe,51.3,14.2,218,5300,male,2009", 
"Gentoo,Biscoe,47.5,14,212,4875,female,2009", "Gentoo,Biscoe,52.1,17,230,5550,male,2009", 
"Gentoo,Biscoe,47.5,15,218,4950,female,2009", "Gentoo,Biscoe,52.2,17.1,228,5400,male,2009", 
"Gentoo,Biscoe,45.5,14.5,212,4750,female,2009", "Gentoo,Biscoe,49.5,16.1,224,5650,male,2009", 
"Gentoo,Biscoe,44.5,14.7,214,4850,female,2009", "Gentoo,Biscoe,50.8,15.7,226,5200,male,2009", 
"Gentoo,Biscoe,49.4,15.8,216,4925,male,2009", "Gentoo,Biscoe,46.9,14.6,222,4875,female,2009", 
"Gentoo,Biscoe,48.4,14.4,203,4625,female,2009", "Gentoo,Biscoe,51.1,16.5,225,5250,male,2009", 
"Gentoo,Biscoe,48.5,15,219,4850,female,2009", "Gentoo,Biscoe,55.9,17,228,5600,male,2009", 
"Gentoo,Biscoe,47.2,15.5,215,4975,female,2009", "Gentoo,Biscoe,49.1,15,228,5500,male,2009", 
"Gentoo,Biscoe,47.3,13.8,216,4725,,2009", "Gentoo,Biscoe,46.8,16.1,215,5500,male,2009", 
"Gentoo,Biscoe,41.7,14.7,210,4700,female,2009", "Gentoo,Biscoe,53.4,15.8,219,5500,male,2009", 
"Gentoo,Biscoe,43.3,14,208,4575,female,2009", "Gentoo,Biscoe,48.1,15.1,209,5500,male,2009", 
"Gentoo,Biscoe,50.5,15.2,216,5000,female,2009", "Gentoo,Biscoe,49.8,15.9,229,5950,male,2009", 
"Gentoo,Biscoe,43.5,15.2,213,4650,female,2009", "Gentoo,Biscoe,51.5,16.3,230,5500,male,2009", 
"Gentoo,Biscoe,46.2,14.1,217,4375,female,2009", "Gentoo,Biscoe,55.1,16,230,5850,male,2009", 
"Gentoo,Biscoe,44.5,15.7,217,4875,,2009", "Gentoo,Biscoe,48.8,16.2,222,6000,male,2009", 
"Gentoo,Biscoe,47.2,13.7,214,4925,female,2009", "Gentoo,Biscoe,,,,,,2009", 
"Gentoo,Biscoe,46.8,14.3,215,4850,female,2009", "Gentoo,Biscoe,50.4,15.7,222,5750,male,2009", 
"Gentoo,Biscoe,45.2,14.8,212,5200,female,2009", "Gentoo,Biscoe,49.9,16.1,213,5400,male,2009", 
"Chinstrap,Dream,46.5,17.9,192,3500,female,2007", "Chinstrap,Dream,50,19.5,196,3900,male,2007", 
"Chinstrap,Dream,51.3,19.2,193,3650,male,2007", "Chinstrap,Dream,45.4,18.7,188,3525,female,2007", 
"Chinstrap,Dream,52.7,19.8,197,3725,male,2007", "Chinstrap,Dream,45.2,17.8,198,3950,female,2007", 
"Chinstrap,Dream,46.1,18.2,178,3250,female,2007", "Chinstrap,Dream,51.3,18.2,197,3750,male,2007", 
"Chinstrap,Dream,46,18.9,195,4150,female,2007", "Chinstrap,Dream,51.3,19.9,198,3700,male,2007", 
"Chinstrap,Dream,46.6,17.8,193,3800,female,2007", "Chinstrap,Dream,51.7,20.3,194,3775,male,2007", 
"Chinstrap,Dream,47,17.3,185,3700,female,2007", "Chinstrap,Dream,52,18.1,201,4050,male,2007", 
"Chinstrap,Dream,45.9,17.1,190,3575,female,2007", "Chinstrap,Dream,50.5,19.6,201,4050,male,2007", 
"Chinstrap,Dream,50.3,20,197,3300,male,2007", "Chinstrap,Dream,58,17.8,181,3700,female,2007", 
"Chinstrap,Dream,46.4,18.6,190,3450,female,2007", "Chinstrap,Dream,49.2,18.2,195,4400,male,2007", 
"Chinstrap,Dream,42.4,17.3,181,3600,female,2007", "Chinstrap,Dream,48.5,17.5,191,3400,male,2007", 
"Chinstrap,Dream,43.2,16.6,187,2900,female,2007", "Chinstrap,Dream,50.6,19.4,193,3800,male,2007", 
"Chinstrap,Dream,46.7,17.9,195,3300,female,2007", "Chinstrap,Dream,52,19,197,4150,male,2007", 
"Chinstrap,Dream,50.5,18.4,200,3400,female,2008", "Chinstrap,Dream,49.5,19,200,3800,male,2008", 
"Chinstrap,Dream,46.4,17.8,191,3700,female,2008", "Chinstrap,Dream,52.8,20,205,4550,male,2008", 
"Chinstrap,Dream,40.9,16.6,187,3200,female,2008", "Chinstrap,Dream,54.2,20.8,201,4300,male,2008", 
"Chinstrap,Dream,42.5,16.7,187,3350,female,2008", "Chinstrap,Dream,51,18.8,203,4100,male,2008", 
"Chinstrap,Dream,49.7,18.6,195,3600,male,2008", "Chinstrap,Dream,47.5,16.8,199,3900,female,2008", 
"Chinstrap,Dream,47.6,18.3,195,3850,female,2008", "Chinstrap,Dream,52,20.7,210,4800,male,2008", 
"Chinstrap,Dream,46.9,16.6,192,2700,female,2008", "Chinstrap,Dream,53.5,19.9,205,4500,male,2008", 
"Chinstrap,Dream,49,19.5,210,3950,male,2008", "Chinstrap,Dream,46.2,17.5,187,3650,female,2008", 
"Chinstrap,Dream,50.9,19.1,196,3550,male,2008", "Chinstrap,Dream,45.5,17,196,3500,female,2008", 
"Chinstrap,Dream,50.9,17.9,196,3675,female,2009", "Chinstrap,Dream,50.8,18.5,201,4450,male,2009", 
"Chinstrap,Dream,50.1,17.9,190,3400,female,2009", "Chinstrap,Dream,49,19.6,212,4300,male,2009", 
"Chinstrap,Dream,51.5,18.7,187,3250,male,2009", "Chinstrap,Dream,49.8,17.3,198,3675,female,2009", 
"Chinstrap,Dream,48.1,16.4,199,3325,female,2009", "Chinstrap,Dream,51.4,19,201,3950,male,2009", 
"Chinstrap,Dream,45.7,17.3,193,3600,female,2009", "Chinstrap,Dream,50.7,19.7,203,4050,male,2009", 
"Chinstrap,Dream,42.5,17.3,187,3350,female,2009", "Chinstrap,Dream,52.2,18.8,197,3450,male,2009", 
"Chinstrap,Dream,45.2,16.6,191,3250,female,2009", "Chinstrap,Dream,49.3,19.9,203,4050,male,2009", 
"Chinstrap,Dream,50.2,18.8,202,3800,male,2009", "Chinstrap,Dream,45.6,19.4,194,3525,female,2009", 
"Chinstrap,Dream,51.9,19.5,206,3950,male,2009", "Chinstrap,Dream,46.8,16.5,189,3650,female,2009", 
"Chinstrap,Dream,45.7,17,195,3650,female,2009", "Chinstrap,Dream,55.8,19.8,207,4000,male,2009", 
"Chinstrap,Dream,43.5,18.1,202,3400,female,2009", "Chinstrap,Dream,49.6,18.2,193,3775,male,2009", 
"Chinstrap,Dream,50.8,19,210,4100,male,2009", "Chinstrap,Dream,50.2,18.7,198,3775,female,2009"
), `R/Functions/clean_penguins.R` = c("#' Prepare penguin measurements for analysis", 
"#'", "#' @param data_source A data frame containing Palmer penguin measurements.", 
"#'", "#' @return A tibble with complete analysis columns and character species names.", 
"#' @export", "clean_penguins <- function(data_source) {", "  required_columns <- c(", 
"    \"species\",", "    \"bill_length_mm\",", "    \"bill_depth_mm\",", 
"    \"body_mass_g\"", "  )", "", "  missing_columns <- setdiff(required_columns, names(data_source))", 
"", "  if (length(missing_columns) > 0L) {", "    stop(", "      \"The penguin data are missing required analysis columns.\",", 
"      call. = FALSE", "    )", "  }", "", "  data_source |>", 
"    dplyr::select(dplyr::all_of(required_columns)) |>", "    tidyr::drop_na() |>", 
"    dplyr::mutate(species = as.character(species))", "}"), `R/Functions/filter_penguins.R` = c("#' Select one penguin species", 
"#'", "#' @param data_source A cleaned penguin data frame.", 
"#' @param species Character scalar naming the species to retain.", 
"#'", "#' @return A tibble containing measurements for the selected species.", 
"#' @export", "filter_penguins <- function(data_source, species) {", 
"  if (!is.character(species) || length(species) != 1L) {", "    stop(\"`species` must be one character value.\", call. = FALSE)", 
"  }", "", "  data_selected <- data_source |>", "    dplyr::filter(.data$species == .env$species)", 
"", "  if (nrow(data_selected) == 0L) {", "    stop(\"The selected species is absent from the data.\", call. = FALSE)", 
"  }", "", "  data_selected", "}"), `R/Functions/fit_penguin_model.R` = c("#' Fit the penguin bill model", 
"#'", "#' @param data_source Measurements for one penguin species.", 
"#'", "#' @return A linear model of bill length as a function of bill depth.", 
"#' @export", "fit_penguin_model <- function(data_source) {", 
"  stats::lm(", "    formula = bill_length_mm ~ bill_depth_mm,", 
"    data = data_source", "  )", "}"), `R/Functions/plot_penguin_model.R` = c("#' Plot penguin measurements and their fitted relationship", 
"#'", "#' @param data_source Measurements for one penguin species.", 
"#' @param model A fitted linear model returned by [fit_penguin_model()].", 
"#'", "#' @return A ggplot object.", "#' @export", "plot_penguin_model <- function(data_source, model) {", 
"  model_coefficients <- stats::coef(model)", "  species_label <- unique(data_source$species)", 
"", "  ggplot2::ggplot(", "    data = data_source,", "    mapping = ggplot2::aes(", 
"      x = bill_depth_mm,", "      y = bill_length_mm", "    )", 
"  ) +", "    ggplot2::geom_point(shape = 19, size = 2.2, alpha = 0.75) +", 
"    ggplot2::geom_abline(", "      intercept = unname(model_coefficients[[1]]),", 
"      slope = unname(model_coefficients[[2]]),", "      linewidth = 1.1", 
"    ) +", "    ggplot2::labs(", "      title = species_label,", 
"      x = \"Bill depth (mm)\",", "      y = \"Bill length (mm)\"", 
"    ) +", "    ggplot2::theme_minimal(base_size = 14)", "}"), 
    `R/Functions/read_penguins.R` = c("#' Read the penguin input data", 
    "#'", "#' @param file Character scalar giving the path to the CSV input file.", 
    "#'", "#' @return A tibble containing the unmodified input data.", 
    "#' @export", "read_penguins <- function(file) {", "  if (!is.character(file) || length(file) != 1L || !file.exists(file)) {", 
    "    stop(\"`file` must identify one existing CSV file.\", call. = FALSE)", 
    "  }", "", "  readr::read_csv(", "    file = file,", "    show_col_types = FALSE", 
    "  )", "}"), `R/Functions/split_penguins.R` = c("#' Split penguin measurements by species", 
    "#'", "#' @param data_source A cleaned penguin data frame.", 
    "#'", "#' @return A named list containing one tibble per species.", 
    "#' @export", "split_penguins <- function(data_source) {", 
    "  split(", "    x = data_source,", "    f = data_source$species", 
    "  )", "}"), `R/Functions/summarise_penguins.R` = c("#' Summarise measurements for one penguin species", 
    "#'", "#' @param data_source Measurements for one penguin species.", 
    "#'", "#' @return A one-row tibble with sample size and mean bill measurements.", 
    "#' @export", "summarise_penguins <- function(data_source) {", 
    "  data_source |>", "    dplyr::summarise(", "      species = dplyr::first(.data$species),", 
    "      sample_size = dplyr::n(),", "      mean_bill_length_mm = mean(.data$bill_length_mm),", 
    "      mean_bill_depth_mm = mean(.data$bill_depth_mm)", "    )", 
    "}"), `Solutions/_targets.R` = c("library(targets)", "", 
    "targets::tar_source(\"R/Functions\")", "", "targets::tar_option_set(", 
    "  packages = c(", "    \"dplyr\",", "    \"ggplot2\",", 
    "    \"readr\",", "    \"tidyr\"", "  )", ")", "", "list(", 
    "  targets::tar_target(", "    penguins_file,", "    \"Data/Input/penguins.csv\",", 
    "    format = \"file\"", "  ),", "  targets::tar_target(", 
    "    penguins_raw,", "    read_penguins(penguins_file)", 
    "  ),", "  targets::tar_target(", "    penguins_clean,", 
    "    clean_penguins(penguins_raw)", "  ),", "  targets::tar_target(", 
    "    selected_species,", "    \"Adelie\"", "  ),", "  targets::tar_target(", 
    "    penguins_species,", "    filter_penguins(penguins_clean, selected_species)", 
    "  ),", "  targets::tar_target(", "    penguin_model,", "    fit_penguin_model(penguins_species)", 
    "  ),", "  targets::tar_target(", "    penguin_figure,", 
    "    plot_penguin_model(penguins_species, penguin_model)", 
    "  ),", "  targets::tar_target(", "    penguin_summary,", 
    "    summarise_penguins(penguins_species)", "  )", ")"), 
    `Solutions/branching_preview.R` = c("library(targets)", "", 
    "targets::tar_source(\"R/Functions\")", "", "targets::tar_option_set(", 
    "  packages = c(", "    \"dplyr\",", "    \"ggplot2\",", 
    "    \"readr\",", "    \"tidyr\"", "  )", ")", "", "list(", 
    "  targets::tar_target(", "    penguins_file,", "    \"Data/Input/penguins.csv\",", 
    "    format = \"file\"", "  ),", "  targets::tar_target(", 
    "    penguins_raw,", "    read_penguins(penguins_file)", 
    "  ),", "  targets::tar_target(", "    penguins_clean,", 
    "    clean_penguins(penguins_raw)", "  ),", "  targets::tar_target(", 
    "    penguins_by_species,", "    split_penguins(penguins_clean),", 
    "    iteration = \"list\"", "  ),", "  targets::tar_target(", 
    "    penguin_model,", "    fit_penguin_model(penguins_by_species),", 
    "    pattern = map(penguins_by_species),", "    iteration = \"list\"", 
    "  ),", "  targets::tar_target(", "    penguin_figure,", 
    "    plot_penguin_model(penguins_by_species, penguin_model),", 
    "    pattern = map(penguins_by_species, penguin_model),", 
    "    iteration = \"list\"", "  ),", "  targets::tar_target(", 
    "    penguin_summary,", "    summarise_penguins(penguins_by_species),", 
    "    pattern = map(penguins_by_species)", "  )", ")"), START_HERE.md = c("# Penguin `targets` exercise", 
    "", "This directory contains the prepared files for a standalone exercise project.", 
    "", "1. In RStudio, create a new project named `targets-penguins` outside the lecture repository.", 
    "2. Run the bootstrap command from the slides or handout. It creates `Checkpoints/`, `Data/`, `R/`, `Solutions/`, and this guide in one small web request.", 
    "3. Confirm that the prepared directories appear in the project root.", 
    "4. Follow the exercise handout, beginning with `targets::use_targets()`.", 
    "", "The project deliberately starts without `_targets.R`. The `Data/` and `R/Functions/` directories contain the prepared pieces. `Checkpoints/` lets you rejoin the exercise, and `Solutions/` contains the completed pipeline and optional branching example.", 
    "", "The bootstrap refuses to overwrite existing files. If it reports a conflict, use a new blank RStudio Project or move the listed files before trying again.", 
    "", "If you are reading this file inside `Exercise_project_starter/` in the lecture repository, do not run `use_targets()` there. Create the separate RStudio Project first."
    ))

project_root <- normalizePath(
  path = getwd(),
  winslash = "/",
  mustWork = TRUE
)

project_files <- list.files(
  path = project_root,
  pattern = "[.]Rproj$",
  ignore.case = TRUE
)

if (length(project_files) != 1L) {
  stop(
    "Open the blank targets-penguins RStudio Project before running this script.",
    call. = FALSE
  )
}

lecture_markers <- c(
  file.path(project_root, "Presentation", "presentation.qmd"),
  file.path(project_root, "R", "render.R")
)

if (all(file.exists(lecture_markers))) {
  stop(
    "This is the lecture repository. Run the bootstrap in a new RStudio Project.",
    call. = FALSE
  )
}

relative_paths <- names(exercise_files)
destinations <- file.path(project_root, relative_paths)
conflicts <- relative_paths[file.exists(destinations)]

if (length(conflicts) > 0L) {
  stop(
    paste0(
      "Nothing was written because these files already exist:\n- ",
      paste(conflicts, collapse = "\n- ")
    ),
    call. = FALSE
  )
}

payloads <- lapply(
  exercise_files,
  function(lines) {
    charToRaw(
      enc2utf8(
        paste0(
          paste(lines, collapse = "\n"),
          "\n"
        )
      )
    )
  }
)

for (index in seq_along(destinations)) {
  destination <- destinations[[index]]
  directory <- dirname(destination)
  dir.create(
    path = directory,
    recursive = TRUE,
    showWarnings = FALSE
  )
  temporary_file <- tempfile(
    pattern = ".ssoqe-bootstrap-",
    tmpdir = directory
  )
  writeBin(
    object = payloads[[index]],
    con = temporary_file
  )
  if (!file.rename(temporary_file, destination)) {
    unlink(temporary_file)
    stop(
      paste("Could not create", relative_paths[[index]]),
      call. = FALSE
    )
  }
}

verified <- vapply(
  seq_along(destinations),
  function(index) {
    destination_size <- file.info(destinations[[index]])$size
    destination_raw <- readBin(
      con = destinations[[index]],
      what = "raw",
      n = destination_size
    )
    identical(destination_raw, payloads[[index]])
  },
  logical(1)
)

if (!all(verified)) {
  stop(
    paste(
      "Verification failed for",
      paste(relative_paths[!verified], collapse = ", ")
    ),
    call. = FALSE
  )
}

message(
  "Created and verified ",
  length(destinations),
  " prepared exercise files in ",
  project_root,
  "."
)
message("Prepared data: Data/Input/penguins.csv")
message("Prepared functions: R/Functions/ (7 editable files)")
message("Recovery files: Checkpoints/ and Solutions/")
message("Next, run targets::use_targets()")

invisible(destinations)
