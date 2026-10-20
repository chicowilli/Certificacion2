from flask_app.config.mysqlconnection import connectToMySQL

class Viaje:
    def __init__(self, data):
        self.id = data['id']
        self.destino = data['destino']
        self.fecha_inicio = data['fecha_inicio']
        self.fecha_fin = data['fecha_fin']
        self.Itinerario = data['Itinerario']
        self.created_at = data.get('created_at')
        self.updated_At = data.get('updated_At')
        self.usuario_id = data['usuario_id']

    @classmethod
    def obtener_todos(cls):
        query = "SELECT * FROM viajes;"
        resultados = connectToMySQL('certificacion2').query_db(query)
        viajes = []
        if resultados:
            for v in resultados:
                viajes.append(cls(v))
        return viajes

    @classmethod
    def guardar(cls, data):
        query = """
            INSERT INTO viajes (destino, fecha_inicio, fecha_fin, Itinerario, usuario_id, created_at, updated_At) 
            VALUES (%(destino)s, %(fecha_inicio)s, %(fecha_fin)s, %(Itinerario)s, %(usuario_id)s, NOW(), NOW());
        """
        return connectToMySQL('certificacion2').query_db(query, data)

    @classmethod
    def obtener_por_destino(cls, destino):
        query = "SELECT * FROM viajes WHERE destino = %(destino)s;"
        resultado = connectToMySQL('certificacion2').query_db(query, {'destino': destino})
        if len(resultado) < 1:
            return None
        return cls(resultado[0])

    @classmethod
    def actualizar(cls, data):
        query = """
            UPDATE viajes 
            SET fecha_inicio = %(fecha_inicio)s, fecha_fin = %(fecha_fin)s, Itinerario = %(Itinerario)s, updated_At = NOW()
            WHERE destino = %(destino)s;
        """
        return connectToMySQL('certificacion2').query_db(query, data)