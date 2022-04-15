//crear entorno virtual (solo una vez al iniciar)
python3 -m venv venv

//activarlo (siempre que vayas a empezar)
source venv\Scripts\activate

//solo una vez
pip install flask

export FLASK_APP=main
flask run
