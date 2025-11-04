extends RigidBody2D

@export var speed = 100.0

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	var direction : Vector2 = Vector2(
		(float(Input.is_action_pressed("mov_right")) -
			float(Input.is_action_pressed("mov_left"))),
		(float(Input.is_action_pressed("mov_up")) -
			float(Input.is_action_pressed("mov_down")))
	)
	
	move_and_collide(direction * speed)
