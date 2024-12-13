extends Panel
@onready var VBox: VBoxContainer = $VBoxContainer
@onready var siz: VBoxContainer = $"../CanvasLayer/Control/TabContainer/Settings/Size"
var HBoxObj = preload("res://Level Editor/Objects/h_box_default.tscn") 
var object = preload("res://Level Editor/Objects/object_button.tscn")

var HBoxHolder: Array[HBoxContainer]
var objectArray = []

var prevSize = Vector2i(0,0)
var currentSize = Vector2i(0,0)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	currentSize = siz.gridSize
	if currentSize.x != prevSize.x:
		
		var xDiff = currentSize.x - prevSize.x
		
		if xDiff > 0:
			var i = 0
			while i < xDiff:
				var b = HBoxObj.instantiate()
				VBox.add_child(b)
				HBoxHolder.append(b)
				var j = 0
				var holder = []
				while j < prevSize.y:
					var c = object.instantiate()
					b.add_child(c)
					holder.append(c)
					j += 1
				objectArray.append(holder)
				i += 1
		
		elif xDiff < 0:
			var i = 0
			while i > xDiff:
				
				for j in objectArray[len(objectArray) - 1]: queue_free()
				HBoxHolder[len(HBoxHolder) - 1].queue_free()
				HBoxHolder.pop_back()
				objectArray.pop_back()
				i -= 1
		
		
	if currentSize.y != prevSize.y:
		
		var yDiff = currentSize.y - prevSize.y
		
		if yDiff > 0:
			var i = 0
			while i < len(objectArray):
				var j = 0
				while j < yDiff:
					var b = object.instantiate()
					HBoxHolder[i].add_child(b)
					objectArray[i].append(b)
					j += 1
				i += 1
		
		elif yDiff < 0:
			var i = 0
			while i < len(objectArray):
				var j = 0
				while j > yDiff:
					objectArray[i][len(objectArray[i]) - 1].queue_free()
					objectArray[i].pop_back()
					j -= 1
				i += 1
	prevSize = currentSize
	size = currentSize * 15
	
	
