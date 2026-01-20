extends Node2D
class_name Game

@export var StartPoint : Node2D
static var plr : RigidBody2D
static var cam : Camera2D

func _ready():
	plr = preload("res://Player/Player.tscn").instantiate()
	plr.position = StartPoint.position
	add_child(plr)
	
	## MUST HAPPEN AFTER PLR IS INSTANTIATED
	cam = preload("res://Camera/Camera.tscn").instantiate()
	add_child(cam)

func _process(delta: float):
	pass
