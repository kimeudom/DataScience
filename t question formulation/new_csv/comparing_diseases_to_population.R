## Comparing cases to population


Counties <- read.table(file = "/home/dom/Data_Science/t\ question\ formulation/new_csv/Counties.csv",
                 sep = "," ,header = TRUE, skipNul = FALSE, fill = TRUE)
## HIV
HIV <- read.table(file = "/home/dom/Data_Science/t\ question\ formulation/Outputs/prevalence/HIV_County_Total_Cases.csv",
                       sep = "," ,header = TRUE, skipNul = FALSE, fill = TRUE)

##TB
TB <- read.table(file = "/home/dom/Data_Science/t\ question\ formulation/Outputs/prevalence/TB_County_Total_Cases.csv",
                  sep = "," ,header = TRUE, skipNul = FALSE, fill = TRUE)

## Mal
Mal <- read.table(file = "/home/dom/Data_Science/t\ question\ formulation/Outputs/prevalence/Mal_County_Total_Cases.csv",
                  sep = "," ,header = TRUE, skipNul = FALSE, fill = TRUE)

## Comparison to population

final <- cbind(
  Code = Counties$V1,
  County = Counties$V2
  )
