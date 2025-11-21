extends RigidBody2D

@export var speed = 300.0

var dampening_mul = 1 + speed / 1000

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	var direction : Vector2 = Vector2(
		(float(Input.is_action_pressed("mov_right")) -
			float(Input.is_action_pressed("mov_left"))),
		(float(Input.is_action_pressed("mov_down")) -
			float(Input.is_action_pressed("mov_up")))
	)
	
	#move_and_collide(direction * speed)
	if(direction.x == 0):
		linear_velocity.x /= dampening_mul
	else:
		linear_velocity.x = direction.x * speed
	
	if(direction.y == 0):
		linear_velocity.y /= dampening_mul
	else:
		linear_velocity.y = direction.y * speed
