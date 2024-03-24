extends MarginContainer

@onready var audio = $/VBoxContainer/AudioBox/Audio
@onready var sfx_sample = $"../AudioStreamPlayer"

func _on_audio_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), linear_to_db(value))


func _on_sound_effects_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Sound Effects"), linear_to_db(value))
	sfx_sample.play()


func _on_save_pressed():
	$"../Main Container".visible = true
	$".".visible = false
	$"../Main Container/VBoxContainer/HBoxContainer/Start".grab_focus()
	sfx_sample.play()
