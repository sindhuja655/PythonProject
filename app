from flask import Flask, jsonify, request
import pyodbc

app = Flask(__name__)

# Database connection setup
conn_str = (
    "DRIVER={ODBC Driver 17 for SQL Server};"
    "SERVER=NDSL094\\SQLEXPRESS;"
    "DATABASE=MyDatabase;"
    "Trusted_Connection=yes;"
)

def get_db_connection():
    return pyodbc.connect(conn_str)

# Route to return all employees
@app.route('/api/version', methods=['GET'])
def get_employees():
    conn = get_db_connection()
    cursor = conn.cursor()

    cursor.execute("SELECT * FROM Employees;")
    columns = [column[0] for column in cursor.description]  # Get column names
    rows = cursor.fetchall()  # Fetch all rows

    # Convert to list of dicts
    results = [dict(zip(columns, row)) for row in rows]

    cursor.close()
    conn.close()

    return jsonify(results)

# Start the Flask app
if __name__ == '__main__':
    app.run(debug=True)


