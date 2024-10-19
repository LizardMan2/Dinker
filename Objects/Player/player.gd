extends Node2D

@export var laser:PackedScene
var dir = 0
var direction = 0
var targetDeg = 0
var currentDeg = 0

var cooldown = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	cooldown -= delta
	if Input.is_action_just_pressed("ui_right"):
		dir += 1
		direction = dir%4
	if Input.is_action_just_pressed("ui_left"):
		dir -= 1
		direction = dir%4
	if direction < 0:
		direction += 4
	targetDeg = 90 * dir
	if targetDeg != currentDeg:
		if currentDeg < targetDeg:
			currentDeg += 5
		if currentDeg > targetDeg:
			currentDeg -= 5
		$Sprite2D.rotation_degrees = currentDeg
	
	
	if Input.is_action_pressed("ui_accept") and cooldown <= 0:
		var b = laser.instantiate()
		get_parent().add_child(b)
		b.position = position
		b.defaultDir = direction
		cooldown = 0#.8     
		
