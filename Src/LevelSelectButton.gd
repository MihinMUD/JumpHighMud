extends Button

export var level: int

func _ready() -> void:
	text = str(level)


func _on_LevelSelectButton_pressed() -> void:
	get_tree().change_scene("res://Levels/Level" + str(level) +".tscn")
