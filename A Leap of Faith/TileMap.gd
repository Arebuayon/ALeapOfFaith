extends TileMap


var object = preload("res://Objeto.tscn")
onready var area = $Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
#	area.connect("body_entered" , get_parent().get_parent() , "repeat_tile")
	for i in range(4):
		var object_new = object.instance()
		object_new.position = Vector2(rand_range(60, 480) , rand_range(0 , 600))
		$Object_container.add_child(object_new)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func reset_objects():
	for object in $Object_container.get_children():
		object.queue_free()
	for i in range(4):
		var object_new = object.instance()
		object_new.position = Vector2(rand_range(60, 480) , rand_range(0 , 600))
		$Object_container.add_child(object_new)


func _on_Area2D_body_entered(body):
	call_deferred("reset_objects")
	global_position.y = global_position.y + 600*11


func _on_Reset_timeout():
	print("actualizo")
