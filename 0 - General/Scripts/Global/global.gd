extends Node

onready var Scene : Dictionary = {
	"Pause" : "res://0 - General/Scenes/Pausa_menu.tscn",
	"Settings" : "res://0 - General/Scenes/SettingsScene.tscn",
	"Interfaz" : "res://Screens/Interfaz.tscn",
	"Mundo" : "res://Screens/World.tscn",
	"ScorePanel" : "res://Screens/Puntuacion.tscn",
	"FPS": "res://0 - General/Scenes/fps.tscn"
}

onready var Api : Dictionary = {
	"url" : "http://localhost:3000/" # https://api.jbr1989.es/api/
}

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
	var current_scene = s.instance()

	# Add it to the active scene, as child of root
	get_tree().get_root().add_child(current_scene)

	# optional, to make it compatible with the SceneTree.change_scene() API
	get_tree().set_current_scene( current_scene )

func change_displayMode(toggle):
	OS.window_fullscreen = toggle
	
func addChild(tree, scene):
	var s = ResourceLoader.load(Scene[scene])
	tree.add_child(s.instance())

func quit():
	var window = JavaScript.get_interface("window");
	
	if window!=null: window.endGame() #window.history.back()
	else: get_tree().quit()
