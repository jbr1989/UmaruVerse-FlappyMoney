extends Node

func goto(url:String="", target:String="_blank"):
	JavaScript.eval("window.location.href = '" + url + "';")

func quit():
	JavaScript.eval("history.back()")
