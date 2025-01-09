extends Resource
class_name Directions

@export var Up = 100
@export var UpRight = 100
@export var Right = 100
@export var DownRight = 100
@export var Down = 100
@export var DownLeft = 100
@export var Left = 100
@export var UpLeft = 100

@export var rotation = 0

func getRotation(dir:int):
	var direction = dir - rotation
	if direction < 0:
		direction += 8
	match direction:
		0: direction = Down + rotation
		1: direction = DownLeft + rotation
		2: direction = Left + rotation
		3: direction = UpLeft + rotation
		4: direction = Up + rotation
		5: direction = UpRight + rotation
		6: direction = Right + rotation
		7: direction = DownRight + rotation
		_: return null
	if direction > 7:
		direction -= 8
	return direction
