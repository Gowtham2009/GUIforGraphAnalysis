# Load necessary libraries
library(readr)
library(ggplot2)

# Read the CSV data (adjust the file path accordingly)
df <- read_csv("C:\\Users\\Gowth\\Downloads\\Contro_output_float_with_timestamps.csv")

# Convert 'Timestamp' into a proper time format
df$Timestamp <- as.POSIXct(df$Timestamp, format="%H:%M:%S")

# Determine the min and max values for scaling
y_min <- min(c(df$a, df$b, df$c, df$d))
y_max <- max(c(df$a, df$b, df$c, df$d))

# Create the plot with custom Y-axis adjustments and annotations for min and max
ggplot(data = df, aes(x = Timestamp)) +
  geom_line(aes(y = a, color = "a")) +
  geom_line(aes(y = b, color = "b")) +
  geom_line(aes(y = c, color = "c")) +
  labs(title = "Time Series for a, b, c",
       x = "Time",
       y = "Values") +
  scale_x_datetime(date_labels = "%H:%M:%S", date_breaks = "30 sec", date_minor_breaks = "5 sec") +
  scale_y_continuous(limits = c(y_min, y_max), breaks = seq(y_min, y_max, by = (y_max - y_min) / 10)) + # Adjust Y-axis scale
  scale_color_manual(values = c("a" = "blue", "b" = "green", "c" = "red", "d" = "purple")) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  # Annotate minimum and maximum values
  annotate("text", x = df$Timestamp[1], y = y_max, label = paste("Max:", round(y_max, 2)), hjust = 0, color = "black", size = 3) +
  annotate("text", x = df$Timestamp[1], y = y_min, label = paste("Min:", round(y_min, 2)), hjust = 0, color = "black", size = 3)


###########################################################################################

#with dynamic timeline


