extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Objeto_body_entered(body):
	if body in get_tree().get_nodes_in_group("Player"):
		body.set_physics_process(false)
		body.sprite.play("death")
		$AnimatedSprite.visible = true
		$AnimatedSprite.play("New Anim")


func _on_AnimatedSprite_animation_finished():
	$AnimatedSprite.visible = false
	queue_free()
	var end_scene = preload("res://End_scene.tscn")
	var end_scene_inst = end_scene.instance()
	end_scene_inst.score = get_parent().get_parent().get_parent().get_parent().score
	get_tree().get_root().add_child(end_scene_inst)
	get_tree().change_scene_to(end_scene_inst)
