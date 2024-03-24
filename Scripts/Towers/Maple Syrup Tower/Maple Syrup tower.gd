extends Node2D

var can_shoot := false
var enemy : CharacterBody2D
var time_delay : float
var fire_rate := 2

# Bullet variables
const bullet = preload("res://Game Objects/Towers/maple syrup tower/Maple Syrup bullet.tscn")
@onready var audio_stream_player = $"../AudioStreamPlayer"
var speed = 100

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time_delay += delta
	#print(get_nearest_enemy_dist("Enemy"))
	if get_nearest_enemy_dist("Enemy") <= 50:
		enemy = get_nearest_enemy("Enemy")
	if enemy != null:
		look_at(enemy.global_position)
		if time_delay >= fire_rate:
			var bullet_object = bullet.instantiate()
			bullet_object.speed = Vector2(speed, 0).rotated(deg_to_rad(rotation_degrees))
			bullet_object.rotation_degrees = rotation_degrees
			bullet_object.position = get_child(0).global_position
			audio_stream_player.play()
			get_tree().get_root().add_child(bullet_object)
			time_delay = 0


func get_nearest_enemy(enemy_group : String):
	var target_group = get_tree().get_nodes_in_group(enemy_group)
	var distance := INF
	var clostest_object
	for obj in target_group:
		var object = global_position.distance_to(obj.global_position)
		#print(object)
		if object < distance:
			clostest_object = obj
			distance = object
	return clostest_object
func get_nearest_enemy_dist(enemy_group : String):
	var target_group = get_tree().get_nodes_in_group(enemy_group)
	var distance := INF
	var clostest_object
	for obj in target_group:
		var object = global_position.distance_to(obj.global_position)
		#print(object)
		if object < distance:
			clostest_object = obj
			distance = object
	return distance
