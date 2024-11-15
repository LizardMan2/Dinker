extends Resource

class_name ObjectSpawner

@export var object: PackedScene

##Object's location on parent tilemap top left corner
@export var corner1: Vector2i

##Object's location on parent tilemap bottom right corner
@export var corner2: Vector2i

enum direction{Up, Right, Down, Left}
enum col{Purple, Blue, Red, Yellow}

@export var startDirection = true
@export var endDirection = false

@export var speed = false

@export var length = false

@export var inverted = false

##Up, Right, Down, Left, Wait
@export var instructions = false

@export var color = false
