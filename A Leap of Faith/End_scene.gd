extends Control

var score
onready var label = $Label


# Called when the node enters the scene tree for the first time.
func _ready():
	label.text = "YOUR SCORE: "+ str(int(score))


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Restart_button_down():
	var main_scene = load("res://Main.tscn")
	get_tree().change_scene_to(main_scene)
	queue_free()


func _on_Exit_pressed():
	get_tree().quit()
