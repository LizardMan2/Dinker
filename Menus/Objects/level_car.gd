extends PathFollow2D

var color = 0
var offset = 0
var object: PackedScene
var levelName = ""
var number = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Control.rotation = rotation * -1
	if $Control/Button.is_hovered():
		$Control/Button.text = levelName
	else:
		$Control/Button.text = str(number)

func _on_button_button_up() -> void:
	Globals.level = str(object.resource_path)
	get_tree().change_scene_to_packed(load("res://Levels/Level Loader.tscn"))
