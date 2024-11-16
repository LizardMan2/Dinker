extends AnimatedSprite2D
var dir = 0
var delete = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_delete_area_entered(area: Area2D) -> void:
	delete = true
	print("Piece Delete")
