extends RigidBody2D

const speed = 500.0
const maxvel = 15000
const pivotdiv = 4
const dampval = 1.1

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	var direction = Vector2(
		(float(Input.is_action_pressed("mov_right")) -
			float(Input.is_action_pressed("mov_left"))),
		(float(Input.is_action_pressed("mov_down")) -
			float(Input.is_action_pressed("mov_up")))
	)
	
	#fix inaccurate speed on diagonal (WASD)
	if absf(direction.x) + absf(direction.y) >= 2:
		direction /= sqrt(2)
	
	if(direction.x != 0):
		if((direction.x > 0) != (linear_velocity.x > 0)):
			linear_velocity.x /= -pivotdiv;
	else:
		if(linear_velocity.x != 0): linear_velocity.x /= dampval
	if(direction.y != 0):
		if((direction.y > 0) != (linear_velocity.y > 0)):
			linear_velocity.y /= -pivotdiv;
	else:
		if(linear_velocity.y != 0): linear_velocity.y /= dampval
	
	#cap speed
	if sqrt(pow(linear_velocity.x, 2) + pow(linear_velocity.y, 2)) <= maxvel:
		linear_velocity += direction * speed * delta
