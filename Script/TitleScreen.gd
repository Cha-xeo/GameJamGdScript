extends CanvasLayer

export var difficulty = 1
onready var language = $TitleScreen/CenterContainer/VBoxContainer/Languages
onready var dif = $TitleScreen/CenterContainer/VBoxContainer/Difficulty

func translate():
	$TitleScreen/CenterContainer/VBoxContainer/Play.set_text(tr("start"))
	$TitleScreen/CenterContainer/VBoxContainer/Exit.set_text(tr("exit"))
	$TitleScreen/CenterContainer/VBoxContainer/fire.set_text(tr("firetip"))
	$TitleScreen/CenterContainer/VBoxContainer/fire2.set_text(tr("selecttip"))
	language.set_item_text(0, tr("english"))
	language.set_item_text(1, tr("french"))
	dif.set_item_text(0, tr("easy"))
	dif.set_text(tr("difficulty"))
	match TranslationServer.get_locale():
		"en":
			language.select(0)
		"fr":
			language.select(1)
	language.set_text(tr("languages"))

func _ready():
	TranslationServer.set_locale("en")
	translate()

func _on_Languages_item_selected(index):
	match index:
		0:
			TranslationServer.set_locale("en")
		1:
			TranslationServer.set_locale("fr")
	translate()

func _on_Difficulty_item_selected(index):
	match index:
		0:
			difficulty = 0
		1:
			difficulty = 1
		2:
			difficulty = 2
	dif.set_text(tr("difficulty"))

func _on_Exit_pressed():
	queue_free()
	get_tree().quit()

func _on_Play_pressed():
	get_parent().find_node("Tuto").init(difficulty)
	queue_free()
