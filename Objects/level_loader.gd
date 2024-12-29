extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(Globals.firstLevel)
	var b = load(Globals.firstLevel).instantiate()
	add_child(b)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
