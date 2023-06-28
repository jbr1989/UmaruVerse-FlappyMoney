extends TouchScreenButton

signal TouchButton

func _input(event):
	
	if event is InputEventScreenTouch and event.is_pressed():
	 	emit_signal("TouchButton")
		
