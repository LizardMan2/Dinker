@tool
extends Sprite2D
class_name puzzleDataNode

##Will be set to false if being auto generated by level editor
@export var inEditor = true

@export_category("In Editor")
enum types{Bumper, Door, Player, Btn, FourPoint, hitAll, Lock, Key, Crotator, Diagonall}
enum direction{Up, Right, Down, Left}
enum col{Purple, Blue, Red, Yellow}

@export var pos: Vector2i

@export var startDirection: direction
@export var endDirection: direction

@export var speed = 1.0

@export var length = 1

@export var inverted = false

##Up, Right, Down, Left, Wait
@export_range(0,4,1) var instructions: Array[int]

@export_category("Auto")

@export var type: types

@export var color: col

var previous = [Vector2i.ZERO, 0, 0, 1.0, 1, false, 0, 0]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Engine.is_editor_hint():
		var current = [pos, startDirection, endDirection, speed, length, inverted, type, color]
		if previous != current:
			previous = current
			position = (Vector2(pos.x, pos.y) * 15) + Vector2(7.5, 7.5)
			match type:
				0: #"Bumper"
					var nums = Vector2(startDirection * 15, color * 15)
					texture.region = Rect2(nums.x, nums.y, 15, 15)
				1: #"Door"
					if not color in [1, 2]:
						color = 1
					var nums = Vector2(startDirection * 15 + 60, color * 15 - 15)
					texture.region = Rect2(nums.x, nums.y, 15, 15)
				2: #"Player"
					texture.region = Rect2(0, 60, 15, 15)
				3: #"Btn"
					if not color in [1, 2]:
						color = 1
					var nums = Vector2(color * 15 - 15, 90)
					texture.region = Rect2(nums.x, nums.y, 15, 15)
				4: #"FourPoint"
					texture.region = Rect2(0, 105, 15, 15)
				5: #"hitAll"
					texture.region = Rect2(15, 105, 15, 15)
				6: #"Lock"
					texture.region = Rect2(30, 105, 15, 15)
				7: #"Key"
					texture.region = Rect2(45, 105, 15, 15)
				8: #"Crotator"
					var nums = Vector2(startDirection * 15 + 60, 105)
					texture.region = Rect2(nums.x, nums.y, 15, 15)
				9: #Diagonall
					var nums = Vector2((startDirection % 2) * 15 + 60, color * 15 + 30)
					texture.region = Rect2(nums.x, nums.y, 15, 15)		
