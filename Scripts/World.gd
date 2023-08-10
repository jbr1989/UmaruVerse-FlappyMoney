extends Node2D

export (PackedScene) var ScorePanel

var time = 0
var score = 0

onready var ScoreLabel = $GUI/InfoContainer/BookContainer/ScoreLabel
onready var TimeLabel = $GUI/InfoContainer/TimerContainer/TimeLabel

#onready var puntaje = $GUI/Puntos
#onready var mensaje = $GUI/Fin

var bird : RigidBody2D


func _ready():
	if Settings.game_data["debug"] : Global.addChild($GUI, "FPS")
	
	start()
	
func init():
	get_tree().reload_current_scene()

# Called when the node enters the scene tree for the first time.
func start():
	
	time = 0
	TimeLabel.text = str(time)
	
	score = 0
	ScoreLabel.text = str(score)
	
	bird = get_tree().get_nodes_in_group("bird")[0]
	
	var suelo_y = get_tree().get_root().size.y
	var zoom = bird.getZoom()
	
	#print ('SUELO')
	#print (str(suelo_y) + " : " + str(zoom) + " : " + str(suelo_y * zoom))
	
	$Limites/Suelo/CollisionShape2D.position = Vector2(0, suelo_y * zoom)
	
	$GUI/TimerTimer.start()
	
	#Analytics.init_game("FlappyMoney")
	Analytics.start_game("FlappyMoney")
	

func addScore():
	$Limites/point.play()
	
	score += 1
	ScoreLabel.text = String(score)
	
	if score == 1:
		bird._set_animation("1")
	
	#if (puntos%10 == 3): #Cada 3 tubos
	bird.vel_desp +=  bird.vel_incrementar
	

func fin_juego():
	#mensaje.text = "FIN DE LA PARTIDA"
	#yield(get_tree().create_timer(5.0), "timeout")
	#get_tree().reload_current_scene()
	
	
	var Score = ScorePanel.instance()
	add_child(Score)
	Score.load_score(score, time)
	
#func init():
#	get_tree().reload_current_scene()

func _on_TouchButton_TouchButton():
	#print(bird.position)
	#print(bird.global_position)
	
	if bird.alive:
		bird.bird_up()

func _on_PauseBtn_pressed():
	var paused : Object = load(Global.Scene["Pause"]).instance()
	
	add_child(paused)
	get_tree().paused = true
	
func _on_TimerTimer_timeout():
	time += 1 # Aumentar la puntuacion cada 1 segundo
	TimeLabel.text = str(time) # Convertir un objeto a String
	
func close():
	Global.goto_scene("Interfaz")
