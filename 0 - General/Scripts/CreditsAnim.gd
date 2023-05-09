extends AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	play("Credits")
	pass # Replace with function body.

func _on_PauseBtn_pressed():
	if (is_playing()): stop(false)
	else: play("Credits")
	
	pass # Replace with function body.

func _on_CloseBtn_pressed():
	Global.goto_scene("Main")
	pass # Replace with function body.



