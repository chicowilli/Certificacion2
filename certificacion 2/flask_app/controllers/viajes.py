from flask import render_template, redirect, request, session
from flask_app import app
from flask_app.models.viajes import Viaje

@app.route('/dashboard')
def dashboard():
    if 'usuario_id' not in session:
        return redirect('/')
    todos_los_viajes = Viaje.obtener_todos()
    return render_template('verviaje.html', viajes=todos_los_viajes)

@app.route('/viajes/nuevo')
def nuevo_viaje():
    if 'usuario_id' not in session:
        return redirect('/')
    return render_template('nuevoviaje.html')

@app.route('/viajes/crear', methods=['POST'])
def crear_viaje():
    if 'usuario_id' not in session:
        return redirect('/')
    datos_viaje = request.form.to_dict()
    datos_viaje['usuario_id'] = session['usuario_id']
    Viaje.guardar(datos_viaje)
    return redirect('/dashboard')


@app.route('/viajes/editar/<string:destino>')
def editar_viaje(destino):
    if 'usuario_id' not in session:
        return redirect('/')
    un_viaje = Viaje.obtener_por_destino(destino)
    return render_template('editarviaje.html', viaje=un_viaje)

@app.route('/viajes/actualizar', methods=['POST'])
def actualizar_viaje():
    if 'usuario_id' not in session:
        return redirect('/')
    Viaje.actualizar(request.form)
    return redirect('/dashboard')