extends CanvasLayer

#onready var Menu = $MenuContainer;
#onready var Instrucciones = $Instrucciones
#
#signal iniciar_juego

#func _ready():
#	Analytics.start_game("FlappyMoney")
#
#func mostrar_mensaje(texto, timeout = false):
#	$Mensaje.text = texto
#	$Mensaje.show()
#	if timeout: $MensajeTimer.start()

#func game_start():
#	mostrar_mensaje("Adelante!", true)
#
#	Menu.hide()
#	Instrucciones.hide()
#
#	update_score(0)
#	update_time(0)
#
#func game_over():
#	mostrar_mensaje("Fin del juego", true)
#	yield($MensajeTimer, "timeout") # Espera al signal timeout del Timer
#
#	# Volver a mostrar el menu
#	Menu.show()
#	Instrucciones.show()
#
#	mostrar_mensaje("Flappy Money")
	
#func update_score(score):
#	ScoreLabel.text = str(score) # Convertir un objeto a String
#
#func update_time(time):
#	TimeLabel.text = str(time) # Convertir un objeto a String
	
#func _on_MensajeTimer_timeout():
#	$Mensaje.hide()
	
func _on_PlayBtn_pressed():
	#Menu.hide()
	#Instrucciones.hide()
	#emit_signal("iniciar_juego")
	Global.goto_scene("Mundo")

func _on_QuitBtn_pressed():
	#Global.goto_scene("Main")
	Javascript.quit()
