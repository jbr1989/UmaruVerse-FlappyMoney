extends Node

var api_url : String = "https://api.jbr1989.es/umaruverse"
var api_key : String = ""

var response : Dictionary = {"error": true, "method": 0, "result":0, "response_code":200, "headers":[], "body": ""}


func get(url:String=api_url, headers: Array = []):
	return fetch(url, headers, HTTPClient.METHOD_GET)
	
func post(url:String=api_url, headers: Array = [], body:String = ""):
	return fetch(url, headers, HTTPClient.METHOD_POST, body)
	
func postJSON(url:String=api_url, headers: Array = [], body:String = ""):
	headers.append("Content-Type: application/json")
	return yield(fetch(url, headers, HTTPClient.METHOD_POST, body), "completed")

func fetch(url:String=api_url, headers: Array = [], method = HTTPClient.METHOD_GET, body:String = ""):
	if (url == null or url==""): return null;
	
	var http_request = HTTPRequest.new()
	http_request.pause_mode = PAUSE_MODE_PROCESS
	
	add_child(http_request)
	
	http_request.connect("request_completed", self, "handle_response")
	http_request.connect("request_completed", self, "deletechild", [http_request])
	
	var req
	
	if api_key!="": headers.append("X-api-key: "+ api_key) # ??? seguridad???
	
	req = http_request.request(url, headers, true, method, body)
		
	if req!=OK:
		response = {"error": true, "result": 0, "response_code": 200, "headers": [], "body": "ERROR"}
	else: 
		yield(http_request, "request_completed") #Espera que termine el Request
		
	response.method=method
	return response

func deletechild(_a, _b, _c, _d, child):
	child.queue_free()
	
func handle_response(result, response_code, headers, body):
	
	if (response.method==HTTPClient.METHOD_GET): 
		response.error = (response.response_code!=HTTPClient.RESPONSE_OK)
	elif (response.method==HTTPClient.METHOD_POST): 
		response.error = (response.response_code!=HTTPClient.RESPONSE_CREATED)
	
	response.result = result
	response.response_code = response_code
	response.headers = headers
	response.body = parse_json(body.get_string_from_utf8());

#	func fetch(url:String=api_url, headers: Array = [], method = HTTPClient.METHOD_GET, callback:String = "handle_response", body = null):
#	if (url == null or url==""): return null;
#
#	var http_request = HTTPRequest.new()
#	add_child(http_request)
#
#	http_request.connect("request_completed", self, callback)
#	http_request.connect("request_completed", self, "deletechild", [http_request])
#
#	var req
#
#	if body!=null:
#		req = http_request.request(url, headers, true, method, body)
#	else:
#		req = http_request.request(url, headers, true, method)
#
#	if req!=OK: return "error"
#	else: 
#		response = yield(http_request, "request_completed")
#		return response
	
