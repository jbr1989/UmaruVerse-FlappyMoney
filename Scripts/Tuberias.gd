extends Node

var lista_tubos = []
var num_tubos

export (int) var offset_x = 250

export (int) var limite_y_min = -130
export (int) var limite_y_max = -300


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	lista_tubos = get_tree().get_nodes_in_group("tubo")
	num_tubos = lista_tubos.size()
	
	for tubo in lista_tubos:
		azar_y(tubo)


#func reposicionar():
#	lista_tubos[0].global_position.x = lista_tubos[-1].global_position.x + offset_x
#	lista_tubos.push_back(lista_tubos.pop_front()) # Agregar al final el primer elemento
#	azar_y(lista_tubos[-1])
	
func reposicionar(tubo):
	tubo.global_position.x = tubo.global_position.x + (offset_x * num_tubos)
	azar_y(tubo)
	
func azar_y(tubo):
	var fix = randi() % (limite_y_max-limite_y_min)
	var y = limite_y_min - fix
	#print(str(fix) + " : " + str(y))
	tubo.global_position.y = y
