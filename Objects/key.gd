extends Node2D


func _on_area_2d_area_entered(area: Area2D) -> void:
	Globals.keys += 1
	queue_free()
