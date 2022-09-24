
# Find all .csv files in Data
csv_files <- list.files(pattern = ".csv",
                        recursive = TRUE,
                        path = "Data",
                        full.names = TRUE)
# How many are there?
length(csv_files)

# Find just the wingspan data set
wing <- list.files(path = "Data",
           recursive = TRUE,
           full.names = TRUE,
           pattern = "wingspan_vs_mass.csv")

# Load the wingspan data set
df <- read.csv(file = wing)

# Find the first 5 lines
head(df,n=5)

# ^ = 'starts with'
# $ = 'ends with'
# * = 0-Inf of anything
# . = "any single character

# Dumb way of reading in all three files' first lines
list.files(path = "Data",
           full.names = TRUE,
           recursive = TRUE,
           pattern = "^b")
readLines("Data/data-shell/creatures/basilisk.dat",n=1)
readLines("Data/data-shell/data/pdb/benzaldehyde.pdb",n=1)
readLines("Data/Messy_Take2/b_df.csv",n=1)

# Better way (no copying required)- chimp
x <- list.files(path = "Data",
           full.names = TRUE,
           recursive = TRUE,
           pattern = "^b")#save results as x
readLines(x[1],n=1)# use [] notation to access those results
readLines(x[2],n=1)
readLines(x[3],n=1)

# for-loop for forst line of 'b' files ('eachfile' is a replaceable phrase)
for(eachfile in x){
  print(readLines(eachfile,n=1))
}

#do for-loop for all .csv files
for(eachfile in csv_files){
  print(readLines(eachfile,n=1))
}
