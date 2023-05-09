extends Control

var global

# Called when the node enters the scene tree for the first time.
func _ready():
	global = get_node("/root/Global")
	pass # Replace with function body.
	
#func _input(event):
#	if playing == true:
#		if event is InputEventScreenTouch || event is InputEventKey:
#			print("CLICK SKIP")
#			global.goto_scene("Main")
			#queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_VideoPlayer_finished():
	print("FINISH SPLASH VIDEO")
	yield(get_tree().create_timer(1), "timeout")
	#global.goto_scene("Main")
	#queue_free()
	hide()
	
	pass # Replace with function body.

func _on_PlayBtn_pressed():
	$PlayBtn.hide()
	$AspectRatioContainer/VideoPlayer.play()
	$AudioStreamPlayer.play()
	pass # Replace with function body.
