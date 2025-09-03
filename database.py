import pyodbc

conn = pyodbc.connect(
    "DRIVER={ODBC Driver 17 for SQL Server};"
    "SERVER=NDSL094\SQLEXPRESS;"
    "DATABASE=MyDatabase;"
    "Trusted_Connection=yes;"
)

cursor = conn.cursor()
cursor.execute("select * from Employees;")
row = cursor.fetchone()
print(row)

cursor.close()
conn.close()