extends KinematicBody2D

onready var redproj = preload("res://Game/projectile/ProjectileRed.tscn")
onready var blueproj = preload("res://Game/projectile/ProjectileBlue.tscn")
onready var greenproj = preload("res://Game/projectile/ProjectileGreen.tscn")
onready var cyanproj = preload("res://Game/projectile/ProjectileCyan.tscn")
onready var yellowproj = preload("res://Game/projectile/ProjectileYellow.tscn")
onready var purpleproj = preload("res://Game/projectile/ProjectilePurple.tscn")
onready var pos = $Position2D
enum{
	BLUE,
	RED,
	GREEN,
	YELLOW,
	PURPLE,
	CYAN
}

func _on_Button_pressed():
	var projectile
	match PlayerStats.selected_color:
		BLUE:
			projectile = blueproj.instance()
			blueproj.set("color", 0)
			self.add_child(projectile)
		RED:
			projectile = redproj.instance()
			redproj.set("color", 1)
			self.add_child(projectile)
		GREEN:
			projectile = greenproj.instance()
			greenproj.set("color", 2)
			self.add_child(projectile)
		YELLOW:
			projectile = yellowproj.instance()
			yellowproj.set("color", 3)
			self.add_child(projectile)
		PURPLE:
			projectile = purpleproj.instance()
			purpleproj.set("color", 4)
			self.add_child(projectile)
		CYAN:
			projectile = cyanproj.instance()
			cyanproj.set("color", 5)
			self.add_child(projectile)
	projectile.global_position = pos.global_position
