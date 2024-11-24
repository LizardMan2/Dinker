extends TextureButton
@export var itemNumber = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	#Input.set_custom_mouse_cursor(texture_normal)
	$"../../../../../../EditorControls".selectedItem = itemNumber
	$"../../../../../../EditorControls".rotItem = 0
