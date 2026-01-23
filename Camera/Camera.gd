extends Camera2D

var plr : RigidBody2D;

func _ready():
	plr = Game.plr;

func _process(_delta):
	if(!plr):
		push_error("no player was assigned by Game.gd!!!");
		return;
	self.position = (self.position + plr.position) / 2;
