extends Node2D

var win = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_laser_collision_area_entered(area: Area2D) -> void:
	if Globals.keys > 0 and not win:
		Globals.keys -= 1
		win = true
