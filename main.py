from flask import Flask, render_template, request, redirect, url_for
from bd import select, insert, update

app = Flask(__name__,
            static_url_path='',
            static_folder='web/static',
            template_folder='web/templates')


@app.route("/registro", methods = ["GET"])
def registro_usuario():
    usuarios = select("SELECT * FROM usuarios")
    return render_template(
        "registro.html", usuarios=usuarios,
        listar_usuarios=True
    )


@app.route("/registrar", methods = ["POST"])
def registar_usuario():
    sql = "INSERT INTO usuarios (tipo_usuario, nickname, nombres, apellidos, correo, es_anonimo, contraseña) VALUES (%s, %s, %s, %s, %s, %s, %s)"
    val = (1, request.form['Usuario'], request.form['nombres'] ,request.form['Apellidos'] ,request.form['Correo'], 1, request.form['Contraseña'])
    insert(sql, val)
    return redirect(url_for('registro_usuario'))


#siempre que recibimos parametros va enetre <parametro> y lo agregamos a la funcion
@app.route("/actualizar/<usuario_id>", methods = ["GET"])
def actualizar_usuario_vista(usuario_id=None):
    usuario = select(f"SELECT * FROM usuarios WHERE id = {usuario_id}")[0]
    return render_template(
        "registro.html",
        usuario=usuario,
        usuario_id=int(usuario_id),
        actualizar_usuario=True
    )


@app.route("/actualizar", methods = ["POST"])
def actualizar_usuario():
    update(f"UPDATE usuarios SET nickname = '{request.form['nickname']}', nombres = '{request.form['nombres']}', apellidos = '{request.form['apellidos']}', correo = '{request.form['correo']}', contraseña = '{request.form['contraseña']}' WHERE id = {request.form['id']}")
    return redirect(url_for('registro_usuario'))


@app.route("/eliminar-usuario/<usuario_id>")
def eliminar_usuario(usuario_id):
    update(f"DELETE FROM usuarios WHERE id = {usuario_id}")
    return redirect(url_for('registro_usuario'))


@app.route("/login")
def login():
    return render_template("login.html")

