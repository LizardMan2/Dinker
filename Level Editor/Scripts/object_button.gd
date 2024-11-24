extends Button
@export var spr: CompressedTexture2D
@export var rot = 0
var overlap = null
var new = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Sprite2D.texture = spr
	$Sprite2D.rotation_degrees = rot * 90

func _on_button_down() -> void:
	print("Hello")


func _on_focus_entered() -> void:
	$Sprite2D.material.set("shader_parameter/line_thickness", .7)


func _on_focus_exited() -> void:
	$Sprite2D.material.set("shader_parameter/line_thickness", 0)
