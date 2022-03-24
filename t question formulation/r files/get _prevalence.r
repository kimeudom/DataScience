## Reading the data sets

# The TB data set
TB <- read.table(file = "/home/dom/Data_Science/t\ question\ formulation/new_csv/KHIS\ TB\ 2021.csv",
                 sep = "," ,header = TRUE, skipNul = FALSE, fill = TRUE)
# The Contraceptives data set
Contra<- read.table(file = "/home/dom/Data_Science/t\ question\ formulation/new_csv/KHIS\ Contraceptives\ 2021.csv",
                 sep = "," ,header = TRUE, skipNul = FALSE, fill = TRUE)
# The HIV data set
HIV <- read.table(file = "/home/dom/Data_Science/t\ question\ formulation/new_csv/KHIS\ HIV\ 2021.csv",
                 sep = "," ,header = TRUE, skipNul = FALSE, fill = TRUE)
# The Health Facility data set
Health_Fac <- read.table(file = "/home/dom/Data_Science/t\ question\ formulation/new_csv/County\ Health\ Facilities.csv",
                 sep = "," ,header = TRUE, skipNul = FALSE, fill = TRUE)
# The Malaria data set
Malaria <- read.table(file = "/home/dom/Data_Science/t\ question\ formulation/new_csv/KHIS\ Malaria\ Data.csv",
                 sep = "," ,header = TRUE, skipNul = FALSE, fill = TRUE)


## Creating the county data
County_and_code <- as.matrix(cbind(unique(Contra[, 1]),unique(Contra[ , 3])))
colnames(County_and_code)<- c("County_code","County")
write.table(County_and_code,
            file = "/home/dom/Data_Science/t\ question\ formulation/Outputs/Counties.csv",
            sep = ",", quote = FALSE, append = FALSE, na = "NA", row.names = FALSE)

## Setting up the data

## The data frame
ALl_data <-  list(HIV = HIV,
                  Contraceptives = Contra,
                  TB = TB,
                  Malr = Malaria,
                  Health_Fac = Health_Fac)


## Data deductions Begin here
##
##
## Disease prevalence per county in 2021


## TB per county
# Getting the positive smears VihTrdMMli8
# Getting the defaulters KmLPBDUi48L
TB_conf <- TB[TB$Data.ID == "KmLPBDUi48L" | TB$Data.ID == "VihTrdMMli8",]
TB_rows <- TB_conf[, seq(from = 5, to = 16, by = 1)]
TB_rows <- colSums(TB_rows, na.rm = TRUE)
TB_output <- cbind(County_code = TB_conf$Orgunit.ID,
                   County = TB_conf$Orgunit.name,
                   Prevalence =TB_rows)

## Output
write.table(TB_output,
            file = "/home/dom/Data_Science/t\ question\ formulation/Outputs/prevalence/TB_County_Total_Cases.csv",
            sep = ",", quote = FALSE, append = FALSE, na = "NA", row.names = FALSE)


## HIV Per county
HIV_conf <- HIV[HIV$Data.ID == "NYkr7LlxmUg",]
HIV_rows <- HIV_conf[, seq(from = 5, to = 16, by = 1)]
HIV_rows <- colSums(HIV_rows, na.rm = TRUE)
HIV_output <- cbind(County_code = HIV_conf$Orgunit.ID,
                   County = HIV_conf$Orgunit.name,
                   Prevalence =HIV_rows)
write.table(HIV_output,
            file = "/home/dom/Data_Science/t\ question\ formulation/Outputs/prevalence/HIV_County_Total_Cases.csv",
            sep = ",", quote = FALSE, append = FALSE, na = "NA", row.names = FALSE)

## Malaria
Mal_conf <- Malaria[Malaria$Data.ID == "OoakJhWiyZp",]
Mal_rows <- Mal_conf[, seq(from = 5, to = 16, by = 1)]
Mal_rows <- colSums(Mal_rows, na.rm = TRUE)
Mal_output <- cbind(County_code = Mal_conf$Orgunit.ID,
                    County = Mal_conf$Orgunit.name,
                    Prevalence = Mal_rows)
write.table(Mal_output,
            file = "/home/dom/Data_Science/t\ question\ formulation/Outputs/prevalence/Mal_County_Total_Cases.csv",
            sep = ",", quote = FALSE, append = FALSE, na = "NA", row.names = FALSE)

