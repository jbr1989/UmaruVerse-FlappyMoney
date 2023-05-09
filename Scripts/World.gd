extends Node2D

var puntos = 0

var puntaje : Label
var mensaje : Label

var bird : RigidBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	bird = get_tree().get_nodes_in_group("bird")[0]
	
	puntaje = get_tree().get_nodes_in_group("gui")[0].get_node("Puntos")
	mensaje = get_tree().get_nodes_in_group("gui")[0].get_node("Fin")
	
	var suelo_y = get_tree().get_root().size.y
	var zoom = bird.getZoom()
	
	print ('SUELO')
	print (str(suelo_y) + " : " + str(zoom) + " : " + str(suelo_y * zoom))
	
	$Limites/Suelo/CollisionShape2D.position = Vector2(0, suelo_y * zoom)
	
	#Analytics.init_game("FlappyMoney")
	Analytics.start_game("FlappyMoney")
	pass # Replace with function body.


func addScore():
	$Limites/point.play()
	
	puntos += 1
	puntaje.text = String(puntos)
	
	if puntos == 1:
		bird._set_animation("1")
	
	#if (puntos%10 == 3): #Cada 3 tubos
	bird.vel_desp +=  bird.vel_incrementar
	

func fin_juego():
	mensaje.text = "FIN DE LA PARTIDA"
	yield(get_tree().create_timer(5.0), "timeout")
	#get_tree().reload_current_scene()
	Global.goto_scene("FlappyMoneyInterfaz")
	
func init():
	get_tree().reload_current_scene()

func _on_TouchButton_TouchButton():
	print(bird.position)
	print(bird.global_position)
	
	if bird.alive:
		bird.bird_up()

func _on_PauseBtn_pressed():
	var paused : Object = load(Global.Scene["Pause"]).instance()
	
	add_child(paused)
	get_tree().paused = true
