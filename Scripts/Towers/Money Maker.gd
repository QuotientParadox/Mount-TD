extends StaticBody2D

var can_shoot := false
var time_delay : float
var money_rate := 5

var td : float
var money_worth := 5
var inflation_rate = 13

@onready var collect = $AudioStreamPlayer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time_delay += delta
	if time_delay >= money_rate:
		Ui.get_child(0).give_money(money_worth)
		collect.play()
		time_delay = 0
	td += delta
	if td >= inflation_rate and money_worth > 1:
		money_worth -= 1
		td = 0
	
