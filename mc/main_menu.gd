extends Node



func _on_lvl_1_pressed() -> void:
	get_tree().change_scene_to_file("res://mc/lvl1.tscn")


func _on_lvl_2_pressed() -> void:
	get_tree().change_scene_to_file("res://mc/lvl2.tscn")
