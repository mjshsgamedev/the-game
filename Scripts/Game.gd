extends Node2D

@export var StartPoint : Node2D
@export var Player : RigidBody2D

func _ready():
	Player = preload("res://Player/Player.tscn").instantiate()
	Player.position = StartPoint.position
	add_child(Player)

func _process(delta: float):
	pass
