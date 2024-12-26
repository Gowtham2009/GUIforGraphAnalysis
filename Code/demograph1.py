from bokeh.plotting import figure, output_file, show
from bokeh.models import WheelZoomTool, ResetTool
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

# Filter for positive X values
positive_data = data[data.iloc[:, 0] > 0].reset_index(drop=True)

# Create a Bokeh figure with improved layout
p = figure(
    title="Interactive CSV Data Plot (Positive X Values)",
    x_axis_label="Column 0",
    y_axis_label="Column 1",
    tools="pan,box_zoom,wheel_zoom,reset,save",  # Include essential tools
    active_scroll="wheel_zoom",  # Set wheel zoom as active
    tooltips=[("X", "$x"), ("Y", "$y")],
    width=1000,  # Increase plot width
    height=600,  # Increase plot height
)

# Add a line plot and scatter points
p.line(
    x=positive_data.iloc[:, 0],
    y=positive_data.iloc[:, 1],
    legend_label="Line",
    line_width=2,
    color="blue"
)
p.circle(
    x=positive_data.iloc[:, 0],
    y=positive_data.iloc[:, 1],
    size=8,  # Slightly larger points
    color="red",
    legend_label="Points"
)

# Improve zooming and scaling behavior
p.match_aspect = True  # Maintain aspect ratio
p.sizing_mode = "stretch_both"  # Make the plot responsive to window size

# Add smooth zooming
zoom_tool = p.select_one(WheelZoomTool)
zoom_tool.zoom_on_axis = False  # Zoom uniformly on both axes
zoom_tool.speed = 0.1  # Slow down zoom speed for better control

# Save and display the plot
output_file("interactive_positive_plot.html")
show(p)
