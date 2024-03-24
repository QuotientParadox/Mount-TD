extends CanvasLayer

@onready var animation_player = $AnimationPlayer
var counter : float
var counting := false

var previous_scene : String

func change_scene_to_file(file):
	animation_player.play("transition")
	await animation_player.animation_finished
	get_tree().change_scene_to_file(file)
	animation_player.play_backwards("transition")
func change_scene_to_died(file):
	previous_scene = file
	animation_player.play("transition")
	await animation_player.animation_finished
	get_tree().change_scene_to_file("res://Scene/died.tscn")
	animation_player.play_backwards("transition")
func _physics_process(delta):
	if counting:
		counter += delta
