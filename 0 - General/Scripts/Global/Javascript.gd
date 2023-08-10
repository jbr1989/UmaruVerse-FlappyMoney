extends Node

var window = JavaScript.get_interface("window")
var localStorage = JavaScript.get_interface("localStorage")
	
func quit():
	if window!=null: window.history.back()
	else: get_tree().quit()

func getCookie(name:String):
#	var cookie = JavaScript.eval("getCookie('" + name + "')")
#	if (cookie==null): return '';
#	print("COOKIE: " + cookie)
#	return cookie
	return localStorageGet(name)
	
func setCookie(name:String, data:String):
	#JavaScript.eval("setCookie('" + name + "','" + data + "', 365)")
	localStorageSet(name, data)

func localStorageSet(name:String, data:String):
	if localStorage!=null : localStorage.setItem(name, data)

func localStorageGet(name:String):
	if localStorage==null : return ''
	
	var data = localStorage.getItem(name)
	if (data==null): return ''
	return data
