extends Area2D

@onready var gamemanager: Node = %gamemanager


func _on_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		queue_free()  # Remove the Area2D (collected item)
		if gamemanager != null:
			gamemanager.add_point()
		else:
			print("Error: gamemanager is null, cannot call add_point()")
