extends Node2D

var save_dict = {
	"high_score" : 0,
	"player_name" : "player"
}

# Called when the node enters the scene tree for the first time.
func _ready():
	if not FileAccess.file_exists("user://savegame.save"):
		save_game()
		load_game()
	else:
		load_game()

func save_game():
	var save_game = FileAccess.open("user://savegame.save", FileAccess.WRITE)
	
	var json_string = JSON.stringify(save_dict)
	
	#print(json_string)
	
	save_game.store_line(json_string)

func load_game():
	var save_game = FileAccess.open("user://savegame.save", FileAccess.READ)
	
	while save_game.get_position() < save_game.get_length():
		var json_string = save_game.get_line()
		var json = JSON.new()
		var parse_result = json.parse(json_string)
		var node_data = json.get_data()
		
		save_dict = node_data
		print(save_dict)
