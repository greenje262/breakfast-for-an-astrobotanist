extends Node2D

# Set trigger to deactivate plant, tied to plant counter?
onready var sprite_back = $PlantSprite/Back
onready var sprite_front = $PlantSprite/Front

func _on_FoodTrigger_body_entered(body):
	FoodCount.fed += 1
	$FedSmoke.emitting = true
	$FoodTrigger.queue_free()
	yield(get_tree().create_timer(0.75), "timeout")
	sprite_back.texture = load("res://Sprites/fedback.PNG")
	sprite_front.texture = load("res://Sprites/fedfront.PNG")
	remove_from_group("plants")
	
	if get_tree().get_nodes_in_group("plants").size() == 0:
		level_transfer()

func level_transfer():
	print("Transfer!")
	yield(get_tree().create_timer(2), "timeout")
	get_tree().call_group("levelholder", "on_level_clear")
