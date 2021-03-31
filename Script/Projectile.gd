extends Area2D
onready var par = $Particles2D

export var SPEED = 500

func _physics_process(delta):
	global_position.x += SPEED * delta
