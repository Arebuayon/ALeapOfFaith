extends Camera2D


onready var father = get_parent().get_node("Player")

# Called when the node enters the scene tree for the first time.
func _process(delta):
	if father:
		global_position.y = father.global_position.y


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
