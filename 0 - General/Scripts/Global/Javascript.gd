extends Node

func goto(url:String="", target:String="_blank"):
	JavaScript.eval("window.location.href = '" + url + "';")

func quit():
	JavaScript.eval("history.back()")

func getCookie(name:String):
	var cookie = JavaScript.eval("getCookie('" + name + "')")
	if (cookie==null): return ""
	print("COOKIE: " + cookie)
	return cookie
	
func setCookie(name:String, data:String):
	JavaScript.eval("setCookie('" + name + "','" + data + "', 365)")
