import csv
import re
import pandas as pd
from datetime import timedelta

# Function to convert hexadecimal to decimal
def hex_to_decimal(hex_str):
    is_negative = False
    if hex_str.startswith('-'):
        is_negative = True
        hex_str = hex_str[1:]  # Remove the negative sign
    
    if '.' in hex_str:
        integer_part, fractional_part = hex_str.split('.')
    else:
        integer_part, fractional_part = hex_str, ''
    
    decimal_int = int(integer_part, 16) if integer_part else 0
    decimal_fraction = sum(int(digit, 16) / (16 ** (i + 1)) for i, digit in enumerate(fractional_part))
    decimal_value = decimal_int + decimal_fraction
    return -decimal_value if is_negative else decimal_value

# Input and output file paths
input_file_path = r"C:\Users\Gowth\Desktop\Capstone Project Torpedo\Hex Files\MCC_Data.hex"
output_file_path = r"C:\Users\Gowth\Downloads\MCC_output_float_with_timestamps.csv"

# Read the hex file and convert to decimal, storing in a list of lists
data = []
with open(input_file_path, 'r') as hex_file:
    for line in hex_file:
        hex_values = re.findall(r'[0-9A-Fa-f.-]+', line.strip())
        decimal_values = [hex_to_decimal(hv) for hv in hex_values]
        data.append(decimal_values)

# Convert to DataFrame
df = pd.DataFrame(data)

# Calculate dynamic timestamp intervals based on row count
num_rows = len(df)
end_time_minutes = 9  # Total duration of 9 minutes
total_time_delta = timedelta(minutes=end_time_minutes)
time_interval = total_time_delta / num_rows

# Generate timestamps
timestamps = pd.to_timedelta(range(num_rows), unit='s') * time_interval.total_seconds()
timestamps = (pd.Timestamp('00:00:00') + timestamps).time
df['Timestamp'] = timestamps

# Save the updated DataFrame to CSV
df.to_csv(output_file_path, index=False)

print(f"Conversion complete. Output saved to {output_file_path}")
