extends Node

const savefile : String = "user://savefile.save"

var game_data : Dictionary = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	init_data()


func init_data():
	
	if game_data == {} || game_data.has("user") == false:
		game_data = {
			"audio": 1,
			"music": 1,
			"sfx": 1,
			"user": ""
		}
	
	save_all_data(game_data)
		
func load_data():
	var file = File.new()
	
	if file.file_exists(savefile):
		file.open(savefile, File.READ)
		game_data = file.get_var()
		file.close()
	
func save_all_data(gameData):
	var file = File.new()
	file.open(savefile, File.WRITE)
	file.store_var(gameData)
	file.close()
	
func save_data(key, value):
	game_data[key] = value
	save_all_data(game_data)
	
func get_all_data():
	return game_data
	
func get_data(key):
	return game_data[key]
