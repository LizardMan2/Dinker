extends Node

var timeScale = 1.0

var gridSize = 15

var level = ""

var keys = 0

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Debug"):
		if timeScale == 1.0:
			timeScale = .25
		else:
			timeScale = 1.0
