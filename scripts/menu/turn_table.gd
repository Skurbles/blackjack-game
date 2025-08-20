extends Node3D

@export var turn_speed = 16;
func _process(delta):
	rotation.y += deg_to_rad(turn_speed)*delta
