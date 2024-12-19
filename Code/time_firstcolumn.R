# Load necessary libraries
library(readr)
library(ggplot2)
library(dplyr)

# Read the CSV data (correct file path)
df <- read_csv("C:/Users/Gowth/Desktop/Capstone Project Torpedo/Hex_Files_Converted_decimal/Control_output_float_with_timestamps.csv")

# Inspect column names and data
colnames(df)
head(df)

# Replace 'time' with the actual name of the first column
df$time <- as.numeric(df[[1]])  # Accessing the first column

# Filter out negative values
df <- df %>% filter(time > 0)

# Add a grouping column for the whole number part
df <- df %>%
  mutate(group = floor(time))

# Print the first few rows to check transformations
head(df)


# Suppress scientific notation globally
options(scipen = 999)

# Ensure time is a proper integer value
df$time <- as.integer(df$time)

# Create the plot
ggplot(df, aes(x = time)) +
  geom_line(aes(y = `1`, color = "Column 1")) +
  geom_line(aes(y = `2`, color = "Column 2")) +
  labs(title = "Time Series Plot",
       x = "Time (seconds)",
       y = "Values",
       color = "Legend") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  scale_x_continuous(breaks = seq(min(df$time), max(df$time), by = 60)) +  # 60-second intervals
  scale_color_manual(values = c("Column 1" = "blue", "Column 2" = "red"))


# Ensure 'time' column is numeric first (if not already)
df$time <- as.numeric(df$time)

# Check if there are any missing or NA values in the 'time' column
sum(is.na(df$time))  # Count of NA values in 'time'

# Create the 'time_min' column by dividing 'time' by 60
df$time_min <- df$time / 60

# Now, check if 'time_min' has been created properly
head(df$time_min)

# Calculate the min and max values for the y-axis
min_y <- min(c(df$`1`, df$`2`), na.rm = TRUE)
max_y <- max(c(df$`1`, df$`2`), na.rm = TRUE)

# Plot the data with time on the x-axis in minutes
ggplot(df, aes(x = time_min)) +
  geom_line(aes(y = `1`, color = "Column 1")) +
  geom_line(aes(y = `3`, color = "Column 2")) +
  geom_line(aes(y = `4`, color = "Column 3")) +
  geom_line(aes(y = `5`, color = "Column 4")) +
  labs(title = "Time Series Plot",
       x = "Time (Minutes)",
       y = "Values",
       color = "Legend") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  scale_x_continuous(breaks = seq(0, max(df$time_min, na.rm = TRUE), by = 1)) +  # 1-minute intervals
  scale_y_continuous(limits = c(min_y, max_y)) +  # Set y-axis limits
  scale_color_manual(values = c("Column 1" = "blue", "Column 2" = "red", "Column 3" = "purple", "Column 4" = "yellow"))
