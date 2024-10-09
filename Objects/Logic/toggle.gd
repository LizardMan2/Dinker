extends Area2D

func _on_area_entered(area: Area2D) -> void:
	area.get_parent().trigger = true
	queue_free()
	
