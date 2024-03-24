extends PathFollow2D

@onready var die = $AudioStreamPlayer
var slow := false
var speed := 60.0
var dt : float
"""
func _ready():
	progress_ratio = 0.9
"""

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if progress_ratio != 1:
		progress += speed * delta
		#print(progress_ratio)
	else:
		Ui.get_child(0).damage(1)
		queue_free()
	if slow:
		dt += delta
		if dt >= 3:
			slow = false
			speed*=1.5
			dt=0
func slow_down():
	if !slow:
		speed/=1.5
	slow = true
