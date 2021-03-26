extends Control

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene("res://LevelSelector.tscn")

func _on_Button_pressed() -> void:
	get_tree().change_scene("res://LevelSelector.tscn")


func _on_About_pressed() -> void:
	get_tree().change_scene("res://Credits.tscn")
