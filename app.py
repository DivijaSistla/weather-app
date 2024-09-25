from flask import Flask, render_template, request
import requests

app = Flask(__name__)

API_KEY = '6a15fde6a4adeb69e26a57173be411ce'  # Replace with your OpenWeatherMap API key

@app.route('/', methods=['GET', 'POST'])
def index():
    weather = None
    if request.method == 'POST':
        city = request.form.get('city')
        url = f'http://api.openweathermap.org/data/2.5/weather?q={city}&appid={API_KEY}&units=metric'
        response = requests.get(url)
        if response.status_code == 200:
            weather = response.json()
        else:
            weather = {'message': 'City not found!'}
    return render_template('index.html', weather=weather)

if __name__ == '__main__':
    app.run(host="0.0.0.0", port=5000)
