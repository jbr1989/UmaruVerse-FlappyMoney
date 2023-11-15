extends CanvasLayer

onready var SoundBtn = $Menu/HBoxContainer/SoundBtn

onready var sound_play = preload("res://0 - General/Sprites/UI/sound-on-texture.tres")
onready var sound_mute = preload("res://0 - General/Sprites/UI/sound-off-texture.tres")

onready var master_sound : int = AudioServer.get_bus_index("Master")
onready var is_mute: bool = false

onready var parent


func _ready():
	parent = get_parent()
	set_sound_icon()


func _on_Button_pressed():
	AudioServer.set_bus_mute(master_sound, not is_mute)
	set_sound_icon()
	
	
func set_sound_icon():
	is_mute = AudioServer.is_bus_mute(master_sound)
	
	print("MUTE: " + str(is_mute))
	SoundBtn.icon = sound_play if is_mute else sound_mute


func _on_Play_pressed():
	get_tree().paused = false
	self.queue_free()

func _on_Restart_pressed():
	get_tree().paused = false
	self.queue_free()
	parent.init()

func _on_Options_pressed():
	Global.addChild(self, "Settings")

func _on_Quit_pressed():
	get_tree().paused = false
	parent.close()



