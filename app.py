from flask import Flask, request, render_template

app = Flask(__name__)

@app.route('/')
def index():
    return '''
        <html>
        <body>
            <form action="/greet" method="POST">
                Enter your name: <input type="text" name="username">
                <input type="submit" value="Submit">
            </form>
        </body>
        </html>
    '''
@app.route('/greet',methods=['POST'])
def greet():
    user_input = request.form['username']
    return f"Hello {user_input}, welcome to this app for docker demo."

if __name__ == '__main__':
    app.run(host='0.0.0.0',port=5000)