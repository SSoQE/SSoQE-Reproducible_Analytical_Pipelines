# Penguin `targets` exercise

This guide arrives during Exercise 2, after you have created a separate `targets-penguins` RStudio Project and run the generated example pipeline in Exercise 1.

1. Confirm that this file is inside your `targets-penguins` project, not the lecture repository.
2. The bootstrap has added `Checkpoints/`, `Data/`, `R/Functions/`, and `Solutions/` without replacing your `_targets.R` or `_targets/` store.
3. Follow Exercise 2 in the presentation to replace the generated target list with the penguin pipeline. If you need the complete script, open `Checkpoints/02_penguin_pipeline.R`.

`Data/` and `R/Functions/` hold local, editable prepared pieces. `Checkpoints/` lets you rejoin the exercise, and `Solutions/` contains the completed pipeline and optional branching example.

The bootstrap refuses to overwrite existing files. If it reports a conflict, check the listed files and ask the instructor before retrying; keep the `_targets.R` you created in Exercise 1.

If you are reading this file inside `Exercise_project_starter/` in the lecture repository, do not run `use_targets()` there. Create the separate RStudio Project first.