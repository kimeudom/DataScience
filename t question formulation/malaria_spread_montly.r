# Get the malaria data
# In which months is the rate of infection greater

# Plot the graphs in order of prevalence
#The Malaria data set
Malaria <- read.table(file = "/home/dom/Data_Science/t\ question\ formulation/new_csv/KHIS\ Malaria\ Data.csv",
                     sep = "," ,header = TRUE, skipNul = FALSE, fill = TRUE)
## Truncate Malaria for confirmed cases only
Malaria_conf <- Malaria[Malaria$Data.ID == "OoakJhWiyZp",]
Mal_output <- cbind(
  County = Malaria$Orgunit.name,
  Jan = Malaria$X21.Jan,
  Feb = Malaria$X21.Feb,
  Mar = Malaria$X21.Mar,
  Apr = Malaria$X21.Apr,
  May = Malaria$X21.May,
  June = Malaria$X21.Jun,
  July = Malaria$X21.Jul,
  Aug = Malaria$X21.Aug,
  Sep = Malaria$X21.Sep,
  Oct = Malaria$X21.Oct,
  Nov = Malaria$X21.Nov,
  Dec = Malaria$X21.Dec
  
)
## Make output
write.table(Mal_output,
            file = "/home/dom/Data_Science/t\ question\ formulation/Outputs/Mal_Spread_monthly.csv",
            sep = ",", quote = FALSE, append = FALSE, na = "NA", row.names = FALSE)

