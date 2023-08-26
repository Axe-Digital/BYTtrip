import flask, jsonify
import sqlite3

app = Flask(__name__)

# Fonction pour récupérer les types de voyage de la base de données
def get_types_voyage():
    conn = sqlite3.connect('database.db')
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM type_voyage ORDER BY id_type_voyage ASC")
    types_voyage = cursor.fetchall()
    conn.close()
    return types_voyage

# Utilisation de Flask pour renvoyer les types de voyage
@app.route('/types-de-voyage', methods=['GET'])
def types_voyage():
    # Récupérer les types de voyage de la base de données
    types_voyage = get_types_voyage()
    # Renvoyer un JSON avec les types de voyage
    types_voyage_dict = {}
    for row in types_voyage:
        types_voyage_dict[row[0]] = row[1]
    return jsonify(types_voyage_dict)

if __name__ == '__main__':
    app.run(debug=True)

