extends Control

onready var Splash : Node = $Splash


# Called when the node enters the scene tree for the first time.
func _ready():
	
	# Intro solo la primera vez
	if Global.getInit() : Splash.queue_free()
	if !Global.getInit() : Global.setInit(true)

	#Smtp.send_email("GODOT", "ssss")
	Analytics.start_game("UmaruVerse")

	#response = yield(httpRequest.get("https://api.jbr1989.es/umaruverse", []), "completed")

func _on_CatchBtn_pressed():
	if is_instance_valid(Splash):
		print("Splash exists") 
		Splash.queue_free()
		#Timeout para evitar chirridos de audio al cambiar de escena
		yield(get_tree().create_timer(.5), "timeout") 
		
	#Global.goto_scene("Catch")
	Javascript.goto("CathManga/")
	#get_tree().change_scene("res://1 - CatchManga/Screens/Mundo.tscn") # Canviar de escena
	pass # Replace with function body.

func _on_ArcanoidBtn_pressed():
	if is_instance_valid(Splash): 
		print("Splash exists") 
		Splash.queue_free()
		#Timeout para evitar chirridos de audio al cambiar de escena
		yield(get_tree().create_timer(0.5), "timeout") 
		
	#Global.goto_scene("Arcanoid")
	#get_tree().change_scene("res://2 - Arcanoid/Screens/Title.tscn") # Canviar de escena
	pass # Replace with function body.
	
func _on_FindPartnerBtn_pressed():
	if is_instance_valid(Splash): 
		print("Splash exists") 
		Splash.queue_free()
		#Timeout para evitar chirridos de audio al cambiar de escena
		yield(get_tree().create_timer(.5), "timeout") 
		
	
	#Global.goto_scene("FindPartner")
	Javascript.goto("FindPartner/")
	pass # Replace with function body.
	
func _on_FlappyMoneyBtn_pressed():
	if is_instance_valid(Splash): 
		print("Splash exists") 
		Splash.queue_free()
		#Timeout para evitar chirridos de audio al cambiar de escena
		yield(get_tree().create_timer(.5), "timeout") 
		
	Global.goto_scene("FlappyMoneyInterfaz")
	
func _on_SettingsBtn_pressed():
	$SettingsMenu.popup()

func _on_QuitBtn_pressed():
	get_tree().quit()
	pass # Replace with function body.

func _on_CreditsBtn_pressed():
	if is_instance_valid(Splash): 
		print("Splash exists") 
		Splash.queue_free()
		#Timeout para evitar chirridos de audio al cambiar de escena
		yield(get_tree().create_timer(.5), "timeout") 
		
	Global.goto_scene("Credits")
	pass # Replace with function body.
	
func checkSplash():
	if is_instance_valid(Splash): 
		print("Splash exists") 
		Splash.queue_free()
		#Timeout para evitar chirridos de audio al cambiar de escena
		yield(get_tree().create_timer(.5), "timeout") 







