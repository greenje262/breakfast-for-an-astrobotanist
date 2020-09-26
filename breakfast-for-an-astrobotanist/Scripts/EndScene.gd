extends Node2D

const FOOD = preload("res://Scenes/Food.tscn")
const FOODBAD = preload("res://Scenes/FoodBad.tscn")

func _ready():
	$Label.text = "YOU FED ALL THE PLANTS"

func _physics_process(delta):
	if get_tree().get_nodes_in_group("food").size() <= FoodCount.fed - 1:
		food_fill()
	
	if get_tree().get_nodes_in_group("foodbad").size() <= (FoodCount.count - FoodCount.fed) - 1:
		food_bad_fill()

func food_fill():
	var food = FOOD.instance()
	add_child(food)
	food.position = $Used.position

func food_bad_fill():
	var food_bad = FOODBAD.instance()
	add_child(food_bad)
	food_bad.position = $Wasted.position

func _on_StartButton_pressed():
	get_tree().change_scene("res://Scenes/TitleScene.tscn")
	queue_free()

func _on_QuitButton_pressed():
	get_tree().quit()
