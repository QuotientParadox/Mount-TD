extends PathFollow2D

var slow := false
@export var speed := 30.0
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
			speed*=2
			dt=0
func slow_down():
	if !slow:
		speed/=2
	slow = true
