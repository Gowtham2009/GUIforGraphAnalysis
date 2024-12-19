import pandas as pd
import plotly.express as px

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

# Create the line plot with Plotly
fig = px.line(
    df_filtered,
    x='Time',
    y='Value1',
    title="Interactive Line Plot of Time vs Value1",
    labels={"Time": "Time (seconds)", "Value1": "Value1"},
    template="plotly_white",
)

# Customize the line appearance
fig.update_traces(line=dict(color='blue', width=2))

# Add finer gridlines and set the x-axis tick interval to 0.2 seconds
fig.update_layout(
    xaxis=dict(
        tickmode='linear',
        tick0=0,
        dtick=0.2,  # Set x-axis tick intervals to 0.2 seconds
        gridcolor='lightgray',
        gridwidth=0.5,
    ),
    yaxis=dict(
        gridcolor='lightgray',
        gridwidth=0.5,
    ),
    hovermode="closest",  # Enable hover for individual points
    autosize=False,
    width=1200,  # Set the initial width of the plot
    height=600,  # Set the initial height of the plot
)

# Save the plot as an HTML file
fig.write_html("interactive_line_plot.html")

# Output message to locate the file
print("Plot saved as 'interactive_line_plot.html'. Open this file in your browser.")

# Show the interactive plot
fig.show()
