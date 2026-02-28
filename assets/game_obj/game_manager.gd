extends Node

@onready var pointslable: Label = get_node("%pointslable")  # Ensure this is unique in the scene
@export var hearts : Array[Node]

var points = 0
var lives = 3

func decrease_health():
	lives -= 1
	print(lives)
	for h in 3:
		if (h < lives):
			hearts[h].show()
		else:
				hearts[h].hide()
	if (lives == 0):
		get_tree().reload_current_scene()


func add_point():
	points += 1
	print(points)
	pointslable.text = "Melons: " + str(points)  # Update the label with the new points count
