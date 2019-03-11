extends Node

var request_type
var final_url

const PARAMETERS = {
	key = ['your_token_key'],
}
const BASE_URLS = { 
	me = 'https://itch.io/api/1/KEY/me',
	mygames = 'https://itch.io/api/1/KEY/my-games'
}

func _ready():
	pass
	
func parser (BASE_URLS :String, arg):
	var urls = BASE_URLS.split("KEY")
	var combine = urls[0] + arg[0] + urls[1]
	return combine
	
func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	var json = JSON.parse(body.get_string_from_utf8())
	print(json.result, response_code, headers, body)
	$CanvasLayer/TEXT.text = str(json.result)

func _on_Button_button_down():
	final_url = parser(BASE_URLS["me"], PARAMETERS["key"])
	$HTTPRequest.request(final_url)
