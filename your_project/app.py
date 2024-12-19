from flask import Flask, render_template, request
import os
import pandas as pd
import plotly.express as px
from werkzeug.utils import secure_filename

app = Flask(__name__)

# Set upload folder
UPLOAD_FOLDER = 'uploads'
os.makedirs(UPLOAD_FOLDER, exist_ok=True)
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/upload', methods=['POST'])
def upload_file():
    if 'file' not in request.files:
        return 'No file part'

    file = request.files['file']
    if file.filename == '':
        return 'No selected file'

    if file:
        filename = secure_filename(file.filename)
        filepath = os.path.join(app.config['UPLOAD_FOLDER'], filename)
        file.save(filepath)

        # Process file and generate graph
        data = pd.read_csv(filepath)
        if 'x' in data.columns and 'y' in data.columns:
            fig = px.line(data, x='x', y='y', title='Interactive Graph')
            graph_html = fig.to_html(full_html=False)
            return render_template('graph.html', graph_html=graph_html)
        else:
            return 'Uploaded file must contain columns named "x" and "y".'

    return 'File upload failed.'

if __name__ == '__main__':
    app.run(debug=True)
