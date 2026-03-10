\name{VoronoiBiomedPlot-package}
\alias{VoronoiBiomedPlot-package}
\alias{VoronoiBiomedPlot}
\docType{package}
\title{
\packageTitle{VoronoiBiomedPlot}
}
\description{
\packageDescription{VoronoiBiomedPlot}
}
\details{
The VoronoiBiomedPlot package provides functions for creating visualization plots
of 2D data, particularly useful for biomedical data analysis and
dimensionality reduction results.
The package includes two main functions:
\itemize{
  \item \code{\link{create_tesselation_plots}}: Creates three types of plots (ellipse, Voronoi, and combined)
  \item \code{\link{create_voronoi_plot}}: Creates standalone Voronoi tessellation plots
}
These functions are designed to visualize class separation in two-dimensional raw or projected data, such as dimensionally reduced
data from techniques like PCA, PLS-DA, UMAP, or other projection methods, commonly
used in biomedical research.
Voronoi tessellation divides the plot space into regions based on proximity to data
points, providing an intuitive visualization of class boundaries and decision regions.
Confidence ellipses show the distribution spread and correlation structure within each class.
Both functions support an optional Voronoi island count, a visualization-intrinsic
metric that quantifies class structure disruption by identifying data points whose
Voronoi cells are entirely surrounded by cells of a different class. This metric
has no equivalent in confidence ellipse visualizations and can be displayed as a
plot subtitle via the \code{show_island_count} parameter.
}
\author{
Jorn Lotsch <j.lotsch@em.uni-frankfurt.de>
}
\references{
Lötsch, J. and A. Ultsch (2024). Comparative assessment of projection and clustering method combinations in the analysis of biomedical data.
Informatics in Medicine Unlocked 50: 101573.
https://www.sciencedirect.com/science/article/pii/S2352914824001291}
\keyword{package}
\keyword{visualization}
\keyword{multivariate}
\keyword{biomedical}
\seealso{
\itemize{
  \item \url{https://github.com/JornLotsch/voronoi_tesselation_plot}
  \item Report bugs at \url{https://github.com/JornLotsch/voronoi_tesselation_plot/issues}
}
}
\examples{
# Load the iris dataset
data <- iris[, c("Sepal.Length", "Petal.Length", "Species")]

# Create comprehensive tesselation plots
plots <- create_tesselation_plots(
  data = data,
  class_column = "Species",
  legend_position = "bottom",
  add_grid_lines = FALSE
)

# Access individual plots
# plots$ellipse_plot
# plots$voronoi_plot
# plots$voronoi_plot_plus_ellipse

# Create standalone Voronoi plot
voronoi_plot <- create_voronoi_plot(
  data = data,
  class_column = "Species",
  legend_position = "bottom",
  add_grid_lines = FALSE
)

# Create standalone Voronoi plot with island count displayed as subtitle
voronoi_plot_islands <- create_voronoi_plot(
  data = data,
  class_column = "Species",
  legend_position = "bottom",
  add_grid_lines = FALSE,
  show_island_count = TRUE
)
}
