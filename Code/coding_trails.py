import pandas as pd
import plotly.express as px
from plotly.offline import plot
from tkinter import Tk, filedialog

# Function to load the CSV file
def load_csv():
    # Open a file dialog to select a CSV file
    Tk().withdraw()  # Hide the main tkinter window
    file_path = filedialog.askopenfilename(filetypes=[("CSV Files", "*.csv")])
    if file_path:
        return pd.read_csv(file_path)
    else:
        print("No file selected. Exiting.")
        exit()

# Load the CSV file
data = load_csv()

# Check if the required columns exist
if data.shape[1] < 2:
    print("Error: The file must contain at least two columns.")
    exit()

# Extract the 0th and 1st columns
x_values = data.iloc[:, 0]
y_values = data.iloc[:, 1]

# Filter the data to start from the first positive value in the 0th column
positive_data = data[x_values > 0].reset_index(drop=True)

# Create a DataFrame for plotting
plot_data = pd.DataFrame({
    'X': positive_data.iloc[:, 0],
    'Y': positive_data.iloc[:, 1]
})

# Create an interactive plot using Plotly
fig = px.line(plot_data, x='X', y='Y', title="Interactive CSV Data Plot (Positive X Values)",
              labels={'X': 'Column 0', 'Y': 'Column 1'},
              markers=True)  # Add markers to highlight points

# Save the graph as an HTML file and open it
plot(fig, filename='interactive_positive_plot.html', auto_open=True)
a