extends Node2D
@export var Data: Array[Object_Data]
var selectedItem = -1
var rotItem = 0


var prevItem = -1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	$Ghost.position = Vector2i(int(get_global_mouse_position().x / 60) * 60 + 60, int(get_global_mouse_position().y / 60) * 60 + 60)
	
	
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
		selectedItem = -1
	
	if Input.is_action_just_released("LE_MB_L"):
		#selectedItem = -1
		pass
	
	
	if selectedItem >= 0:
		
		#Item Rotation
		if Input.is_action_just_pressed("LE_Rotate_L") and Data[selectedItem].canBeRotated:
			if rotItem - 1 < 0:
				rotItem = 3
			else:
				rotItem -= 1
			
		if Input.is_action_just_pressed("LE_Rotate_R") and Data[selectedItem].canBeRotated:
			if rotItem + 1 > 3:
				rotItem = 0
			else:
				rotItem += 1
				
				
		Input.set_custom_mouse_cursor(Data[selectedItem].texture(rotItem))
		$Ghost.texture = Data[selectedItem].texture(rotItem)
	else:
		Input.set_custom_mouse_cursor(null)
		$Ghost.texture = null
