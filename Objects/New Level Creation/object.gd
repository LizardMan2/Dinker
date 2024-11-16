extends Resource

class_name PuzzleData

@export var startDirection = 0
@export var endDirection = 0

@export var speed = 1.0

@export var length = 1

@export var inverted = false

##Up, Right, Down, Left, Wait
@export_range(0,4,1) var instructions: Array[int]

@export_category("Auto")

@export var type: int
@export var pos: Vector2i
@export var color = 0
