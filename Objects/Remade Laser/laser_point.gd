extends PathFollow2D

var touchedWall = false

var deactivated = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#$Sprite2D.global_position = floor(global_position + Vector2(.5, .5))
	pass

func deactivate():
	if !deactivated:
		$Sprite2D.visible = false
		$Area2D.queue_free()
		deactivated = true

func _on_area_2d_2_area_entered(area: Area2D) -> void:
	touchedWall = true
	deactivate()


func _on_area_2d_2_body_entered(body: Node2D) -> void:
	touchedWall = true
	deactivate()
