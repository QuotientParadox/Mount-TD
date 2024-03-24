extends Control

@onready var audio_stream_player = $AudioStreamPlayer

func _ready():
	Ui.visible = false


func _on_texture_button_pressed():
	SceneTransfer.change_scene_to_file("res://Scene/node_2d.tscn")
	audio_stream_player.play()


func _on_object_pressed():
	$Settings.visible = true
	$"Main Container".visible = false
	$TextureRect2.visible = false
	$Settings/VBoxContainer/Save/save.grab_focus()
	audio_stream_player.play()


func _on_quit_pressed():
	get_tree().quit()
	audio_stream_player.play()
