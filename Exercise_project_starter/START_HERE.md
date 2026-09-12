# Penguin `targets` exercise

This directory contains the prepared files for a standalone exercise project.

1. In RStudio, create a new project named `targets-penguins` outside the lecture repository.
2. Run the bootstrap command from the slides or handout. It creates `Checkpoints/`, `Data/`, `R/`, `Solutions/`, and this guide in one small web request.
3. Confirm that the prepared directories appear in the project root.
4. Follow the exercise handout, beginning with `targets::use_targets()`.

The project deliberately starts without `_targets.R`. The `Data/` and `R/Functions/` directories contain the prepared pieces. `Checkpoints/` lets you rejoin the exercise, and `Solutions/` contains the completed pipeline and optional branching example.

The bootstrap refuses to overwrite existing files. If it reports a conflict, use a new blank RStudio Project or move the listed files before trying again.

If you are reading this file inside `Exercise_project_starter/` in the lecture repository, do not run `use_targets()` there. Create the separate RStudio Project first.