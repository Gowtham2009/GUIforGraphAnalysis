import csv
import re
import pandas as pd
from datetime import timedelta, datetime

# Function to convert hexadecimal to decimal
def hex_to_decimal(hex_str):
    try:
        is_negative = hex_str.startswith('-')
        if is_negative:
            hex_str = hex_str[1:]  # Remove the negative sign
        
        if '.' in hex_str:
            integer_part, fractional_part = hex_str.split('.')
        else:
            integer_part, fractional_part = hex_str, ''
        
        decimal_int = int(integer_part, 16) if integer_part else 0
        decimal_fraction = sum(int(digit, 16) / (16 ** (i + 1)) for i, digit in enumerate(fractional_part))
        decimal_value = decimal_int + decimal_fraction
        return -decimal_value if is_negative else decimal_value
    except ValueError:
        return None  # Handle invalid hex values gracefully

# Input and output file paths
input_file_path = r"C:\Users\vaish\Downloads\TEST-DATA (4)\TEST-DATA\control.hex"
output_file_path = r"C:\Users\vaish\Downloads\NEWDATA\control_output_float_with_timestamps.csv"

# Read the hex file and convert to decimal, storing in a list
data = []
with open(input_file_path, 'r') as hex_file:
    for line in hex_file:
        hex_values = re.findall(r'[0-9A-Fa-f.-]+', line.strip())
        if not hex_values:
            continue  # Skip empty lines
        decimal_values = [hex_to_decimal(hv) for hv in hex_values if hex_to_decimal(hv) is not None]
        data.append(decimal_values)

# Convert to DataFrame
df = pd.DataFrame(data)

# Ensure at least one column exists
if df.empty:
    raise ValueError("No valid data extracted from the HEX file.")

# Calculate timestamps dynamically
num_rows = len(df)
end_time_minutes = 9  # Total duration of 9 minutes
total_time_delta = timedelta(minutes=end_time_minutes)
time_interval = total_time_delta / num_rows

# Generate timestamps
start_time = datetime.strptime("00:00:00", "%H:%M:%S")
timestamps = [start_time + i * time_interval for i in range(num_rows)]
df['Timestamp'] = [t.strftime("%H:%M:%S") for t in timestamps]

# Save to CSV
df.to_csv(output_file_path, index=False)

print(f"Conversion complete. Output saved to {output_file_path}")
