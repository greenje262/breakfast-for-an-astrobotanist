extends Node2D

# Set trigger to deactivate plant, tied to plant counter?
onready var sprite_back = $PlantSprite/Back
onready var sprite_front = $PlantSprite/Front

func _ready():
	add_to_group("plants")

func _on_FoodTrigger_body_entered(body):
	$FedSmoke.emitting = true
	yield(get_tree().create_timer(0.75), "timeout")
	sprite_back.texture = load("res://Sprites/fedback.PNG")
	sprite_front.texture = load("res://Sprites/fedfront.PNG")
	$FoodTrigger.queue_free()
