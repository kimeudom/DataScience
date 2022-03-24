## TB and HIV monthly
## Countires,  


Malaria <- read.table(file = "/home/dom/Data_Science/t\ question\ formulation/new_csv/KHIS\ Malaria\ Data.csv",
                      sep = "," ,header = TRUE, skipNul = FALSE, fill = TRUE)
Mal_conf <- Malaria[Malaria$Data.ID == "OoakJhWiyZp",]
Mal_rows <- Mal_conf[, seq(from = 5, to = 16, by = 1)]
Mal_output <- cbind(County_code = Mal_conf$Orgunit.ID,
                    County = Mal_conf$Orgunit.name,
                    Prevalence = Mal_rows)
a <- c("County", "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")
names(Mal_output) <- a

## Output
write.table(Mal_output,
            file = "/home/dom/Data_Science/t\ question\ formulation/Outputs/Malaria_Montly.csv",
            sep = ",", quote = FALSE, append = FALSE, na = "NA", row.names = FALSE)
