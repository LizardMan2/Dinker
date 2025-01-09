extends Node2D

#U  = ( 0, -1) 0
#UR = ( 1, -1) 1
#R  = ( 1,  0) 2
#DR = ( 1,  1) 3
#D  = ( 0,  1) 4
#DL = (-1,  1) 5
#L  = (-1,  0) 6
#UL = (-1, -1) 7
#DELETE        8
const direction = {
	"U": Vector2( 0, -1),
	"UR":Vector2( 1, -1),
	"R": Vector2( 1,  0),
	"DR":Vector2( 1,  1),
	"D": Vector2( 0,  1),
	"DL":Vector2(-1,  1),
	"L": Vector2(-1,  0),
	"UL":Vector2(-1, -1)
	}

const laserPoint = preload("res://Objects/Remade Laser/laser_point.tscn")
@onready var laserPath: Path2D = $laserPath

@export var speed = 10
@export var length = 60
@export var distance = .8
@export var maxSteps = 40
var steps = 0

var container = []

@export var progress = 0.0

var currentPos = Vector2(0, 0)
var currentDir = 0
@export var nextDir = 0

var nextCollision = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	steps = maxSteps
	Point(Vector2(0,0))
	#spawn laser
	for i in range(length):
		var b = laserPoint.instantiate()
		laserPath.add_child(b)
		container.append(b)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	#nextDir = nextCollision.bounceDir.getRotation(nextDir)
	if container[1].touchedWall: 
		nextDir = 8
	
	if nextCollision:
		nextDir = nextCollision.bounceDir.getRotation(currentDir)
	
	$"laserPath/Sensor Container".progress_ratio = 1
	
	var nextProgress = delta * speed
	#if nextProgress > Globals.gridSize:
		#nextProgress = Globals.gridSize
	progress += nextProgress
	
	var j = 0
	while j < length:
		container[j].progress = progress - (j * distance)
		j += 1
	
	if container[0].progress == $"laserPath/Sensor Container".progress and nextDir < 8 and steps > 0:
		NextPoint()
		#print(str(currentPos) + "    " + str(nextDir) + "    " +str(nextCollision) + "    " + str(steps))
		if !nextCollision:
			steps -= 1
		nextCollision = false
		
	elif container[length - 1].progress == $"laserPath/Sensor Container".progress or steps <= 0:
		queue_free()
		print("Deleted")



func Point(point:Vector2):
	currentPos = point
	laserPath.curve.add_point(point)

func NextPoint():
	Point(currentPos + (getDir(nextDir) * Globals.gridSize))
	currentDir = nextDir
	

func getDir(input:int):
	match input:
		0: return direction.U
		1: return direction.UR
		2: return direction.R
		3: return direction.DR
		4: return direction.D
		5: return direction.DL
		6: return direction.L
		7: return direction.UL
	return direction.U


func _on_redirect_sensor_area_entered(area: Area2D) -> void:
	nextCollision = area
	print(nextCollision.bounceDir.rotation)
