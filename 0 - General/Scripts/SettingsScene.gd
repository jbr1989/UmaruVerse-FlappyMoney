extends Popup

onready var sound_all = AudioServer.get_bus_index("Master")
onready var sound_musica = AudioServer.get_bus_index("Musica")
onready var sound_sfx = AudioServer.get_bus_index("SFX")

onready var SoundChk = $Panel/MarginContainer/VBoxContainer/Audio/SoundChk
onready var MusicaChk = $Panel/MarginContainer/VBoxContainer/Audio/MusicaChk
onready var EfectosChk = $Panel/MarginContainer/VBoxContainer/Audio/EfectosChk

onready var DebugChk = $Panel/MarginContainer/VBoxContainer/Debug/DebugChk

var save
var game_data

# Called when the node enters the scene tree for the first time.
func _ready():
	
	popup()
	
	if (!Settings.game_data.empty()):
		SoundChk.pressed = Settings.game_data["audio"]["all"]
		MusicaChk.pressed = Settings.game_data["audio"]["music"]
		EfectosChk.pressed = Settings.game_data["audio"]["sfx"]
		DebugChk.pressed = Settings.game_data["debug"]
	else:
		SoundChk.pressed = not AudioServer.is_bus_mute(sound_all) 
		MusicaChk.pressed = not AudioServer.is_bus_mute(sound_musica)  #Save.game_data.music
		EfectosChk.pressed = not AudioServer.is_bus_mute(sound_sfx) #Save.game_data.sfx
		DebugChk.pressed = false
	
			
	#UserTxt.text = game_data["user"]
	
	#popup()

func _on_SoundChk_toggled(button_pressed):
	AudioServer.set_bus_mute(sound_all, not button_pressed)
	Settings.game_data["audio"]["all"] = button_pressed
	Settings.save()

func _on_MusicaChk_toggled(button_pressed):
	AudioServer.set_bus_mute(sound_musica, not button_pressed)
	Settings.game_data["audio"]["music"] = button_pressed
	Settings.save()

func _on_EfectosChk_toggled(button_pressed):
	AudioServer.set_bus_mute(sound_sfx, not button_pressed)
	Settings.game_data["audio"]["sfx"] = button_pressed
	Settings.save()

func _on_DebugChk_toggled(button_pressed):
	Settings.game_data["debug"] = button_pressed
	Settings.save()

func _on_CloseBtn_pressed():
	queue_free()
	#hide()

