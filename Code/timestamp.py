import pandas as pd

# Load the CSV file
file_path = "C:\\Users\\Gowth\\Desktop\\Capstone Project Torpedo\\Hex_Files_Converted_decimal\\Homing_output_float_with_timestamps.csv"
data = pd.read_csv(file_path)

# Assuming the first column is the time column
time_column_name = data.columns[0]  # Automatically detect the first column name

# Convert time to cumulative sum for proportional timestamps
data['Cumulative_Time'] = data[time_column_name].cumsum()

# Base time for timestamps (e.g., starting at '00:00:00')
base_time = pd.Timestamp('00:00:00')

# Generate timestamps dynamically based on the cumulative time
data['Timestamp'] = data['Cumulative_Time'].apply(lambda x: base_time + pd.to_timedelta(x, unit='s'))

# Save the updated DataFrame to a new CSV file
output_file_path = r"C:\Users\Gowth\Desktop\Capstone Project Torpedo\Hex_Files_Converted_decimal\Homing_output_float_dynamic_timestamps.csv"
data.to_csv(output_file_path, index=False)

print("File updated successfully with dynamic timestamps and saved to:", output_file_path)
