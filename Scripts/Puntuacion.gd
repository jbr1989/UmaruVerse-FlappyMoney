extends CanvasLayer


onready var ScoreLabel = $Panel/InfoContainer/BookContainer/ScoreLabel
onready var TimeLabel = $Panel/InfoContainer/TimerContainer/TimeLabel

onready var parent

var score : int = 0
var time : int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	parent = get_parent()
	
func load_score(s, t):
	
	score=s
	time=t

	ScoreLabel.text = str(score)
	TimeLabel.text = str(time)


func _on_RetryBtn_pressed():
	self.queue_free()
	parent.init()


func _on_CloseBtn_pressed():
	get_tree().paused = false
	parent.close()
	
	
func saveScore():
	var httpRequest = get_node("/root/HttpRequest")
	var body : Dictionary = { "user": "jbr1989", "score": score, "time": time}
	var response = yield(httpRequest.postJSON("https://api.jbr1989.es/umaruverse/scores", [], to_json(body)), "completed")
	
	pass

