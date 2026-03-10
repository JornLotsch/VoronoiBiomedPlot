# VoronoiBiomedPlot

VoronoiBiomedPlot is an R package for visualizing multivariate biomedical data using Voronoi tessellation as a complement or replacement for confidence ellipses in 2D raw data or projections (e.g. PCA, PLS-DA, UMAP). It provides functions to display class separation, decision boundaries, and classification inconsistencies directly in the raw or projected data space.

## Installation

The package is available on CRAN
```r
install.packages("VoronoiBiomedPlot")
```

or from this repository 
```r
# install.packages("remotes")
remotes::install_github("JornLotsch/VoronoiBiomedPlot")
```

## Main functions

VoronoiBiomedPlot currently exposes two main user-facing functions for tessellation-based visualizations of 2D data.

### `create_tesselation_plots()`

Generates standard 2D plots with optional confidence ellipses and Voronoi tessellation overlays.

- Input: 2D coordinates or a data frame with at least two numeric columns and class labels.
- Output: A list of `ggplot` objects:
  - `result$scatter_plot` – scatter plot of the projected data.
  - `result$voronoi_plot` – Voronoi tessellation plot with data points.
  - `result$combined_plot` – combined visualization with additional features.

### `create_voronoi_plot()`

Generates a standalone Voronoi tessellation plot, optionally with a second set of class labels.

- Input: 2D coordinates or a data frame with at least two numeric columns and class labels.
- Output: A single `ggplot` object with the tessellation and optional overlays.

## Shared arguments

Both main functions share most arguments for data input and plot styling:

- `data` – `data.frame` with ≥ 2 numeric columns for coordinates.
- `class_column` – column name or vector of primary class labels.
- `alternative_class_column` – column name or vector of alternative class labels.
- `coordinate_columns` – character vector with names of the coordinate columns (if `NULL`, uses the first two numeric columns).
- `case_labels` – optional character vector of case labels (row numbers are used if `NULL`).
- `coord_names` – axis labels (default `c("Dim1", "Dim2")`).
- `title` – optional plot title.
- `show_labels` – logical, whether to show case labels.
- `voronoi_alpha` – transparency of Voronoi regions (0–1, default `0.3`).
- `point_size` – size of data points.
- `legend_position` – legend position (e.g. `"bottom"`).
- `color_palette` – custom color palette (function or character vector).
- `add_grid_lines` – logical, add origin grid lines.
- `color_points` – which classification to use for point colors (`"primary"` or `"alternative"`).
- `fill_voronoi` – which classification to use for Voronoi cell fills (`"primary"` or `"alternative"`).
- `point_shape` – `"primary"`, `"alternative"`, or `"none"`.
- `label_fontface` – label font face (`"plain"`, `"bold"`, `"italic"`, `"bold.italic"`).
- `label_size` – size of case labels.
- `show_island_count` – logical, show Voronoi island count as subtitle on Voronoi-based plots.
- `label_islands_only` – logical, label only Voronoi islands (requires `show_island_count = TRUE`).

A Voronoi island is a data point whose Voronoi cell is completely surrounded by cells of a different class; it provides a quantitative metric of local class discordance visible in the tessellation.

## Examples

Below are examples that match the package’s `@examples` for the public API. You can adapt or extend them later as you add vignettes or more elaborate workflows.

```r
# Basic usage with iris dataset
data <- iris[, c("Sepal.Length", "Petal.Length", "Species")]
plots <- create_tesselation_plots(
  data = data,
  class_column = "Species",
  legend_position = "bottom",
  add_grid_lines = FALSE
)

# With Voronoi island count displayed as subtitle on Voronoi-based plots
plots <- create_tesselation_plots(
  data = data,
  class_column = "Species",
  legend_position = "bottom",
  add_grid_lines = FALSE,
  show_island_count = TRUE
)

# With Voronoi island count displayed as subtitle on Voronoi-based plots
# Label only islands
plots <- create_tesselation_plots(
  data = data,
  class_column = "Species",
  legend_position = "bottom",
  add_grid_lines = FALSE,
  show_island_count = TRUE,
  label_islands_only = FALSE
)
```

## Dependencies

The package depends on:

- `ggplot2` – plotting.
- `deldir` – Voronoi tessellation computation.
- `ggrepel` – smart label positioning.
- `MASS` – ellipse computation.


## Citation

If you use VoronoiBiomedPlot in scientific work, please cite:

- Lötsch J, Kringel D (2026). *Voronoi tessellation as a complement or replacement for confidence ellipses in the visualization of data projection and clustering results*. PLoS One (in revision).

For related methodology, you may also cite:

- Lötsch J, Ultsch A (2024). *Comparative assessment of projection and clustering method combinations in the analysis of biomedical data*. Informatics in Medicine Unlocked 50: 101573. doi: 10.1016/j.imu.2024.101573.

A BibTeX entry can be obtained from:

```r
citation("VoronoiBiomedPlot")
```

once the package is installed.

## License

This package is released under the CC-BY 4.0 license.
```