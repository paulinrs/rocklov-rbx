from pymongo import MongoClient
import bson
import ssl

client = MongoClient('mongodb+srv://paulo:19012009@cluster0.mcp0g.mongodb.net/Rocklov?retryWrites=true&w=majority')

db = client['rocklov']

def get_mongo_id():
    return bson.objectid.ObjectId()

def remove_user_by_email(user_email):
    users = db['users']
    users.delete_many({'email': user_email})

def remove_equipo(equipo_name):
    equipos = db['equipos']
    equipos.delete_many({'name': equipo_name})

