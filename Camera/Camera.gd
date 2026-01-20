extends Camera2D

var plr : RigidBody2D;

const deadzone : float = 0.01;
const speed : float = 0.1;

func _ready():
	plr = Game.plr;

func _process(_delta):
	if(!plr):
		push_error("no player was assigned by Game.gd!!!");
		return;
	
	#if absf(self.position.x - self.position.y) > deadzone:
	#	if self.position.x > plr.position.x: self.position.x -= speed;
	#	else: self.position.x += speed;
	#self.position.x += 
