extends CharacterBody2D

@export var speed = 50
var prev_dir: Vector2 = Vector2(0,0)

@onready var anim = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	var direction: Vector2
	direction.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")

	direction.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")

	if abs(direction.x) == 1.0 and abs(direction.y) == 1.0:
		direction = direction.normalized()
	
	var movement = speed * direction * delta
	move_and_collide(movement)
	anim.play(get_anim(direction))

func get_anim(direction: Vector2) -> String:
	var animation: String
	if direction != Vector2.ZERO:
		animation = "walk_" + get_anim_dir(direction)
		prev_dir = direction
	else:
		animation = "idle_" + get_anim_dir(prev_dir)
	return animation
		
func get_anim_dir(direction: Vector2) -> String:
	var normalized_dir: Vector2 = direction.normalized()
	var x = normalized_dir.x
	var y = normalized_dir.y
	if y > 0:
		return "down"
	elif y < 0:
		return "up"
	elif x > 0:
		return "right"
	elif x < 0:
		return "left"
	return "down"
	
	
