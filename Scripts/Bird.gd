extends RigidBody2D

export (int) var vel_impulso = 75
export (int) var vel_desp = 50
export (int) var vel_incrementar = 5

var alive = true

func _ready():
	pass

func getZoom():
	return $Camera2D.zoom.y

func _physics_process(delta):
	
	if alive:
		linear_velocity.x = vel_desp

#		if(Input.is_action_just_pressed("tocar")):
#			bird_up()
			
		get_tree().get_nodes_in_group("limites")[0].global_position.x = global_position.x

func _integrate_forces(state):
	
	if alive:
	
		for i in range(state.get_contact_count()):
			if(state.get_contact_collider_object(i).is_in_group("kill")):
				alive = false
				$AnimationPlayer.stop()
				linear_velocity.x = 0
				$hit.play()
				
				$AnimatedSprite.flip_v=true
				get_tree().get_nodes_in_group("main")[0].fin_juego()


func bird_up():
	set_linear_velocity(Vector2(0,0))
	linear_velocity.y -= vel_impulso
	$AnimationPlayer.play("BirdAnimation")
	
	$wing.play()
	
	#get_tree().get_nodes_in_group("sfx")[0].get_node("wing").play()

func _set_animation(pos):
	$AnimatedSprite.animation=pos
