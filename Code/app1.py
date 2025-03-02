# from flask import Flask, render_template, request, session, redirect, url_for, jsonify
# import os
# import pandas as pd
# import json
# import plotly.express as px
# import plotly.utils

# app = Flask(__name__)
# app.secret_key = "your_secret_key"
# UPLOAD_FOLDER = "uploads"
# app.config["UPLOAD_FOLDER"] = UPLOAD_FOLDER

# if not os.path.exists(UPLOAD_FOLDER):
#     os.makedirs(UPLOAD_FOLDER)

# def get_max_columns(files_data):
#     """Returns the maximum column count among all uploaded CSV files"""
#     max_cols = 1  
#     for file_info in files_data:
#         filepath = file_info["path"]
#         if os.path.exists(filepath):
#             try:
#                 df = pd.read_csv(filepath)
#                 if not df.empty:
#                     max_cols = max(max_cols, len(df.columns))
#             except Exception as e:
#                 print(f"Error reading {filepath}: {e}")
#     return max_cols

# @app.route("/", methods=["GET", "POST"])
# def index():
#     if "files_data" not in session:
#         session["files_data"] = []
    
#     global_column = 1  # Default to first column
#     max_columns = get_max_columns(session["files_data"])  

#     if request.method == "POST":
#         if "files[]" in request.files:
#             files = request.files.getlist("files[]")
#             for file in files:
#                 if file and file.filename.endswith(".csv"):
#                     filepath = os.path.join(app.config["UPLOAD_FOLDER"], file.filename)
#                     file.save(filepath)
#                     session["files_data"].append({"name": file.filename, "path": filepath})
#             session.modified = True
#             return redirect(url_for("index"))

#         if "clear_all" in request.form:
#             session["files_data"] = []
#             session.modified = True
#             return redirect(url_for("index"))

#         if "remove_file" in request.form:
#             filename = request.form["remove_file"]
#             session["files_data"] = [
#                 file for file in session["files_data"] if file["name"] != filename
#             ]
#             session.modified = True
#             return redirect(url_for("index"))

#         if "update_all_columns" in request.form:
#             try:
#                 global_column = int(request.form["column"]) - 1  
#             except ValueError:
#                 global_column = 0  

#     max_columns = max(1, get_max_columns(session["files_data"]))  
#     global_column = min(global_column, max_columns - 1)  

#     graphJSON = None
#     dfs = []

#     if session["files_data"]:
#         for file_info in session["files_data"]:
#             filepath = file_info["path"]
#             try:
#                 df = pd.read_csv(filepath)

#                 if not df.empty and global_column < len(df.columns):
#                     column_data = df.iloc[:, global_column]  

#                     if column_data.dtype in ["float64", "int64"]:  
#                         dfs.append((file_info["name"], column_data))
#                     else:
#                         print(f"Skipping non-numeric column {global_column+1} in {file_info['name']}")

#             except Exception as e:
#                 print(f"Error processing {filepath}: {e}")

#         if dfs:
#             fig = px.line(title="CSV Column Comparison")

#             for name, column_data in dfs:
#                 # Convert pandas Series to list for Plotly compatibility
#                 fig.add_scatter(y=column_data.tolist(), mode="lines", name=name)

#             graphJSON = json.dumps(fig, cls=plotly.utils.PlotlyJSONEncoder)

#     return render_template("index.html", files_data=session["files_data"], max_columns=max_columns, global_column=global_column, graphJSON=graphJSON)

# if __name__ == "__main__":
#     app.run(debug=True)
    
















# from flask import Flask, render_template, request, session, redirect, url_for, jsonify
# import os
# import pandas as pd
# import json
# import plotly.express as px
# import plotly.utils

# app = Flask(__name__)
# app.secret_key = "your_secret_key"
# UPLOAD_FOLDER = "uploads"
# app.config["UPLOAD_FOLDER"] = UPLOAD_FOLDER

# if not os.path.exists(UPLOAD_FOLDER):
#     os.makedirs(UPLOAD_FOLDER)

# def get_max_columns(files_data):
#     """Returns the maximum column count among all uploaded CSV files"""
#     max_cols = 1  
#     for file_info in files_data:
#         filepath = file_info["path"]
#         if os.path.exists(filepath):
#             try:
#                 df = pd.read_csv(filepath)
#                 if not df.empty:
#                     max_cols = max(max_cols, len(df.columns))
#             except Exception as e:
#                 print(f"Error reading {filepath}: {e}")
#     return max_cols

# @app.route("/", methods=["GET", "POST"])
# def index():
#     if "files_data" not in session:
#         session["files_data"] = []
    
#     global_column = 1  # Default to first column
#     max_columns = get_max_columns(session["files_data"])  

#     if request.method == "POST":
#         if "files[]" in request.files:
#             files = request.files.getlist("files[]")
#             for file in files:
#                 if file and file.filename.endswith(".csv"):
#                     filepath = os.path.join(app.config["UPLOAD_FOLDER"], file.filename)
#                     file.save(filepath)
#                     session["files_data"].append({"name": file.filename, "path": filepath})
#             session.modified = True
#             return redirect(url_for("index"))

#         if "clear_all" in request.form:
#             session["files_data"] = []
#             session.modified = True
#             return redirect(url_for("index"))

#         if "remove_file" in request.form:
#             filename = request.form["remove_file"]
#             session["files_data"] = [
#                 file for file in session["files_data"] if file["name"] != filename
#             ]
#             session.modified = True
#             return redirect(url_for("index"))

