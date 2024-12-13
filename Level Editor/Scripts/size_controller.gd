extends VBoxContainer
@onready var X_Line: LineEdit = $X/LineEdit
@onready var Y_Line: LineEdit = $Y/LineEdit

var gridSize = Vector2i(0,0)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if X_Line.text_changed:
		gridSize.x = int(X_Line.text)
	if Y_Line.text_changed:
		gridSize.y = int(Y_Line.text)



func _on_x_plus_button_down() -> void:
	gridSize.x += 1
	X_Line.text = str(gridSize.x)


func _on_x_minus_button_down() -> void:
	gridSize.x -= 1
	if gridSize.x < 0:
		gridSize.x = 0
	X_Line.text = str(gridSize.x)


func _on_y_plus_button_down() -> void:
	gridSize.y += 1
	Y_Line.text = str(gridSize.y)


func _on_y_minus_button_down() -> void:
	gridSize.y -= 1
	if gridSize.y < 0:
		gridSize.y = 0
	Y_Line.text = str(gridSize.y)
