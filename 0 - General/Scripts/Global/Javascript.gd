extends Node

#var window = JavaScript.get_interface("window")
var localStorage = JavaScript.get_interface("localStorage")
	
func setData(name:String, data:String):
	if localStorage!=null : localStorage.setItem(name, data)

func getData(name:String):
	if localStorage==null : return ''
	
	var data = localStorage.getItem(name)
	if (data==null): return ''
	return data
