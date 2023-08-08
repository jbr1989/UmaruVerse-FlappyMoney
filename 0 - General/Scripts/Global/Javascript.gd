extends Node

func goto(url:String="", target:String="_blank"):
	JavaScript.eval("window.location.href = '" + url + "';")

func quit():
	JavaScript.eval("history.back()")

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
	JavaScript.eval("localStorage.setItem('" + name + "','" + data + "')")

func localStorageGet(name:String):
	var data = JavaScript.eval("localStorage.getItem('"+name+"')")
	if (data==null): return ''
	return data
