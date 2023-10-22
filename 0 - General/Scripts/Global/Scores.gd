extends Node

const scoresFile : String = "user://scores_FlappyMoney.json"

export var scores : Array = []

func _ready():
	loadScores()

func addScore(score_id: int, user_id: int, user: String, score: int, time: int):
	scores.append({"score_id": score_id, "user_id": user_id, "user" : user, "score": score, "time": time})
	sortScores()
	saveScores()

func sortScores():
	scores.sort_custom(self, "custom_scores_sort")
	

func isHighScore(score: int, time: int):
	if (scores.empty()): return true
	
	var bestScore = scores[0];
	
	if score>bestScore["score"] : return true
	if score==bestScore["score"] and time>bestScore["time"]: return true
	
	return false

func loadScores():
	scores = loadScoresFromLocalFile()
	
func saveScores():
	saveScoresToLocalFile()
	
	
# OTROS

func custom_scores_sort(a : Dictionary, b : Dictionary):
	var diff = a["score"] - b["score"]
	if (diff!=0): return diff > 0
	
	return a["time"] < b["time"]

func loadScoresFromLocalFile():
	var file = File.new()

	# Abre el archivo en modo lectura
	if file.open(scoresFile, File.READ) == OK:
		var contents = file.get_as_text()
		var result : JSONParseResult = JSON.parse(contents)

		if result.error == OK: return result.result
		
		file.close()
	else:
		print("Error al abrir el archivo de las puntuaciones")

	return []

func saveScoresToLocalFile():
	var file = File.new()

	# Abre el archivo en modo escritura
	if file.open(scoresFile, File.WRITE) == OK:
		var json_text = JSON.print(scores)
		file.store_string(json_text)
		file.close()
	else:
		print("Error al abrir el archivo para escritura")
