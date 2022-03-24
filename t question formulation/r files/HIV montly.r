# The HIV data set
HIV <- read.table(file = "/home/dom/Data_Science/t\ question\ formulation/new_csv/KHIS\ HIV\ 2021.csv",
                  sep = "," ,header = TRUE, skipNul = FALSE, fill = TRUE)

HIV_conf <- HIV[HIV$Data.ID == "NYkr7LlxmUg",]
HIV_rows <- HIV_conf[, seq(from = 5, to = 16, by = 1)]
HIV_output <- cbind(County = HIV_conf$Orgunit.name,
                    Prevalence =HIV_rows)
a <- c("County", "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")
names(HIV_output) <- a
write.table(HIV_output,
            file = "/home/dom/Data_Science/t\ question\ formulation/Outputs/HIV_monthly.csv",
            sep = ",", quote = FALSE, append = FALSE, na = "NA", row.names = FALSE)
