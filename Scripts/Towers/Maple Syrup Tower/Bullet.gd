extends CharacterBody2D

var speed : Vector2
@onready var hit = $AudioStreamPlayer
var particles = preload("res://Game Objects/particles/Bullet.tscn")
func _process(delta):
	velocity = speed
	move_and_slide()

func _on_area_2d_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	var particle = particles.instantiate()
	particle.position = global_position
	get_tree().get_root().add_child(particle)
	body.health -= 5
	hit.play()
	self.queue_free()
