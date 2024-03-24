extends StaticBody2D

var raycast = preload("res://Game Objects/Towers/WT tower/raycast.tscn")
var line = preload("res://Game Objects/Towers/WT tower/Line.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _ready():
	var WT_towers = get_tree().get_nodes_in_group("WT tower")
	for i in WT_towers:
		var rcast = raycast.instantiate()
		var lin = line.instantiate()
		rcast.position = global_position
		if i != self:
			rcast.target_position = i.global_position-position
			rcast.com_cooldown = randf_range(0.5, 1)
			lin.add_point(position)
			lin.add_point(i.global_position)
		get_parent().add_child(lin)
		get_parent().add_child(rcast)
