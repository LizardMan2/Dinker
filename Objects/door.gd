extends Node2D

var input = false

var open = true
var length = 0
var rectLen = 1
var currentLength = 0

var trigger = false
var timer = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Label.text = str(length)
	timer -= delta
	if trigger and timer < 0:
		if open: #If open, close
			if rectLen < length * 15 + 2:
				rectLen += 1
				$Door.region_rect = Rect2(0,1,rectLen,9)
				$Door.position.y = rectLen / -2.0 - 6.5
				$"Laser Collide/CollisionShape2D".position.y = rectLen / -2.0 - 6.5
				$"Laser Collide/CollisionShape2D".scale.y = rectLen
			elif rectLen >= length * 15 + 2:
				trigger = false
				open = false
		else: #If closed, open
			if rectLen > 1:
				rectLen -= 1
				$Door.region_rect = Rect2(0,1,rectLen,9)
				$Door.position.y = rectLen / -2.0 - 6.5
				$"Laser Collide/CollisionShape2D".position.y = rectLen / -2.0 - 6.5
				$"Laser Collide/CollisionShape2D".scale.y = rectLen
			elif rectLen <= 1:
				trigger = false
				open = true
	if timer < 0:
		timer = .02
	#if Input.is_action_just_pressed("ui_accept"):
		#trigger = true
