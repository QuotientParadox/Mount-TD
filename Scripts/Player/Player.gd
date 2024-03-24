extends CharacterBody2D


const SPEED = 50
const ACCELERATION = 600
const FRICTION = 300

var pos_of_tower
var towers = [preload("res://Game Objects/Towers/maple syrup tower/Maple Syrup tower.tscn"), preload("res://Game Objects/Towers/peanut butter tower/peanut butter tower.tscn"), preload("res://Game Objects/Towers/WT tower/WT tower.tscn"), preload("res://Game Objects/Towers/GI Tower.tscn")]
var cost = [10, 20, 40, 50]
var can_place : bool
var is_in_tower : bool
@onready var stretch = $"Player Animation"
var direction : Vector2
@onready var player_sprite = $AnimatedSprite2D

@onready var place_sfx = $"Place down"

func _physics_process(delta):
	var axis : Vector2 = Vector2(Input.get_axis("left", "right"), Input.get_axis("up", "down"))
	if axis == Vector2.ZERO:
		change_direction(direction, false)
		if velocity.length() > FRICTION * delta:
			velocity -= velocity.normalized() * FRICTION * delta
		else:
			velocity = Vector2.ZERO
	else:
		velocity += axis * ACCELERATION * delta
		direction=axis
		change_direction(axis, true)
		velocity = velocity.limit_length(SPEED)
	move_and_slide()

func _input(event):
	if event is InputEventKey:
		for i in range(1, towers.size()+1):
			if Input.is_key_pressed(KEY_0 + i) and Ui.get_child(0).CAS >= cost[i-1] and can_place and !is_in_tower:
				place_sfx.play()
				stretch.play("stretch")
				Ui.get_child(0).give_money(-cost[i-1])
				var mytower = towers[i-1].instantiate()
				mytower.position = position
				get_parent().add_child(mytower)

func change_direction(dir : Vector2, moving : bool):
	if moving:
		match dir:
			Vector2(1, 0):
				player_sprite.play("Walking Right")
			Vector2(-1, 0):
				player_sprite.play("Walking Left")
			Vector2(0, 1):
				player_sprite.play("Walking Front")
			Vector2(0, -1):
				player_sprite.play("Walking Back")
	else:
		match dir:
			Vector2(1, 0):
				player_sprite.play("Idle Right")
			Vector2(-1, 0):
				player_sprite.play("Idle Left")
			Vector2(0, 1):
				player_sprite.play("Idle Front")
			Vector2(0, -1):
				player_sprite.play("Idle Back")

func _on_area_2d_body_entered(body):
	can_place = true


func _on_area_2d_body_exited(body):
	can_place = false


func _on_tower_collision_body_entered(body):
	is_in_tower = true


func _on_tower_collision_body_exited(body):
	is_in_tower = false
