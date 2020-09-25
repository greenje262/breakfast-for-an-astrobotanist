extends Node2D

const GRAVITY = 500
const FOOD = preload("res://Scenes/Food.tscn")

var food_count = FoodCount.count

func _ready():
	$FoodCounter/Label.text = str(FoodCount.count)
	$Player/AnimatedSprite.set_frame(0)

func _physics_process(delta):
	if Input.is_action_just_pressed("throw") and FoodCount.count > 0:
		throw()

func throw():
	if get_global_mouse_position().x - $Player.position.x > 1:
		$Player/AnimatedSprite.flip_h = false
		food_spawn()
	else:
		$Player/AnimatedSprite.flip_h = true
		food_spawn()

func food_spawn():
	var food = FOOD.instance()
	var throw_dir
	var throw_vel
	
	$Player/AnimatedSprite.set_frame(0)
	$Player/AnimatedSprite.play("throw")
	yield(get_tree().create_timer(0.5), "timeout")
	add_child(food)
	
	throw_dir = get_angle_to(get_global_mouse_position()) + $Player.rotation
	throw_vel = 500
	
	if $Player/AnimatedSprite.flip_h == false:
		food.position = $Player.position + Vector2(30, -48)
	else:
		food.position = $Player.position + Vector2(-30, -48)
	
	food.rotation = throw_dir
	food.apply_impulse(Vector2(), (get_global_mouse_position() - $Player.position).normalized() * throw_vel)
	
	FoodCount.count -= 1
	$FoodCounter/Label.text = str(FoodCount.count)
