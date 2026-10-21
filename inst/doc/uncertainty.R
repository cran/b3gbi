## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width = 8,
  fig.height = 6,
  out.width = "95%"
)

## ----install-dubicube, eval = FALSE-------------------------------------------
# install.packages("dubicube",
#                  repos = c("https://b-cubed-eu.r-universe.dev",
#                            "https://cloud.r-project.org"))

## ----example, eval = FALSE----------------------------------------------------
# library(b3gbi)
# 
# # 1. Process the cube
# denmark_cube <- process_cube(system.file("extdata",
#                                          "denmark_mammals_cube_eqdgc.csv",
#                                          package = "b3gbi"))
# 
# # 2. Calculate a time series of total occurrences
# # By default, CIs are NOT calculated during this step
# occ_ts <- total_occ_ts(denmark_cube)
# 
# # 3. Add confidence intervals using add_ci()
# # With dubicube installed, this uses cube-level bootstrapping by default
# occ_ts_with_ci <- add_ci(occ_ts, num_bootstrap = 100) # Using 100 for speed in this example
# 
# # 4. Plot the result
# plot(occ_ts_with_ci, title = "Total Occurrences with 95% CI")

## ----advanced, eval = FALSE---------------------------------------------------
# occ_ts_custom <- add_ci(occ_ts,
#                         num_bootstrap = 500,
#                         seed = 42,
#                         ci_type = "perc",
#                         confidence_level = 0.9,
#                         boot_args = list(progress = TRUE))

## ----override, eval = FALSE---------------------------------------------------
# # Example: Calculate CIs for evenness on raw scale (no logit transformation)
# evenness_raw <- add_ci(my_evenness_indicator,
#                        num_bootstrap = 1000,
#                        ci_args = list(h = identity,
#                                       hinv = identity))
# 
# # Example: Force bias correction for total_occ
# occ_with_bias <- add_ci(my_occ_indicator,
#                         num_bootstrap = 1000,
#                         ci_args = list(no_bias = FALSE))

