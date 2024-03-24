extends Control

@onready var money = $ColorRect/HBoxContainer2/Label
@onready var health_bar = $HBoxContainer/Progress
@onready var time_label = $HBoxContainer2/Time
@onready var Wave = $HBoxContainer2/Wave
var health := 3
@export var CAS := 30
var time : float
var enemy_count : int
var ex_health = 0
var waves = 5

func _ready():
	money.text = "CA$"+str(CAS)
	health_bar.max_value = health

func _process(delta):
	if get_tree().current_scene != null and get_tree().current_scene.name == "Game":
		SceneTransfer.counting = true
	time_label.text = str(snapped(SceneTransfer.counter, 0.1))

func give_money(mon):
	CAS += mon
	money.text = "CA$"+str(CAS)

func damage(hurt : int):
	health -= hurt
	health_bar.value -= hurt
	print("Player took damage HP="+str(health))
	if health <= 0:
		#TODO: Make player die
		if enemy_count >= Saveload.save_dict["high_score"]:
			Saveload.save_dict["high_score"] = enemy_count
			Saveload.save_game()
			print(Saveload.save_dict["high_score"])
		SceneTransfer.change_scene_to_died(str(get_tree().current_scene.scene_file_path))
func reset_values():
	CAS = 30
	money.text = "CA$"+str(CAS)
	health = 3
	health_bar.value = health
	ex_health = 0
	waves = 5
	enemy_count = 0
	time = 0
	print("pressed")
