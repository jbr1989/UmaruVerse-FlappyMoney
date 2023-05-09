extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Dizo_pressed():
	OS.shell_open("https://twitter.com/dizo89")
	pass # Replace with function body.


func _on_Selenabitt_pressed():
	OS.shell_open("https://selenabitt.carrd.co/")
	pass # Replace with function body.


func _on_Komorebi_pressed():
	OS.shell_open("https://twitter.com/HolaKomorebi")
	pass # Replace with function body.


func _on_UmaruYT_pressed():
	OS.shell_open("https://linktr.ee/umaruyt")	
	pass # Replace with function body.
