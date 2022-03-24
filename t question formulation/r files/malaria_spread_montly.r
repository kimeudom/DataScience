# Get the malaria data
# In which months is the rate of infection greater

# Plot the graphs in order of prevalence
#The Malaria data set
Malaria <- read.table(file = "/home/dom/Data_Science/t\ question\ formulation/new_csv/KHIS\ Malaria\ Data.csv",
                     sep = "," ,header = TRUE, skipNul = FALSE, fill = TRUE)
## Truncate Malaria for confirmed cases only
Malaria_conf <- Malaria[Malaria$Data.ID == "OoakJhWiyZp",]
val <- Malaria_conf[,c(-1 ,-2 ,-17, -18, -19, -20, -21)]

## Make output
write.table(val,
            file = "/home/dom/Data_Science/t\ question\ formulation/Outputs/Mal_Spread_monthly.csv",
            sep = ",", quote = FALSE, append = FALSE, na = "NA", row.names = FALSE)

