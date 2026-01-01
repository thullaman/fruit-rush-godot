extends Node

@onready var pointslable: Label = get_node("%pointslable")  # Ensure this is unique in the scene

var points = 0

func add_point():
	points += 1
	print(points)
	pointslable.text = "Melons: " + str(points)  # Update the label with the new points count
