extends CanvasLayer


func _ready():
	if Settings.game_data["debug"] : Global.addChild(self, "FPS")


func _on_Play_pressed():
	Global.goto_scene("Mundo")


func _on_Settings_pressed():
	Global.addChild(self, "Settings")


func _on_Quit_pressed():
	Javascript.quit()
