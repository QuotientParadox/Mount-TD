extends RayCast2D

var dt : float
var com_cooldown = 0.5
var line = preload("res://Game Objects/Towers/WT tower/Line.tscn")
#var rcast_particle = preload("res://Game Objects/particles/Telaphone Particle.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	dt += delta
	if dt >= com_cooldown:
		var lin = line.instantiate()
		lin.add_point(target_position+position)
		lin.add_point(global_position)
		get_tree().get_root().add_child(lin)
		if is_colliding():
			get_collider().health -= 4
		
		dt = 0
