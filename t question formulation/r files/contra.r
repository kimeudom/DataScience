Contra <- read.table(file = "/home/dom/Data_Science/ebu cheki/Contraceptives per month.csv",
                      sep = "," ,header = TRUE, skipNul = FALSE, fill = TRUE)
Contra_Transposed = t(Contra)

write.table(Contra_Transposed,
            file = "/home/dom/Data_Science/ebu cheki/Contraceptives per month transposed.csv",
            sep = ",", quote = FALSE, append = FALSE, na = "NA", row.names = FALSE)
