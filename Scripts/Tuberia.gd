extends Node2D

var main = null

#onready var sprite : Sprite = 

# Called when the node enters the scene tree for the first time.
func _ready():
	main = get_tree().get_nodes_in_group("main")[0]
#	sprite = get_node("Area2D/Sprite")


func _on_VisibilityNotifier2D_screen_exited():
	$Area2D.show()
	#$Area2D/Sprite.show()
	get_parent().reposicionar(self)


func _on_Area2D_body_entered(body):
	if(body.is_in_group("bird")):
		main.addScore()
		$Area2D.hide()
		#$Area2D/Sprite.hide()
