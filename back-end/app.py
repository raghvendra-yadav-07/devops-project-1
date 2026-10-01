from flask import Flask, jsonify

app = Flask(__name__)


@app.route("/api/health", methods=["GET"])
def health():
    return jsonify({
        "status": "healthy",
        "message": "Backend is running successfully"
    })


@app.route("/api/info", methods=["GET"])
def info():
    return jsonify({
        "application": "Bangkok Coffee",
        "environment": "production",
        "version": "1.0"
    })


if __name__ == "__main__":
    app.run(
        host="0.0.0.0",
        port=5000
    )