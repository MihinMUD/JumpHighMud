extends Area2D

export var scene: PackedScene

func _on_Potral_body_entered(body: Node) -> void:
	$AnimationPlayer.play("fadeIn")
	yield($AnimationPlayer, "animation_finished")
	get_tree().change_scene_to(scene)
