extends Node2D

var input = false
var state = -1
var activated = false
var rotating: Node2D
var trigger = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if trigger:
		if !activated:
			rotating.dir += state
		else:
			rotating.dir -= state
		activated = !activated
		trigger = false


func _on_area_2d_area_entered(area: Area2D) -> void:
	rotating = area.get_parent()
