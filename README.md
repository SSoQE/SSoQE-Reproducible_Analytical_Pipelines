<div align="center">

<img src="https://ssoqe.github.io/SSoQE_website/photos/SSOQE_logo3.png" width="150" alt="SSoQE logo">

# Reproducible Analytical Pipelines

**SSoQE 2026 · Saturday, 19 September · 11:00–12:30**

[Presentation](https://ssoqe.github.io/SSoQE-Reproducible_Analytical_Pipelines/) ·
[SSoQE website](https://ssoqe.github.io/SSoQE_website/) ·
[2026 programme](https://ssoqe.github.io/SSoQE_website/About/program.html)

</div>

## About the lesson

This 90-minute practical introduction uses the R package [`targets`](https://docs.ropensci.org/targets/) to turn a familiar penguin analysis into an explicit, dependency-aware pipeline. It assumes basic experience with R functions and RStudio Projects, but no previous experience with pipeline frameworks.

The lecture repository contains the slides, handout, and a self-contained [`setup_exercise.R`](setup_exercise.R). Participants first create a new RStudio Project outside the lecture repository, then source this small bootstrap script from raw GitHub. It writes and verifies all prepared files in one web request. Participants never create `_targets.R` or `_targets/` in the lecture repository.

## Learning outcomes

By the end of the session, participants will be able to:

- create the default pipeline infrastructure with `targets::use_targets()`;
- translate an ordinary analysis into targets and explicit dependencies;
- inspect, build, rerun, and retrieve results from a pipeline;
- predict which targets become outdated after code or data changes;
- debug a failing target without discarding completed work; and
- extend a pipeline with a new output and explain selective rebuilding.

## Before the lesson

### Participants

1. Install a current release of R and RStudio.
2. Install the packages used in the exercises:

   ```r
   install.packages(
     c(
       "targets",
       "visNetwork",
       "dplyr",
       "ggplot2",
       "readr",
       "tibble",
       "tidyr"
     )
   )
   ```

3. In RStudio, choose **File > New Project > New Directory > New Project**. Create `targets-penguins` in a personal working location outside the lecture repository.
4. Optionally inspect the raw [`setup_exercise.R`](https://raw.githubusercontent.com/SSoQE/SSoQE-Reproducible_Analytical_Pipelines/main/setup_exercise.R).
5. In the new project's Console, run:

   ```r
   source(paste0(
     "https://raw.githubusercontent.com/SSoQE/",
     "SSoQE-Reproducible_Analytical_Pipelines/main/setup_exercise.R"
   ))
   ```

6. Confirm that `Checkpoints/`, `Data/`, `R/`, `Solutions/`, and `START_HERE.md` appear in the project root.

### Instructors and contributors

Open `SSoQE-Reproducible_Analytical_Pipelines.Rproj` only when developing or rendering the lesson. Run the project setup once:

```r
source("R/___Init_project___.R")
```

The setup restores the recorded lecture environment and installs the packages declared by the lesson. Ordinary rendering never installs or restores packages.

After changing files in `Exercise_project_starter/`, regenerate the self-contained bootstrap with:

```r
Rscript R/build_exercise_bootstrap.R
```

## Exercise route

Follow [`R/Exercises/01_targets_workshop.qmd`](R/Exercises/01_targets_workshop.qmd), but run every learner command in the separate `targets-penguins` project:

1. **Set up:** create a separate project, download the prepared local files with the one-request bootstrap, then create `_targets.R` with `targets::use_targets()` and inspect its manifest.
2. **Build:** assemble a seven-target penguin pipeline from the prepared parts, run it twice, and retrieve its figure.
3. **Change and expand:** edit a function, predict selective invalidation, add a summary target, and rebuild.

Inside the new project, reusable functions are in `R/Functions/`, the tracked input is `Data/Input/penguins.csv`, and recovery files are in `Checkpoints/`. Pipeline metadata and participant-generated output stay inside the separate project and its `.gitignore` excludes them.

## Checkpoints and reset

If you fall behind, copy the appropriate checkpoint to `_targets.R` in the root of your `targets-penguins` project:

- `Checkpoints/01_default_targets.R`
- `Checkpoints/02_penguin_pipeline.R`
- `Checkpoints/03_extended_pipeline.R`

For example:

```r
file.copy(
  "Checkpoints/02_penguin_pipeline.R",
  "_targets.R",
  overwrite = TRUE
)
```

The completed pipeline is available at `Solutions/_targets.R`. Resetting means replacing `_targets.R` with the relevant checkpoint. You do not need to delete the `_targets/` cache.

## Self-study map

### Start again tomorrow

- [Get started in four minutes](https://docs.ropensci.org/targets/#get-started-in-4-minutes):
  replay the basic lifecycle quickly.
- [Official walkthrough](https://books.ropensci.org/targets/walkthrough.html):
  reconstruct a small pipeline carefully in one tutorial.
- The checkpoints and solution in your exercise project: repeat the full lesson offline.

### Understand the ideas more deeply

- [The `targets` user manual](https://books.ropensci.org/targets/): the
  authoritative book-length reference. Start with
  [functions](https://books.ropensci.org/targets/functions.html),
  [targets and dependencies](https://books.ropensci.org/targets/targets.html),
  [project structure](https://books.ropensci.org/targets/projects.html), and
  [local data and files](https://books.ropensci.org/targets/data.html).
- [Building reproducible analytical pipelines with R](https://raps-with-r.dev/targets.html):
  connect functions, projects, dependency management, testing, and automation.

### Practise with another guided course

- [Carpentries Incubator `targets` workshop](https://carpentries-incubator.github.io/targets-workshop/):
  a detailed hands-on course covering setup through reports; currently marked
  **pre-alpha** by its maintainers.
- [Reproducible computation at scale in R](https://wlandau.github.io/targets-tutorial/):
  a visual tutorial on how changes propagate through larger workflows.

### When something breaks

- [Debugging guide](https://books.ropensci.org/targets/debugging.html): isolate
  the target, load its inputs, reproduce the error, and rerun.
- [Help guide](https://books.ropensci.org/targets/help.html): prepare a useful
  reproducible example.
- [`targets` GitHub Discussions](https://github.com/ropensci/targets/discussions):
  search questions not answered by the manual.
- [Function reference](https://docs.ropensci.org/targets/reference/index.html):
  look up arguments when you already know the command name.

### When ready to scale

- [Dynamic branching](https://books.ropensci.org/targets/dynamic.html): repeat
  work over groups or parameter combinations.
- [Performance](https://books.ropensci.org/targets/performance.html) and
  [`crew`](https://books.ropensci.org/targets/crew.html): scale larger
  computations.
- [Literate programming](https://books.ropensci.org/targets/literate-programming.html):
  place Quarto reports under pipeline control.
- [R Targetopia](https://wlandau.github.io/targetopia/): find domain-specific
  extension packages.

## Rendering

Render the presentation through the repository wrapper:

```r
source("R/render.R")
```

Render the exercise guide with:

```r
source("R/Exercises/render_excercises.R")
```

## Licence and attribution

See [`LICENSE`](LICENSE). The Palmer Penguins data and artwork are by Allison
Horst, Alison Hill, and Kristen Gorman and are distributed under CC0. The
`targets` logo is from the official `targets` project documentation. The
workflow illustration was created by Scriberia for The Turing Way and is reused
under CC BY 4.0. Its Zenodo record is linked on the slide.
