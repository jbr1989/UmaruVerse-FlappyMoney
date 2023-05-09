extends Node

var lista_tubos = []

export (float) var offset_x = 250

export (int) var limite_y_min = -130
export (int) var limite_y_max = -300


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	lista_tubos = get_tree().get_nodes_in_group("tubo")
	
	for tubo in lista_tubos:
		azar_y(tubo)


func reposicionar():
	lista_tubos[0].global_position.x = lista_tubos[-1].global_position.x + offset_x
	lista_tubos.push_back(lista_tubos.pop_front()) # Agregar al final el primer elemento
	azar_y(lista_tubos[-1])
	
func azar_y(tubo):
	var r = randi()
	var fix = r%(limite_y_max-limite_y_min)
	var y = limite_y_min - fix
	#print(str(fix) + " : " + str(y))
	tubo.global_position.y = y
