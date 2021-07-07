from flask import Flask
from werkzeug.datastructures import RequestCacheControl
from itertools import count
from flask import Flask, request
from twilio.twiml.messaging_response import MessagingResponse
import pandas as pd
from twilio.rest import Client
app = Flask(__name__)
account_sid = 'AC9516b6b588fc138e043601bcad3ac65e'
auth_token = '87eb0762b98c9a86794eabc4dbee9d2a'
client = Client(account_sid, auth_token)

@app.route('/')
def hello_world():
    return 'Hello, World!'

@app.route('/home')
def home():
    return 'Home'    

@app.route("/sms", methods=['POST'])
def sms_reply():
    msg = request.form.get('Body')
    resp = MessagingResponse()
    if(msg.lower()=="hello"):
        resp.message("hello")

    return str(resp)

if __name__ == "__main__":
    app.run(debug=True)           