'''import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
import mplcursors  # Import mplcursors for interactivity

# File path
file_path = "C:/Users/Gowth/Desktop/Capstone Project Torpedo/Hex_Files_Converted_decimal/Homing_output_float_with_timestamps.csv"
# Reading the CSV file
df = pd.read_csv(file_path)

# Rename the relevant columns for clarity
df = df.rename(columns={df.columns[0]: 'Time', df.columns[3]: 'Value1'})

# Ensure the 'Time' column is numeric
df['Time'] = pd.to_numeric(df['Time'], errors='coerce')

# Filter the data to start from the first positive value in the 'Time' column
df_filtered = df[df['Time'] >= 0].reset_index(drop=True)

# Plot the timeline graph with fine grid lines
plt.figure(figsize=(12, 6))

# Plotting Time vs Value1
plt.plot(df_filtered['Time'], df_filtered['Value1'], label='Value1 over Time', color='blue', marker='o', markersize=5)

# Add fine grid lines for detailed view
plt.grid(visible=True, which='both', linestyle='--', linewidth=0.5)

# Adjust x-axis ticks for a 20-second gap
time_min = df_filtered['Time'].min()
time_max = df_filtered['Time'].max()
ticks = np.arange(time_min, time_max + 20, 20)  # Generate ticks with a 20-second interval
plt.xticks(ticks, rotation=45)

# Set labels and title
plt.xlabel("Time (seconds)", fontsize=12)
plt.ylabel("Value1", fontsize=12)
plt.title("Interactive Timeline Graph of Time vs Value1", fontsize=14)
plt.legend()
plt.tight_layout()

# Add an interactive cursor
cursor = mplcursors.cursor(hover=True)

# Customize the cursor annotation
@cursor.connect("add")
def on_add(sel):
    sel.annotation.set_text(f"Time: {sel.target[0]:.2f}\nValue1: {sel.target[1]:.2f}")

# Show the graph
plt.show()


#Seaborn
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
import mplcursors  # For interactive cursors

# File path
file_path = "C:/Users/Gowth/Desktop/Capstone Project Torpedo/Hex_Files_Converted_decimal/Control_output_float_with_timestamps.csv"

# Reading the CSV file
df = pd.read_csv(file_path)

# Rename the relevant columns for clarity
df = df.rename(columns={df.columns[0]: 'Time', df.columns[3]: 'Value1'})

# Ensure the 'Time' column is numeric
df['Time'] = pd.to_numeric(df['Time'], errors='coerce')

# Filter the data to start from the first positive value in the 'Time' column
df_filtered = df[df['Time'] >= 0].reset_index(drop=True)

# Set up the Seaborn style
sns.set_theme(style="whitegrid")

# Plot the timeline graph using Seaborn
plt.figure(figsize=(12, 6))
sns.lineplot(data=df_filtered, x='Time', y='Value1', marker='o', label='Value1 over Time', color='blue')

# Adjust x-axis ticks for a 20-second gap
time_min = df_filtered['Time'].min()
time_max = df_filtered['Time'].max()
plt.xticks(ticks=range(int(time_min), int(time_max) + 20, 20), rotation=45)

# Set labels and title
plt.xlabel("Time (seconds)", fontsize=12)
plt.ylabel("Value1", fontsize=12)
plt.title("Interactive Timeline Graph of Time vs Value1", fontsize=14)
plt.legend()
plt.tight_layout()

# Add an interactive cursor
cursor = mplcursors.cursor(hover=True)

# Customize the cursor annotation
@cursor.connect("add")
def on_add(sel):
    sel.annotation.set_text(f"Time: {sel.target[0]:.2f}\nValue1: {sel.target[1]:.2f}")

# Show the graph
plt.show()
'''
'''
#3D
import pandas as pd
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D  # For 3D plotting
import mplcursors  # For interactivity

# File path
file_path = "C:/Users/Gowth/Desktop/Capstone Project Torpedo/Hex_Files_Converted_decimal/Control_output_float_with_timestamps.csv"

# Reading the CSV file
df = pd.read_csv(file_path)

# Rename the relevant columns for clarity
df = df.rename(columns={df.columns[0]: 'Time', df.columns[3]: 'Value1', df.columns[4]: 'Value2'})

# Ensure numeric data
df['Time'] = pd.to_numeric(df['Time'], errors='coerce')
df['Value1'] = pd.to_numeric(df['Value1'], errors='coerce')
df['Value2'] = pd.to_numeric(df['Value2'], errors='coerce')

# Filter the data to start from the first positive value in the 'Time' column
df_filtered = df[df['Time'] >= 0].reset_index(drop=True)

# Set up the 3D plot
fig = plt.figure(figsize=(12, 8))
ax = fig.add_subplot(111, projection='3d')

# Plot the data
scatter = ax.scatter(
    df_filtered['Time'], 
    df_filtered['Value1'], 
    df_filtered['Value2'], 
    c=df_filtered['Value1'],  # Color based on Value1
    cmap='viridis',  # Colormap
    marker='o'
)

# Set labels
ax.set_xlabel("Time (seconds)")
ax.set_ylabel("Value1")
ax.set_zlabel("Value2")
ax.set_title("Interactive 3D Graph: Time vs Value1 vs Value2")

# Add an interactive cursor
cursor = mplcursors.cursor(scatter, hover=True)

# Customize the cursor annotation
@cursor.connect("add")
def on_add(sel):
    x, y, z = sel.target
    sel.annotation.set_text(f"Time: {x:.2f}\nValue1: {y:.2f}\nValue2: {z:.2f}")

# Show the plot
plt.show()
'''
'''
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
import mplcursors  # For interactive cursors

# File path
file_path = "C:/Users/Gowth/Desktop/Capstone Project Torpedo/Hex_Files_Converted_decimal/Control_output_float_with_timestamps.csv"

# Reading the CSV file
df = pd.read_csv(file_path)

# Rename the relevant columns for clarity
df = df.rename(columns={df.columns[0]: 'Time', df.columns[4]: 'Value1'})

# Ensure the 'Time' column is numeric
df['Time'] = pd.to_numeric(df['Time'], errors='coerce')

# Filter the data to start from the first positive value in the 'Time' column
df_filtered = df[df['Time'] >= 0].reset_index(drop=True)

# Set up the Seaborn style
sns.set_theme(style="whitegrid")

# Plot the timeline graph using Seaborn
plt.figure(figsize=(12, 6))
sns.lineplot(data=df_filtered, x='Time', y='Value1', marker='+', label='Value1 over Time', color='blue')

# Adjust x-axis ticks for a 20-second gap
time_min = df_filtered['Time'].min()
time_max = df_filtered['Time'].max()
plt.xticks(ticks=range(int(time_min), int(time_max) + 20, 20), rotation=45)

# Set labels and title
plt.xlabel("Time (seconds)", fontsize=12)
plt.ylabel("Value1", fontsize=12)
plt.title("Interactive Timeline Graph of Time vs Value1", fontsize=14)
plt.legend()
plt.tight_layout()

# Add an interactive cursor
cursor = mplcursors.cursor(hover=True)

# Customize the cursor annotation
@cursor.connect("add")
def on_add(sel):
    sel.annotation.set_text(f"Time: {sel.target[0]:.2f}\nValue1: {sel.target[1]:.2f}")

# Show the graph
plt.show()
'''
'''
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
import mplcursors  # Import mplcursors for interactivity
import warnings

# Suppress mplcursors warnings
warnings.filterwarnings("ignore", category=UserWarning, module="mplcursors")

# File path
file_path = "C:/Users/Gowth/Desktop/Capstone Project Torpedo/Hex_Files_Converted_decimal/Control_output_float_with_timestamps.csv"

# Reading the CSV file
df = pd.read_csv(file_path)

# Rename the relevant columns for clarity
df = df.rename(columns={df.columns[0]: 'Time', df.columns[3]: 'Value1'})

# Ensure numeric data
df['Time'] = pd.to_numeric(df['Time'], errors='coerce')
df['Value1'] = pd.to_numeric(df['Value1'], errors='coerce')

# Filter the data to start from the first positive value in the 'Time' column
df_filtered = df[df['Time'] >= 0].reset_index(drop=True)

# Set Seaborn style
sns.set(style="whitegrid")

# Create the scatter plot
plt.figure(figsize=(12, 6))
scatter_plot = sns.scatterplot(
    data=df_filtered,
    x='Time',
    y='Value1',
    marker='+',
    color='blue'
)

# Add labels and title
plt.xlabel("Time (seconds)", fontsize=12)
plt.ylabel("Value1", fontsize=12)
plt.title("Interactive Scatter Plot of Time vs Value1", fontsize=14)
plt.tight_layout()

# Add interactive cursor
cursor = mplcursors.cursor(hover=True)

# Customize the cursor annotation
@cursor.connect("add")
def on_add(sel):
    sel.annotation.set_text(f"Time: {sel.target[0]:.2f}\nValue1: {sel.target[1]:.2f}")

# Show the plot
plt.show()
'''
'''
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
import mplcursors  # Import mplcursors for interactivity
import warnings
import numpy as np

# Suppress mplcursors warnings
warnings.filterwarnings("ignore", category=UserWarning, module="mplcursors")

# File path
file_path = "C:/Users/Gowth/Desktop/Capstone Project Torpedo/Hex_Files_Converted_decimal/Control_output_float_with_timestamps.csv"

# Reading the CSV file
df = pd.read_csv(file_path)

# Rename the relevant columns for clarity
df = df.rename(columns={df.columns[0]: 'Time', df.columns[3]: 'Value1'})

# Ensure numeric data
df['Time'] = pd.to_numeric(df['Time'], errors='coerce')
df['Value1'] = pd.to_numeric(df['Value1'], errors='coerce')

# Filter the data to start from the first positive value in the 'Time' column
df_filtered = df[df['Time'] >= 0].reset_index(drop=True)

# Set Seaborn style
sns.set(style="whitegrid")

# Create the scatter plot
plt.figure(figsize=(12, 6))
scatter_plot = sns.scatterplot(
    data=df_filtered,
    x='Time',
    y='Value1',
    marker='+',
    color='blue'
)

# Add labels and title
plt.xlabel("Time (seconds)", fontsize=12)
plt.ylabel("Value1", fontsize=12)
plt.title("Interactive Scatter Plot of Time vs Value1", fontsize=14)

# Customize gridlines with finer spacing
plt.grid(visible=True, which='both', linestyle='--', linewidth=0.5, alpha=0.7)

# Set x-axis ticks at intervals of 10
time_min = df_filtered['Time'].min()
time_max = df_filtered['Time'].max()
ticks = np.arange(0, time_max + 10, 10)  # Generate ticks with a step of 10
plt.xticks(ticks)

# Add interactive cursor
cursor = mplcursors.cursor(hover=True)

# Customize the cursor annotation
@cursor.connect("add")
def on_add(sel):
    sel.annotation.set_text(f"Time: {sel.target[0]:.2f}\nValue1: {sel.target[1]:.2f}")

# Adjust layout and show the plot
plt.tight_layout()
plt.show()
'''

