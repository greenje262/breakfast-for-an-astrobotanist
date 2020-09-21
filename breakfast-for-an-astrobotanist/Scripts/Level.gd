extends Node2D

const GRAVITY = 500
const FOOD = preload("res://Scenes/Food.tscn")

onready var food_count = 10

func _physics_process(delta):
	if Input.is_action_just_pressed("throw") and food_count > 0:
		throw()

func throw():
	var food = FOOD.instance()
	var throw_dir
	var throw_vel
	
	add_child(food)
	
	throw_dir = get_angle_to(get_global_mouse_position()) + $Player.rotation
	throw_vel = 500
	
	food.position = $Player.position
	food.rotation = throw_dir
	food.apply_impulse(Vector2(), (get_global_mouse_position() - $Player.position).normalized() * throw_vel)
	
	food_count = food_count - 1
