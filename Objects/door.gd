extends Node2D

var data = PuzzleData.new()

var input = false

var open = true
var rectLen = 1
var currentLength = 0

var trigger = false
var timer = 0

var activated = false
var prevAct = false

var first = true
enum types{Slide, Tile, Instant}
@export var doorType: types

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if first:
		if data.inverted:
			rectLen = data.length * 15 + 2
			$Door.region_rect = Rect2(0,1,rectLen,9)
			$Door.position.y = rectLen / -2.0 - 6.5
			$"Laser Collide/CollisionShape2D".position.y = rectLen / -2.0 - 6.5
			$"Laser Collide/CollisionShape2D".scale.y = rectLen
			open = false
			
		first = false
	
	
	if data.color in range(1, 3):
		activated = get_parent().layers[data.color - 1]
	if prevAct != activated:
		trigger = true
		prevAct = activated
	
	
	$Label.text = str(data.color)
	$DoorHinge.frame = data.color - 1
	rotation_degrees = data.startDirection * 90
	timer -= delta
	if trigger and timer < 0:
		match doorType:
			0: #Slide
				if open: #If open, close
					if rectLen < data.length * 15 + 2:
						rectLen += data.speed * Globals.timeScale
						$Door.region_rect = Rect2(0,1,rectLen,9)
						$Door.position.y = rectLen / -2.0 - 6.5
						$"Laser Collide/CollisionShape2D".position.y = rectLen / -2.0 - 6.5
						$"Laser Collide/CollisionShape2D".scale.y = rectLen
					elif rectLen >= data.length * 15 + 2:
						rectLen -= int(rectLen) % Globals.gridSize
						trigger = false
						open = false
				else: #If closed, open
					if rectLen > 1:
						rectLen -= data.speed * Globals.timeScale
						$Door.region_rect = Rect2(0,1,rectLen,9)
						$Door.position.y = rectLen / -2.0 - 6.5
						$"Laser Collide/CollisionShape2D".position.y = rectLen / -2.0 - 6.5
						$"Laser Collide/CollisionShape2D".scale.y = rectLen
					elif rectLen <= 1:
						rectLen = 1
						trigger = false
						open = true
			1: #Tile
				if open: #If open, close
					if rectLen < data.length * 15 + 2:
						rectLen += data.speed * Globals.timeScale
						$Door.region_rect = Rect2(0,1,rectLen,9)
						$Door.position.y = rectLen / -2.0 - 6.5
						$"Laser Collide/CollisionShape2D".position.y = Globals.gridSize * floor(rectLen / Globals.gridSize) / -2.0 - 6.5
						$"Laser Collide/CollisionShape2D".scale.y = Globals.gridSize * floor(rectLen / Globals.gridSize)
					elif rectLen >= data.length * 15 + 2:
						rectLen -= int(rectLen) % Globals.gridSize
						trigger = false
						open = false
				else: #If closed, open
					if rectLen > 1:
						rectLen -= data.speed * Globals.timeScale
						$Door.region_rect = Rect2(0,1,rectLen,9)
						$Door.position.y = rectLen / -2.0 - 6.5
						$"Laser Collide/CollisionShape2D".position.y = Globals.gridSize * floor(rectLen / Globals.gridSize) / -2.0 - 6.5
						$"Laser Collide/CollisionShape2D".scale.y = Globals.gridSize * floor(rectLen / Globals.gridSize)
					elif rectLen <= 1:
						rectLen = 1
						trigger = false
						open = true
			2: #Instant
				if open: #If open, close
					if rectLen < data.length * 15 + 2:
						rectLen += data.speed * Globals.timeScale
						$Door.region_rect = Rect2(0,1,rectLen,9)
						$Door.position.y = rectLen / -2.0 - 6.5
					elif rectLen >= data.length * 15 + 2:
						$"Laser Collide/CollisionShape2D".scale.y = data.length * 15 + 2
						$"Laser Collide/CollisionShape2D".position.y = -7.5 - (data.length * 15 / 2)
						rectLen -= int(rectLen) % Globals.gridSize
						trigger = false
						open = false
				else: #If closed, open
					if rectLen > 1:
						rectLen -= data.speed * Globals.timeScale
						$Door.region_rect = Rect2(0,1,rectLen,9)
						$Door.position.y = rectLen / -2.0 - 6.5
						$"Laser Collide/CollisionShape2D".scale.y = 0
						$"Laser Collide/CollisionShape2D".position.y = -7.5
					elif rectLen <= 1:
						rectLen = 1
						trigger = false
						open = true
	if timer < 0:
		timer = .02
	#if Input.is_action_just_pressed("ui_accept"):
		#trigger = true
