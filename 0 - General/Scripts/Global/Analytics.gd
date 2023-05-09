extends Node

func _exec(comando:String=""):
	print ("ANALYTICS: " + comando)
	JavaScript.eval(comando)

func init_game(game:String = ""):
	var value := { "name": game }
	var comando = "sendEvent('InitGame', '" + to_json(value) + "')"
	_exec(comando)
	pass

func start_game(game:String = ""):
	var value := { "name": game }
	var comando = "sendEvent('StartGame', '" + to_json(value) + "')"
	_exec(comando)
	pass


