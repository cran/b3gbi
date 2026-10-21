## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width = 8,
  fig.height = 6,
  out.width = "95%"
)

## ----install, eval = FALSE----------------------------------------------------
# # Install the package from the dedicated R-universe
# install.packages("b3gbi", repos = "https://b-cubed-eu.r-universe.dev")
# 
# # Load the package
# library(b3gbi)

## ----load, echo = FALSE-------------------------------------------------------
library(b3gbi)

## ----process-cube-------------------------------------------------------------
# Function 1: process_cube()
denmark_cube <- process_cube(
  system.file("extdata",
    "denmark_mammals_cube_eqdgc.csv",
    package = "b3gbi"
  ),
  first_year = 1980
) # Filter the cube to start at 1980

# Printing the object shows key metadata
denmark_cube

## ----structure----------------------------------------------------------------
str(denmark_cube)

## ----available-indicators-----------------------------------------------------
available_indicators

## ----richness-map-------------------------------------------------------------
# Calculate a gridded map of observed species richness for Denmark
# Note that confidence intervals are not calculated for map indicators
Denmark_observed_richness_map <- obs_richness_map(denmark_cube, 
                                                   level = "country", 
                                                   region = "Denmark") 

## ----map-class----------------------------------------------------------------
class(Denmark_observed_richness_map)
class(Denmark_observed_richness_map$data)

## ----total-occ-ts-------------------------------------------------------------
# Calculate a time series of total occurrences for Denmark
# By default, confidence intervals are NOT calculated during this step
Denmark_total_occ_ts <- total_occ_ts(denmark_cube, 
                                     level = "country", 
                                     region = "Denmark")

## ----ts-class-----------------------------------------------------------------
class(Denmark_total_occ_ts)

## ----add-ci-------------------------------------------------------------------
# Add confidence intervals to the time series
Denmark_total_occ_ts_with_ci <- add_ci(Denmark_total_occ_ts, 
                                       num_bootstrap = 100)

## ----plot-map-----------------------------------------------------------------
# Plotting the map object
plot(Denmark_observed_richness_map,
  legend_title = "Mammal Species Count",
  title = "Observed Mammal Richness (1980-Present)"
)

## ----plot-ts------------------------------------------------------------------
# Plotting the time series object (with confidence intervals)
plot(Denmark_total_occ_ts_with_ci,
  title = "Temporal Trend of Total Mammal Occurrences in Denmark",
  linecolour = "blue",
  ribboncolour = "skyblue",
  trendlinecolour = "darkorange",
  envelopecolour = "orange",
  smoothed_trend = TRUE
)

