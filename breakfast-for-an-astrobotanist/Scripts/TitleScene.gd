extends Node2D

const FOOD = preload("res://Scenes/Food.tscn")

func food_drop():
	var food = FOOD.instance()
	add_child(food)
	food.position = $Position2D.position

func _on_DropTimer_timeout():
	food_drop()

func _on_Quit_pressed():
	get_tree().quit()

func _on_Play_pressed():
	FoodCount.count = 10
	FoodCount.fed = 0
	get_tree().change_scene("res://Scenes/LevelHolder.tscn")
