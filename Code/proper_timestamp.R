# Load necessary libraries
library(readr)
library(dplyr)

# Read the CSV data
df <- read_csv("C:\\Users\\Gowth\\Downloads\\Contro_output_float_with_timestamps.csv", col_names = FALSE)

# Rename the first column to 'Seconds'
colnames(df)[1] <- "Seconds"

# Generate timestamps by adding 'Seconds' to a reference time
df <- df %>%
  mutate(
    Timestamp = as.POSIXct("00:00:00", format = "%H:%M:%S") + Seconds
  )

# View the updated dataframe with proper timestamps
head(df)

# Write the updated data back to a CSV file
write_csv(df, "C:\\Users\\Gowth\\Downloads\\Contro_output_float_with_proper_timestamps.csv")
