from flask import render_template, redirect, request, session
from flask_app import app
from flask_app.models.usuarios import Usuario

@app.route('/')
def inicio():
    return render_template('iniciosesion.html')

@app.route('/registrar')
def registro():
    return render_template('registroviaje.html')

@app.route('/registrar', methods=['POST'])
def registrar_usuario():
    Usuario.guardar(request.form)
    return redirect('/')

@app.route('/login', methods=['POST'])
def login():
    usuario = Usuario.obtener_por_email(request.form)
    if usuario and usuario.password == request.form['password']:
        session['usuario_id'] = usuario.id
        session['nombre'] = usuario.nombre
        return redirect('/dashboard')
    return redirect('/')

@app.route('/logout')
def logout():
    session.clear()
    return redirect('/')