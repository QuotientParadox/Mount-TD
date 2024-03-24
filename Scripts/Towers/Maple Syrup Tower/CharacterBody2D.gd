extends CharacterBody2D

@export var health := 25.0
var max_health : float
@export var money_give := 5
var particles = preload("res://Game Objects/particles/Telaphone Particle.tscn")
@onready var health_bar = $Health

func _ready():
	max_health = health

func _process(delta):
	health_bar.value = health/max_health*100
	if health <= 0:
		var particle = particles.instantiate()
		particle.position = global_position
		Ui.get_child(0).give_money(money_give)
		get_tree().get_root().add_child(particle)
		get_parent().queue_free()
