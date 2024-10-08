extends Node2D

var layer = -1

var inputs: Array[Node2D]

var outputs: Array[Node2D]

var trigger = false

var timer = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	timer -= delta
	if timer <= 0:
		for i in inputs:
			if i.trigger:
				trigger = true
				i.trigger = false
		if trigger:
			for i in outputs:
				i.trigger = true
			trigger = false
		timer = .1
