# Declare global variables to avoid R CMD check NOTEs
# These variables are used in ggplot2 aes() calls
utils::globalVariables(c(
  "x",
  "y",
  "id",
  "group_color",
  "group_primary",
  "group_fill",
  "group_shape",
  "class",
  "labels"
))