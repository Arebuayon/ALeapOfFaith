extends Node

var map = preload("res://TileMap.tscn")
var max_map = 10
var background = preload("res://Assets/Mapa Fondo.png")
var score = 0
onready var score_label = $CanvasLayer/GUI/Label

# Called when the node enters the scene tree for the first time.
func _ready():
	var map_scene_init = map.instance()
	map_scene_init.global_position = Vector2(0 , 0)
	$map_container.add_child(map_scene_init)
	var map_scene_init2 = map.instance()
	map_scene_init.global_position = Vector2(0 , -600)
	$map_container.add_child(map_scene_init2)
	for i in range(max_map):
		var map_scene = map.instance()
#		var background_tile = TextureRect.new()
#		background_tile.texture = background
#		background_tile.rect_size = Vector2(542, 960)
#		background_tile.expand = true
#		background_tile.rect_global_position = Vector2(0 , 960*(i+1))
		map_scene.global_position = Vector2(0 , 600*(i+1))
		$map_container.add_child(map_scene)
#		$CanvasLayer.add_child(background_tile)

func _process(delta):
	score += delta
	score_label.text = str(int(score))
