from flask import Flask, jsonify

app = Flask(__name__)

# Root endpoint
@app.route("/")
def home():
    return "Hello DevSecOps!"

# Health check endpoint
@app.route("/health")
def health():
    return jsonify(status="UP", message="Application is healthy")

# Info endpoint
@app.route("/info")
def info():
    return jsonify(
        app="DevSecOps Demo",
        version="1.0.0",
        description="A simple Flask app with multiple endpoints"
    )

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=80)
