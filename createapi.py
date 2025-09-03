
from flask import Flask, jsonify, request

app = Flask(__name__)

# Sample route (GET request)
@app.route('/hello', methods=['GET'])
def hello_world():
    return jsonify({'message': 'Hello, world!'})



if __name__ == '__main__':
    app.run(debug=True)

print(1 + 3)