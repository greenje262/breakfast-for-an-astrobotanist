extends Node2D

const LVL_PATH = "res://Scenes/Level%d.tscn"

var lvl_num = 1

func _ready():
	print("Held!")
	add_to_group("levelholder")
	call_deferred("init")

#func _physics_process(delta):
#	if FoodCount.count == 0:
#		food_out()

func init():
	load_level(lvl_num)

func load_level(num:int):
	var root = get_tree().root
	if root.has_node("Level"):
		root.remove_child(root.get_node("Level"))
	
	var lvl = load(LVL_PATH % num).instance()
	root.add_child(lvl)
	return true

func on_level_clear():
	print("Clear!")
	lvl_num += 1
	load_level(lvl_num)

#func food_out():
#	yield(get_tree().create_timer(10), "timeout")
#	var root = get_tree().root
#	if root.has_node("Level"):
#		root.remove_child(root.get_node("Level"))
#	get_tree().change_scene("res://Scenes/Level9.tscn")
