extends Node

onready var Scene : Dictionary = {
	"Splash": "res://0 - General/Scenes/Splash.tscn",
	"Main": "res://0 - General/Scenes/MainGame.tscn",
	"Pause" : "res://0 - General/Scenes/Pausa_menu.tscn",
	"Settings" : "res://0 - General/Scenes/SettingsScene.tscn",
	"Credits": "res://0 - General/Scenes/Credits.tscn",
	"Catch" : "res://1 - CatchManga/Screens/Mundo.tscn",
	"Arcanoid" : "res://2 - Arcanoid/Screens/Title.tscn",
	"FindPartner" : "res://3 - FindPartner/Screens/Tablero.tscn",
	"FlappyMoney" : "res://Screens/World.tscn",
	"FlappyMoneyInterfaz" : "res://Screens/Interfaz.tscn"
}

onready var Api : Dictionary = {
	"url" : "http://localhost:3000/" # https://api.jbr1989.es/api/
}

var current_scene : Node = null
export var init : bool = false

func getInit(): return init
func setInit(value): init=value

func goto_scene(scene):
	
	var path = Scene[scene]

	# This function will usually be called from a signal callback,
	# or some other function from the running scene.
	# Deleting the current scene at this point might be
	# a bad idea, because it may be inside of a callback or function of it.
	# The worst case will be a crash or unexpected behavior.

	# The way around this is deferring the load to a later time, when
	# it is ensured that no code from the current scene is running:

	call_deferred("_deferred_goto_scene",path)

func _deferred_goto_scene(path):

	
	var root = get_tree().get_root()
	#var current_scene = root.get_child( root.get_child_count() -1 )
	
	# Immediately free the current scene,
	# there is no risk here.
	# current_scene.free()
	root.get_child( root.get_child_count() -1 ).free()

	# Load new scene
	var s = ResourceLoader.load(path)

	# Instance the new scene
	current_scene = s.instance()

	# Add it to the active scene, as child of root
	get_tree().get_root().add_child(current_scene)

	# optional, to make it compatible with the SceneTree.change_scene() API
	get_tree().set_current_scene( current_scene )

func change_displayMode(toggle):
	OS.window_fullscreen = toggle

#func wait(seconds):
#	yield(wait(2),"completed");
