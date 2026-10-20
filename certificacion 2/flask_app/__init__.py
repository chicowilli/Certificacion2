from flask import Flask

app = Flask(__name__)
app.secret_key = "272105"


from flask_app.controllers import usuarios, viajes