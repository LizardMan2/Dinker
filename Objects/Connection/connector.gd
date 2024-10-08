extends Area2D

func _on_area_entered(area: Area2D) -> void:
	var a = area.get_parent()
	if a.input:
		get_parent().inputs.append(a)
	else:
		get_parent().outputs.append(a)
	queue_free()
