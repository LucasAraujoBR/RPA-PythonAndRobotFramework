"""Template robot with Python."""
import requests
import json
def minimal_task():
    request = requests.get("https://www.ssllabs.com/ssltest/analyze.html?d=www.imunekids.com.br")
    print(request.json())

if __name__ == "__main__":
    minimal_task()
