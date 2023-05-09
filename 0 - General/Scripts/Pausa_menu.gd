extends CanvasLayer

onready var SoundBtn = $MarginContainer/Menu/HBoxContainer/SoundBtn

onready var sound_play = preload("res://0 - General/Sprites/UI/sound-mute.svg")
onready var sound_mute = preload("res://0 - General/Sprites/UI/sound-play.svg")

onready var master_sound : int = AudioServer.get_bus_index("Master")
onready var is_mute: bool = AudioServer.is_bus_mute(master_sound)

onready var parent


func _ready():
	parent = get_parent()
	is_mute = AudioServer.is_bus_mute(master_sound)
	set_sound_icon()

func _on_PlayBtn_pressed():
	get_tree().paused = false
	self.queue_free()
	pass # Replace with function body.
	
func _on_RestartBtn_pressed():
	get_tree().paused = false
	self.queue_free()
	parent.init()
	pass # Replace with function body.

func _on_QuitBtn_pressed():
	get_tree().quit()
	pass # Replace with function body.

func _on_OptionsBtn_pressed():
	$SettingsMenu.popup()
	pass # Replace with function body.

func _on_MainBtn_pressed():
	get_tree().paused = false
	#Global.goto_scene("Main")
	Javascript.quit()
	#get_tree().change_scene(Global.Scene["Main"])
	pass # Replace with function body.


func _on_Button_pressed():
	AudioServer.set_bus_mute(master_sound, not is_mute)
	is_mute = AudioServer.is_bus_mute(master_sound)
	set_sound_icon()
	
	
func set_sound_icon():
	print(is_mute)
	SoundBtn.icon = sound_play if is_mute else sound_mute


