extends Node

const savefile : String = "res://settings.json"

export var game_data : Dictionary = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	init_data()

func init_data():
	if not game_data.empty(): pass
	
	#Intentar recuperar los ajustes desde la cookie
	var cookie = Javascript.getData("settings")
	
	if !cookie.empty(): game_data = JSON.parse(cookie).result
	else: game_data = open_defaults()

	print("SETTINGS: ", game_data)
	
	load_init()
		
func open_defaults():
	print("OPEN DEFAULTS")
	
	var file = File.new()
	
	if !file.file_exists(savefile):
		print("Settings NO encontrados")
		return {}
	file.open(savefile, File.READ)
	
	var contents = file.get_as_text()
	file.close()
	
	var result : JSONParseResult = JSON.parse(contents)
	
	if result.error != OK: return {}
	
	Settings.save()
	
	print("SETTINGS: ", result.result)
	return result.result
		
func save():
	Javascript.setData("settings", to_json(game_data))
	
func load_init():
	AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), not game_data["audio"]["all"])
	AudioServer.set_bus_mute(AudioServer.get_bus_index("Musica"), not game_data["audio"]["music"])
	AudioServer.set_bus_mute(AudioServer.get_bus_index("SFX"), not game_data["audio"]["sfx"])

