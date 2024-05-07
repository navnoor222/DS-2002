from flask import Flask, jsonify
from flask_restful import Resource, Api
import csv

app = Flask(__name__)
api = Api(app)

class Data(Resource):
    def get(self):
        data = []
        with open('api_Data.csv', newline='') as csvfile:
            reader = csv.DictReader(csvfile)
            for row in reader:
                data.append(row)
        return jsonify(data)

api.add_resource(Data, '/data')

if __name__ == '__main__':
    # Change the port number as needed
    app.run(debug=True, port=5000)
