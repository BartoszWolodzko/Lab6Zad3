from flask import Flask, jsonify, request
from flask_mysqldb import MySQL
import json

app = Flask(__name__)

app.config['MYSQL_HOST'] = 'database'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'root'
app.config['MYSQL_DB'] = 'cars'

mysql = MySQL(app)

@app.route('/cars', methods=['GET'])
def get_cars():
    cur = mysql.connection.cursor()
    cur.execute('''SELECT * FROM cars''')
    rv = cur.fetchall()
    return jsonify(rv)

@app.route('/', methods=['GET'])
def get_hello_world():
    return 'Hello World from flask!'

@app.route('/cars/<year>', methods=['GET'])
def get_car(year):
    cur = mysql.connection.cursor()
    cur.execute('''SELECT * FROM cars WHERE year = %s''', [year])
    rv = cur.fetchall()
    return jsonify(rv)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port='8081', debug=True)

