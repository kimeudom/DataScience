# Get the malaria data
# In which months is the rate of infection greater

# Plot the graphs in order of prevalence
#The Malaria data set
Malaria <- read.table(file = "/home/dom/Data_Science/t\ question\ formulation/new_csv/KHIS\ Malaria\ Data.csv",
                     sep = "," ,header = TRUE, skipNul = FALSE, fill = TRUE)

a <- order(colSums(Malaria[,5:17]))

