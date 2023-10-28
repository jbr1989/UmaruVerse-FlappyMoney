extends CanvasLayer

onready var MsgLabel = $Panel/Msg

onready var ScoreLabel = $Panel/InfoContainer/BookContainer/ScoreLabel
onready var TimeLabel = $Panel/InfoContainer/TimerContainer/TimeLabel

onready var UserName = $Panel/InfoContainer2/Username
onready var SaveBtn = $Panel/InfoContainer2/SaveBtn

onready var parent

var score : int = 0
var time : int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	parent = get_parent()
	
	UserName.text = Settings.game_data["user"]["name"] if Settings.game_data["user"]["name"]!="" else "Anónimo"
	
func load_score(s, t):
	
	score=s
	time=t

	ScoreLabel.text = str(score)
	TimeLabel.text = str(time)
	
	if Scores.isHighScore(s,t): MsgLabel.text = "NUEVO RECORD"
	
	
func _on_SaveBtn_pressed():
	Scores.addScore(0, 0, UserName.text, score, time)
	SaveBtn.disabled = true
	
	Settings.game_data["user"]["name"] = UserName.text


func _on_RetryBtn_pressed():
	self.queue_free()
	parent.init()
	
func _on_Scores_pressed():
	Global.addChild(self, "ScoreList")

func _on_CloseBtn_pressed():
	get_tree().paused = false
	parent.close()
	
	








