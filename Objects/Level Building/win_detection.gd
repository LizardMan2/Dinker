extends Area2D
@export var goTo: PackedScene
var winObjects: Array[Node2D]
var timer = 1
var won = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	timer -= delta
	won = true
	if timer < 0:
		for i in winObjects:
			if i.win == false:
				won = false
		if won:
			$CanvasLayer.visible = true
		timer = .1


func _on_area_entered(area: Area2D) -> void:
	winObjects.append(area.get_parent())


func _on_button_button_up() -> void:
	if goTo:
		get_tree().change_scene_to_packed(goTo)
	else:
		print("No Scene Set!")
