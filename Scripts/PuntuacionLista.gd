extends Popup

export (PackedScene) var PuntuacionItem

onready var PuntuacionItems = get_tree().get_nodes_in_group("puntuacionItem")

var puntuaciones

func _ready():
	showPuntuaciones(0)
	popup()

func _on_CloseBtn_pressed():
	queue_free()


func _on_TabContainer_tab_changed(tab):
	showPuntuaciones(tab)
	
	
	pass # Replace with function body.
	
func showPuntuaciones(tab):
	
	if (tab==0): puntuaciones = Scores.scores
	elif (tab==1): puntuaciones = []
	
	var size = puntuaciones.size()
	
	for i in 10:
		if i+1 > size :
			PuntuacionItems[i].setValues("", "", "")
		else :
			PuntuacionItems[i].setValues(puntuaciones[i]["user"], puntuaciones[i]["score"], str(puntuaciones[i]["time"]) + "s")
