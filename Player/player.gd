extends RigidBody2D

@export var speed = 300.0

var dampening_mul = 1 + speed / 1000
var pivot_div = 10
var last_direction = Vector2.ZERO

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	var direction = Vector2(
		(float(Input.is_action_pressed("mov_right")) -
			float(Input.is_action_pressed("mov_left"))),
		(float(Input.is_action_pressed("mov_down")) -
			float(Input.is_action_pressed("mov_up")))
	)
	
	if direction.x == -last_direction.x: linear_velocity.x /= pivot_div
	if direction.y == -last_direction.y: linear_velocity.y /= pivot_div
	
	add_constant_central_force(direction * speed)
	linear_velocity /= dampening_mul
	
	if direction.x != 0: last_direction.x = direction.x
	if direction.y != 0: last_direction.y = direction.y
