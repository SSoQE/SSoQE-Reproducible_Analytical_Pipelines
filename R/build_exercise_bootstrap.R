#!/usr/bin/env Rscript

project_root <- normalizePath(
  path = getwd(),
  winslash = "/",
  mustWork = TRUE
)

source_directory <- file.path(
  project_root,
  "Exercise_project_starter"
)
output_file <- file.path(
  project_root,
  "setup_exercise.R"
)

if (!dir.exists(source_directory)) {
  stop(
    "Run this script from the lecture repository root.",
    call. = FALSE
  )
}

relative_paths <- list.files(
  path = source_directory,
  all.files = TRUE,
  full.names = FALSE,
  recursive = TRUE,
  include.dirs = FALSE,
  no.. = TRUE
)
relative_paths <- sort(
  gsub(
    pattern = "\\\\",
    replacement = "/",
    x = relative_paths
  )
)

exercise_files <- stats::setNames(
  lapply(
    relative_paths,
    function(relative_path) {
      input_file <- file.path(
        source_directory,
        relative_path
      )
      input_size <- file.info(input_file)$size
      input_raw <- readBin(
        con = input_file,
        what = "raw",
        n = input_size
      )
      input_text <- rawToChar(input_raw)
      input_text <- gsub(
        pattern = "\r\n?",
        replacement = "\n",
        x = input_text
      )
      input_text <- sub(
        pattern = "\n+$",
        replacement = "",
        x = input_text
      )
      strsplit(
        x = input_text,
        split = "\n",
        fixed = FALSE
      )[[1]]
    }
  ),
  relative_paths
)

header <- c(
  "# Prepare the SSoQE penguin targets exercise.",
  "# Generated from Exercise_project_starter/ by R/build_exercise_bootstrap.R.",
  "# Inspect this file before sourcing it from raw GitHub.",
  "",
  "exercise_files <- "
)

footer <- c(
  "",
  "project_root <- normalizePath(",
  "  path = getwd(),",
  "  winslash = \"/\",",
  "  mustWork = TRUE",
  ")",
  "",
  "project_files <- list.files(",
  "  path = project_root,",
  "  pattern = \"[.]Rproj$\",",
  "  ignore.case = TRUE",
  ")",
  "",
  "if (length(project_files) != 1L) {",
  "  stop(",
  "    \"Open the blank targets-penguins RStudio Project before running this script.\",",
  "    call. = FALSE",
  "  )",
  "}",
  "",
  "lecture_markers <- c(",
  "  file.path(project_root, \"Presentation\", \"presentation.qmd\"),",
  "  file.path(project_root, \"R\", \"render.R\")",
  ")",
  "",
  "if (all(file.exists(lecture_markers))) {",
  "  stop(",
  "    \"This is the lecture repository. Run the bootstrap in a new RStudio Project.\",",
  "    call. = FALSE",
  "  )",
  "}",
  "",
  "relative_paths <- names(exercise_files)",
  "destinations <- file.path(project_root, relative_paths)",
  "conflicts <- relative_paths[file.exists(destinations)]",
  "",
  "if (length(conflicts) > 0L) {",
  "  stop(",
  "    paste0(",
  "      \"Nothing was written because these files already exist:\\n- \",",
  "      paste(conflicts, collapse = \"\\n- \")",
  "    ),",
  "    call. = FALSE",
  "  )",
  "}",
  "",
  "payloads <- lapply(",
  "  exercise_files,",
  "  function(lines) {",
  "    charToRaw(",
  "      enc2utf8(",
  "        paste0(",
  "          paste(lines, collapse = \"\\n\"),",
  "          \"\\n\"",
  "        )",
  "      )",
  "    )",
  "  }",
  ")",
  "",
  "for (index in seq_along(destinations)) {",
  "  destination <- destinations[[index]]",
  "  directory <- dirname(destination)",
  "  dir.create(",
  "    path = directory,",
  "    recursive = TRUE,",
  "    showWarnings = FALSE",
  "  )",
  "  temporary_file <- tempfile(",
  "    pattern = \".ssoqe-bootstrap-\",",
  "    tmpdir = directory",
  "  )",
  "  writeBin(",
  "    object = payloads[[index]],",
  "    con = temporary_file",
  "  )",
  "  if (!file.rename(temporary_file, destination)) {",
  "    unlink(temporary_file)",
  "    stop(",
  "      paste(\"Could not create\", relative_paths[[index]]),",
  "      call. = FALSE",
  "    )",
  "  }",
  "}",
  "",
  "verified <- vapply(",
  "  seq_along(destinations),",
  "  function(index) {",
  "    destination_size <- file.info(destinations[[index]])$size",
  "    destination_raw <- readBin(",
  "      con = destinations[[index]],",
  "      what = \"raw\",",
  "      n = destination_size",
  "    )",
  "    identical(destination_raw, payloads[[index]])",
  "  },",
  "  logical(1)",
  ")",
  "",
  "if (!all(verified)) {",
  "  stop(",
  "    paste(",
  "      \"Verification failed for\",",
  "      paste(relative_paths[!verified], collapse = \", \")",
  "    ),",
  "    call. = FALSE",
  "  )",
  "}",
  "",
  "message(",
  "  \"Created and verified \",",
  "  length(destinations),",
  "  \" prepared exercise files in \",",
  "  project_root,",
  "  \".\"",
  ")",
  "message(\"Prepared data: Data/Input/penguins.csv\")",
  "message(\"Prepared functions: R/Functions/ (7 editable files)\")",
  "message(\"Recovery files: Checkpoints/ and Solutions/\")",
  "if (file.exists(file.path(project_root, \"_targets.R\"))) {",
  "  message(\"Next, replace the generated example in _targets.R for Exercise 2.\")",
  "} else {",
  "  message(\"Next, run targets::use_targets()\")",
  "}",
  "",
  "invisible(destinations)"
)

connection <- file(
  description = output_file,
  open = "wb"
)
on.exit(close(connection), add = TRUE)
writeLines(
  text = header,
  con = connection,
  useBytes = TRUE
)
dput(
  x = exercise_files,
  file = connection,
  control = "all"
)
writeLines(
  text = footer,
  con = connection,
  useBytes = TRUE
)

message(
  "Generated ",
  output_file,
  " from ",
  length(relative_paths),
  " starter files."
)