extends KinematicBody2D
export var gravity = 50
var velocity = Vector2.ZERO
export var ACCELERATION = 200
export (float) var FRICTION_WEIGHT:float = 0.1
var move_direction = 0
onready var sprite = $AnimatedSprite
onready var background = $CanvasLayer/TextureRect
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func handle_movement():
	move_direction = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	if move_direction != 0:
		velocity.x = velocity.x + (move_direction * ACCELERATION)
		
func apply_speed_limit():
	if is_on_floor():
		velocity.x = clamp(velocity.x, -2000, 2000)
	else:
		velocity.x = clamp(velocity.x, -3000, 3000)
		velocity.y = clamp(velocity.y, -500, 500)
		
func _handle_deacceleration():
		velocity.x = lerp(velocity.x, 0, FRICTION_WEIGHT) if abs(velocity.x) > 1 else 0
		
func _physics_process(delta):
	velocity.y += gravity
	apply_speed_limit()
	handle_movement()
	_handle_deacceleration()
	move_and_slide(velocity)
	if velocity.y > 1000 && velocity.y < 1500:
		sprite.speed_scale = 3
	elif velocity.y > 1500:
		sprite.speed_scale = 5
	background.rect_global_position.y = global_position.y -480


func _on_AnimatedSprite_animation_finished():
	if sprite.animation == "death":
		visible = false
