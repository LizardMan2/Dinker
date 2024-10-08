extends Node2D

var state = -1
var types = ["HLeft", "HMid", "HRight", "VTop", "VMiddle", "VBottom"]
var done = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if state != -1 and not done:
		$AnimatedSprite2D.animation = types[state]
		done = true
		$Label.text = str(state)
