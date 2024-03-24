extends CPUParticles2D


# Called when the node enters the scene tree for the first time.
func _ready():
	emitting = true
	get_child(0).play()
