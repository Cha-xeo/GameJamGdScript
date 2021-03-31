extends PanelContainer

var difficulty = 0

func _draw():
	$CenterContainer/VBoxContainer/Label.set_text(tr("tuto0"))
	$CenterContainer/VBoxContainer/Label1.set_text(tr("tuto1"))
	$CenterContainer/VBoxContainer/Label2.set_text(tr("tuto2"))
	$CenterContainer/VBoxContainer/Label3.set_text(tr("tuto3"))
	$CenterContainer/VBoxContainer/Label4.set_text(tr("tuto4"))
	$CenterContainer/VBoxContainer/Label5.set_text(tr("tuto5"))

func init(dif):
	show()
	difficulty = dif

func _on_Button_pressed():
	get_parent().find_node("GameArea").init(difficulty)
	queue_free()
