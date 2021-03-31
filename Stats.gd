extends Node

export var max_nyans = 9 setget set_max_nyans
var nyans = max_nyans setget set_nyans
export var selected_color = 0

signal no_nyans
signal nyans_changed(value)

func set_max_nyans(value):
	max_nyans = value
	self.nyans = min(nyans, max_nyans)

func set_nyans(value):
	nyans = value
	emit_signal("nyans_changed", nyans)
	if nyans <= 0:
		emit_signal("no_nyans")
		print("<3 Nya 3<")

func _ready():
	self.nyans = 3
