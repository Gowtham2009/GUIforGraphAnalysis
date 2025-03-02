from bokeh.plotting import figure, output_file, show
from bokeh.models import ColumnDataSource, WheelZoomTool
import pandas as pd
from tkinter import Tk, filedialog

# Function to load the CSV file
def load_csv():
    Tk().withdraw()
    file_path = filedialog.askopenfilename(filetypes=[("CSV Files", "*.csv")])
    if not file_path:
        print("No file selected. Exiting.")
        exit()
    return pd.read_csv(file_path)

# Load the CSV file
data = load_csv()

# Validate the data
if data.shape[1] < 2:
    print("Error: The file must contain at least two columns.")
    exit()

# Remove negative values in the time column and shift to start from 0
positive_data = data[data.iloc[:, 0] >= 0].reset_index(drop=True)
positive_data.iloc[:, 0] = positive_data.iloc[:, 0] - positive_data.iloc[:, 0].min()

# Create a ColumnDataSource with exact time values
source = ColumnDataSource(data={
    'time': positive_data.iloc[:, 0],  # Use first column for x-axis
    'value': positive_data.iloc[:, 1]  # Use second column for y-axis
})

# Create a Bokeh figure
p = figure(
    title="Interactive Time-Series Data Plot",
    x_axis_label="Time (Seconds)",
    y_axis_label="Value",
    tools="pan,box_zoom,wheel_zoom,reset,save",  # Include essential tools
    active_scroll="wheel_zoom",  # Set wheel zoom as active
    tooltips=[("Time", "@time{0.000}"), ("Value", "@value")],  # Display time with 3 decimal places
    width=1000,  # Increase plot width
    height=600,  # Increase plot height
)

# Add line and scatter plots
p.line(
    x='time',
    y='value',
    source=source,
    legend_label="Line",
    line_width=2,
    color="blue"
)
p.circle(
    x='time',
    y='value',
    source=source,
    size=6,  # Slightly larger points for better visibility
    color="red",
    legend_label="Points"
)

# Improve zooming and scaling behavior
p.match_aspect = True  # Maintain aspect ratio
p.sizing_mode = "stretch_both"  # Make the plot responsive to window size

# Add smooth zooming
zoom_tool = p.select_one(WheelZoomTool)
zoom_tool.zoom_on_axis = True  # Zoom uniformly on both axes
zoom_tool.speed = 0.01  # Slow down zoom speed for better control

# Save and display the plot
output_file("interactive_time_series_plot.html")
show(p)
