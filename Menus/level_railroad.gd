extends Path2D

var target = 1034
var overallProgress = 0
var levelObjects: Array[PathFollow2D]
const levelCar = preload("res://Menus/Objects/LevelCar.tscn")
@export var levels: Array[LevelSelectData]
@export var carDist = 30

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var dist = len(levels) * carDist * -1
	for i in levels:
		var b = levelCar.instantiate()
		b.color = i.LevelColor
		b.object = i.LevelObject
		b.levelName = i.Name
		b.number = len(levelObjects)
		b.offset = dist
		add_child(b)
		dist += carDist
		levelObjects.append(b)
	print(levelObjects)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var nextStep = minf(lerpf(overallProgress, target, .02) - overallProgress, 3)
	overallProgress += nextStep
	$PathFollow2D.progress = overallProgress
	for i in levelObjects:
		i.progress = i.offset + overallProgress
