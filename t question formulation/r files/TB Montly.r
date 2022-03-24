## TB and HIV monthly
## Countires,  


TB <- read.table(file = "/home/dom/Data_Science/t\ question\ formulation/new_csv/KHIS\ TB\ 2021.csv",
                 sep = "," ,header = TRUE, skipNul = FALSE, fill = TRUE)
TB_conf <- TB[TB$Data.ID == "KmLPBDUi48L" | TB$Data.ID == "VihTrdMMli8",]
TB_rows <- TB_conf[, seq(from = 5, to = 16, by = 1)]
TB_output <- cbind(County = TB_conf$Orgunit.name,
                   Prevalence =TB_rows)
a <- c("County", "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")
names(TB_output) <- a

## Output
write.table(TB_output,
            file = "/home/dom/Data_Science/t\ question\ formulation/Outputs/TB_monthly.csv",
            sep = ",", quote = FALSE, append = FALSE, na = "NA", row.names = FALSE)
