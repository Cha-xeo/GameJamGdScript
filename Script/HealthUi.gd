extends Control

var nyans = 3 setget set_nyans
var max_nyans = 9

onready var nyansUi = $TextureRect

func set_nyans(value):
	nyans = clamp (value, 0, max_nyans)
	if nyansUi != null:
		nyansUi.rect_size.x = nyans * 728
		
func _ready():
	print(self.max_nyans)
	self.max_nyans = PlayerStats.max_nyans
	self.nyans = PlayerStats.nyans
	PlayerStats.connect("nyans_changed", self, "set_nyans")
