extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_button_down():
	var main_scene = preload("res://Main.tscn")
	get_tree().change_scene_to(main_scene)


func _on_Button2_pressed():
	get_tree().quit()
