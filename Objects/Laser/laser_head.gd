extends AnimatedSprite2D

var dir = 0
var delete = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_redirect_area_entered(area: Area2D) -> void:
	var bounce = area.get_parent().get_parent().trueDir
	if bounce == 0:
		if dir == 2:
			dir = 3
		if dir == 1:
			dir = 0
	elif bounce == 3:
		if dir == 0:
			dir = 3
		if dir == 1:
			dir = 2
	elif bounce == 2:
		if dir == 0:
			dir = 1
		if dir == 3:
			dir = 2
	elif bounce == 1:
		if dir == 2:
			dir = 1
		if dir == 3:
			dir = 0


func _on_delete_area_entered(area: Area2D) -> void:
	delete = true