#         if "update_all_columns" in request.form:
#             try:
#                 global_column = int(request.form["column"]) - 1  
#             except ValueError:
#                 global_column = 0  

#     max_columns = max(1, get_max_columns(session["files_data"]))  
#     global_column = min(global_column, max_columns - 1)  

#     return render_template("index.html", files_data=session["files_data"], max_columns=max_columns, global_column=global_column)

# @app.route("/compare")
# def compare():
#     """Renders the comparison graph on a separate page."""
#     if "files_data" not in session or not session["files_data"]:
#         return redirect(url_for("index"))

#     global_column = 1  
#     max_columns = get_max_columns(session["files_data"])  
#     global_column = min(global_column, max_columns - 1)  

#     graphJSON = None
#     dfs = []

#     for file_info in session["files_data"]:
#         filepath = file_info["path"]
#         try:
#             df = pd.read_csv(filepath)

#             if not df.empty and global_column < len(df.columns):
#                 column_data = df.iloc[:, global_column]  

#                 if column_data.dtype in ["float64", "int64"]:  
#                     dfs.append((file_info["name"], column_data))
#                 else:
#                     print(f"Skipping non-numeric column {global_column+1} in {file_info['name']}")

#         except Exception as e:
#             print(f"Error processing {filepath}: {e}")

#     if dfs:
#         fig = px.line(title="CSV Column Comparison")

#         for name, column_data in dfs:
#             fig.add_scatter(y=column_data.tolist(), mode="lines", name=name)

#         graphJSON = json.dumps(fig, cls=plotly.utils.PlotlyJSONEncoder)

#     return render_template("compare.html", graphJSON=graphJSON)

# if __name__ == "__main__":
#     app.run(debug=True)




















from flask import Flask, render_template, request, session, redirect, url_for, jsonify
import os
import pandas as pd
import json
import plotly.express as px
import plotly.utils

app = Flask(__name__)
app.secret_key = "your_secret_key"
UPLOAD_FOLDER = "uploads"
app.config["UPLOAD_FOLDER"] = UPLOAD_FOLDER

if not os.path.exists(UPLOAD_FOLDER):
    os.makedirs(UPLOAD_FOLDER)

def get_max_columns(files_data):
    max_cols = 1  
    for file_info in files_data:
        filepath = file_info["path"]
        if os.path.exists(filepath):
            try:
                df = pd.read_csv(filepath, sep=None, engine="python")
                if not df.empty:
                    max_cols = max(max_cols, len(df.columns))
            except Exception as e:
                print(f"Error reading {filepath}: {e}")
    return max_cols

@app.route("/", methods=["GET", "POST"])
def index():
    if "files_data" not in session:
        session["files_data"] = []
    
    global_column = 1  # Default to first column
    max_columns = get_max_columns(session["files_data"])  

    if request.method == "POST":
        if "files[]" in request.files:
            files = request.files.getlist("files[]")
            for file in files:
                if file and file.filename.endswith(".csv"):
                    filepath = os.path.join(app.config["UPLOAD_FOLDER"], file.filename)
                    file.save(filepath)
                    session["files_data"].append({"name": file.filename, "path": filepath})
            session.modified = True
            return redirect(url_for("index"))

        if "clear_all" in request.form:
            session["files_data"] = []
            session.modified = True
            return redirect(url_for("index"))

        if "remove_file" in request.form:
            filename = request.form["remove_file"]
            session["files_data"] = [
                file for file in session["files_data"] if file["name"] != filename
            ]
            session.modified = True
            return redirect(url_for("index"))

        if "update_all_columns" in request.form:
            try:
                global_column = int(request.form["column"]) - 1  
            except ValueError:
                global_column = 0  

    max_columns = max(1, get_max_columns(session["files_data"]))  
    global_column = min(global_column, max_columns - 1)  

    return render_template("index.html", files_data=session["files_data"], max_columns=max_columns, global_column=global_column)

@app.route("/graph", methods=["POST"])
def graph():
    if "files_data" not in session or not session["files_data"]:
        return "No files uploaded!", 400
    
    global_column = int(request.form.get("column", 1)) - 1  
    dfs = []

    for file_info in session["files_data"]:
        filepath = file_info["path"]
        try:
            df = pd.read_csv(filepath, sep=None, engine="python")
            print(f"File: {file_info['name']}")
            print(df.head())  # Debug CSV content
            
            df.iloc[:, global_column] = pd.to_numeric(df.iloc[:, global_column], errors="coerce")
            df.dropna(subset=[df.columns[global_column]], inplace=True)

            print(f"Selected Column {global_column + 1} Data:")
            print(df.iloc[:, global_column].head(10))  # Debug column values

            if not df.empty and global_column < len(df.columns):
                column_data = df.iloc[:, global_column]
                if column_data.dtype in ["float64", "int64"]:  
                    dfs.append((file_info["name"], column_data.tolist()))

        except Exception as e:
            print(f"Error processing {filepath}: {e}")

    if not dfs:
        return "No numeric data to plot!", 400

    fig = px.line(title="CSV Column Comparison")
    for name, column_data in dfs:
        fig.add_scatter(y=column_data, mode="lines", name=name)

    graphJSON = json.dumps(fig, cls=plotly.utils.PlotlyJSONEncoder)
    return render_template("graph.html", graphJSON=graphJSON)

if __name__ == "__main__":
    app.run(debug=True)
