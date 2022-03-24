#  The population densities
Population <- read.table(file = "/home/dom/Data_Science/t\ question\ formulation/new_csv/Population\ data.csv",
                      sep = "," ,header = TRUE, skipNul = FALSE, fill = TRUE)

names(Population) <- c("County_code", "County", "Population")

                      