extends Node2D

@export var laserPiece: PackedScene

@export var laser: Array[Node2D]
var defaultDir = 0
var length = 10
var speed = .02
var timer = 0
var firstRun = true
var pieces = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if firstRun:
		firstRun = false
		laser[0].dir = defaultDir
	timer += delta
	if timer > speed:
		
		
		$Label.text = str(laser[0].dir)
		if pieces < length:
			var b = laserPiece.instantiate()
			add_child(b)
			laser.append(b)
			b.dir = defaultDir
			pieces += 1
				
		
		
		if not laser[0].delete:
			match laser[0].dir:
					0:#up
						laser[0].position.y -= 1
					1:#left
						laser[0].position.x += 1
					2:#down
						laser[0].position.y += 1
					3:#right
						laser[0].position.x -= 1
		else:
			if len(laser) == 3:
				queue_free()
		var i = len(laser) - 1
		while i > 0:
			if laser[i].delete:
				laser[i].queue_free()
				laser.pop_at(i)
			else:
				laser[i].position = laser[i-1].position
				
			i -= 1
				
		if $LaserHead.delete and len(laser) == 1:
			queue_free()
		timer = 0
