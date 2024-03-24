extends Path2D

var enemies : Array
const possible_enemies = [preload("res://Game Objects/Enemies/Enemy.tscn"), preload("res://Game Objects/Enemies/Fast_enemy.tscn"), preload("res://Game Objects/Enemies/Enemy_strong.tscn")]
var spawning_enemies := true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_child_count() == 0 and spawning_enemies:
		spawning_enemies = false
		await get_tree().create_timer(5).timeout
		spawning_enemies = true
		Ui.get_child(0).enemy_count += 1
		Ui.get_child(0).Wave.text = "Wave "+str(Ui.get_child(0).enemy_count)
		if Ui.get_child(0).waves == Ui.get_child(0).enemy_count:
			Ui.get_child(0).ex_health += 10 + Ui.get_child(0).waves
			Ui.get_child(0).waves += 5
			print("increased enemy hp")
		for i in range(Ui.get_child(0).enemy_count):
			spawn_enemy()
			await get_tree().create_timer(0.25).timeout

func spawn_enemy():
	var instance = (possible_enemies.pick_random()).instantiate()
	instance.get_child(0).health += Ui.get_child(0).ex_health
	enemies.append(instance)
	add_child(instance)
