# plotting
## Importing the prevalence data
## Import Counties
Counties <- read.table("/home/dom/Data_Science/t\ question\ formulation/new_csv/Counties.csv",
                       sep = ",", header = TRUE, skipNul = FALSE, fill = TRUE)
## Import Prevalence
HIV_Preval <- read.table("/home/dom/Data_Science/t\ question\ formulation/Outputs/prevalence/HIV_County_Total_Cases.csv",
                         sep = ",", header = TRUE, skipNul = FALSE, fill = TRUE)
TB_Preval <- read.table("/home/dom/Data_Science/t\ question\ formulation/Outputs/prevalence/TB_County_Total_Cases.csv",
                        sep = ",", header = TRUE, skipNul = FALSE, fill = TRUE)
Mal_Preval<- read.table("/home/dom/Data_Science/t\ question\ formulation/Outputs/prevalence/Mal_County_Total_Cases.csv",
                        sep = ",", header = TRUE, skipNul = FALSE, fill = TRUE)


## Plotting TB distribution

TB_totals <- TB_Preval$Prevalence
names(TB_totals) <- TB_Preval$Counties
#pie(TB_totals, col = rainbow(12), clockwise = TRUE,
#    main = "Prevalence of TB in Kenya")
barplot(TB_totals, main = "Distribution of TB in Kenya")

## Plotting HIV prevalence
HIV_totals <- HIV_Preval$Prevalence
names(HIV_totals) <- HIV_Preval$Counties
barplot(HIV_totals, main = "Distribution of HIV in Kenya",
        xlab = "Counties",
        ylab = "Number of cases",
        names.arg = HIV_Preval$County,
        )