import pandas as pd
import plotly.express as px

# File path
file_path = "C:/Users/Gowth/Desktop/Capstone Project Torpedo/Hex_Files_Converted_decimal/Control_output_float_with_timestamps.csv"

# Reading the CSV file
df = pd.read_csv(file_path)

# Rename the relevant columns for clarity
df = df.rename(columns={df.columns[0]: 'Time', df.columns[7]: 'Value1'})

# Ensure numeric data
df['Time'] = pd.to_numeric(df['Time'], errors='coerce')
df['Value1'] = pd.to_numeric(df['Value1'], errors='coerce')

# Filter the data to start from the first positive value in the 'Time' column
df_filtered = df[df['Time'] >= 0].reset_index(drop=True)

# Create a scatter plot with Plotly
fig = px.scatter(
    df_filtered,
    x="Time",
    y="Value1",
    title="Interactive Scatter Plot of Time vs Value1",
    labels={"Time": "Time (seconds)", "Value1": "Value1"},
    template="plotly_white",
)

# Customize axis ticks for x-axis
fig.update_xaxes(
    tick0=0, dtick=10, showgrid=True, gridwidth=0.5, gridcolor="LightGrey"
)

# Add fine gridlines for y-axis
fig.update_yaxes(showgrid=True, gridwidth=0.5, gridcolor="LightGrey")

# Enable scrolling, zooming, and panning
fig.update_layout(
    height=600,  # Initial height of the plot
    hovermode="closest",  # Enable hover functionality
    dragmode="pan",  # Allow panning
)
# Save the plot as an HTML file
fig.write_html("interactive_scatter_plot.html")

# Output message to locate the file
print("Plot saved as 'interactive_scatter_plot.html'. Open this file in your browser.")

# Show the plot
fig.show()


