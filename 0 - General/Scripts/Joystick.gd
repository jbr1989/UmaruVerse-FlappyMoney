extends TouchScreenButton

signal JoystickMove

func move(value):
	emit_signal("JoystickMove", value)
