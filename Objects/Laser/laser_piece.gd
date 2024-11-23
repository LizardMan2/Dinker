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


func _on_delete_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	delete = true
