extends Node2D
var win = false
var points = 0
var up = false
var right = false
var down = false
var left = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if points == 4:
		win = true


func _on_up_area_entered(area: Area2D) -> void:
	if !up:
		points += 1
		$Sprite2D/Up.visible = true
		up = true


func _on_right_area_entered(area: Area2D) -> void:
	if !right:
		points += 1
		$Sprite2D/Right.visible = true
		right = true


func _on_down_area_entered(area: Area2D) -> void:
	if !down:
		points += 1
		$Sprite2D/Down.visible = true
		down = true


func _on_left_area_entered(area: Area2D) -> void:
	if !left:
		points += 1
		$Sprite2D/Left.visible = true
		left = true
