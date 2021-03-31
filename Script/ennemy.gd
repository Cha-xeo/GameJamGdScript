extends KinematicBody2D

export (float) var SPEED = 50 
export var HP = 1
onready var pol = $Polygon2D
var color = 0
enum{
	BLUE,
	RED,
	GREEN,
	YELLOW,
	PURPLE,
	CYAN
}

func _physics_process(delta):
	if HP == 0:
		queue_free()
	global_position.x -= (SPEED + (SpeedTimer.time_left / 2)) * delta

func _ready():
	
	match (randi()% 3):
		RED:
			SPEED = 100
			pol.color =  Color( 0.86, 0.08, 0.24, 1 )
			color = RED
		BLUE:
			HP = 3
			pol.color = Color( 0, 0, 1, 1 )
			color = BLUE
		GREEN:
			SPEED = 75
			HP = 2
			pol.color = Color( 0, 1, 0, 1 )
			color = GREEN

func _on_Area2D_area_entered(area):
	var name = area.get_child(2).name.to_int()
	match color:
		RED:
			if name == BLUE:
				HP -= 1
				area.queue_free()
		BLUE:
			if name == GREEN:
				HP -= 1
				area.queue_free()
		GREEN:
			if name == RED:
				HP -= 1
				area.queue_free()
