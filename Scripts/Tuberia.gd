extends Node2D

var sprite : Sprite

# Called when the node enters the scene tree for the first time.
func _ready():
	sprite = get_node("Area2D/Sprite")


func _on_VisibilityNotifier2D_screen_exited():
	$Area2D.show()
	sprite.show()
	get_parent().reposicionar()


func _on_Area2D_body_entered(body):
	if(body.is_in_group("bird")):
		get_tree().get_nodes_in_group("main")[0].addScore()
		$Area2D.hide()
		sprite.hide()
