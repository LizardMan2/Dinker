extends Area2D
var dir = 0
var thing = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if typeof(thing) != typeof(0):
		match dir:
			0:
				thing.position.y = position.y - 15
			1:
				thing.position.x = position.x + 15
			2:
				thing.position.y = position.y + 15
			3:
				thing.position.x = position.x - 15



func _on_area_entered(area: Area2D) -> void:
	thing = area.get_parent()
