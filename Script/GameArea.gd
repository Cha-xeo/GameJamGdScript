extends Node2D

var Enemy = preload("res://Game/ennemy.tscn")

onready var spawn_container = $Spwarners
onready var enemy_container = $ennemy
onready var spawn_timer = $SpawnTimer
enum{
	BLUE,
	RED,
	GREEN,
	YELLOW,
	PURPLE,
	CYAN
}

var stats = PlayerStats

func init(difficulty):
	show()
	match difficulty:
		0:
			stats.nyans = 9
			spawn_timer.wait_time = 3
		1:
			stats.nyans = 6
			spawn_timer.wait_time = 2
		2:
			stats.nyans = 3
			spawn_timer.wait_time = 1
	set_process_input(true)
	randomize()
	stats.connect("no_nyans", self, "lost")
	spawn_timer.start()
	spawnEnemy()

func _on_SpawnTimer_timeout():
	var enemy_instance = Enemy.instance()
	var spawns = spawn_container.get_children()
	var index = randi()% spawns.size()
	enemy_container.add_child(enemy_instance)
	enemy_instance.global_position = spawns[index].global_position

func spawnEnemy():
	var enemy_instance = Enemy.instance()
	var spawns = spawn_container.get_children()
	var index = randi()% spawns.size()
	enemy_container.add_child(enemy_instance)
	enemy_instance.global_position = spawns[index].global_position

func _on_Area2D_body_entered(body):
	stats.nyans -= 1
	print(stats.nyans)
	body.queue_free()
	
func lost():
	get_tree().change_scene("res://Game.tscn")
	queue_free()

func _unhandled_input(event):
	if Input.is_action_just_pressed("Select_red"):
		PlayerStats.selected_color = RED
	if Input.is_action_just_pressed("Select_blue"):
			PlayerStats.selected_color = BLUE
	if Input.is_action_just_pressed("Select_green"):
			PlayerStats.selected_color = GREEN
	if Input.is_action_just_pressed("Select_purple"):
			PlayerStats.selected_color = PURPLE
	if Input.is_action_just_pressed("Select_yellow"):
			PlayerStats.selected_color = YELLOW 
	if Input.is_action_just_pressed("Select_cyan"):
			PlayerStats.selected_color = CYAN

func _on_destroy_body_entered(body):
	body.queue_free()
