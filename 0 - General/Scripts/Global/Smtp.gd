extends Node


var token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuamJyMTk4OS5lcyIsImlhdCI6MTY4MTQ3ODE3NSwiZXhwIjpudWxsLCJhdWQiOiJ1bWFydS5qYnIxOTg5LmVzIiwic3ViIjoiIiwiQXBwIjoiVW1hcnVWZXJzZSIsIlJvbGUiOiJFbWFpbCJ9.7FnTV-lMEQzIm_a01Nou9ubmm-Ya3nZtMlju0B8vVtw"
var fakeToken = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJPbmxpbmUgSldUIEJ1aWxkZXIiLCJpYXQiOjE2ODE0Nzk5MjgsImV4cCI6MTcxMzAxNTkyOCwiYXVkIjoid3d3LmV4YW1wbGUuY29tIiwic3ViIjoianJvY2tldEBleGFtcGxlLmNvbSIsIkdpdmVuTmFtZSI6IkpvaG5ueSIsIlN1cm5hbWUiOiJSb2NrZXQiLCJFbWFpbCI6Impyb2NrZXRAZXhhbXBsZS5jb20iLCJSb2xlIjpbIk1hbmFnZXIiLCJQcm9qZWN0IEFkbWluaXN0cmF0b3IiXX0.1YPsXN7doV5C7srhB_DGAKt6cwW0CLC1VWTdzI4VFC8"
var headers: Array = ["Authorization: Bearer " + fakeToken]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func send_email(asunto:String = "", mensaje:String = ""):
	var body := { "from": "UmaruVerse", "to": "app@jbr1989.es", "subject": asunto, "body": mensaje }
	#headers.append("Authorization: Bearer " + token)
	
	var response = yield(HttpRequest.postJSON(Global.Api.url + "email", headers, to_json(body)), "completed")
	return response
