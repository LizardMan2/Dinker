extends Node2D
var data = PuzzleData.new()
@export var laser:PackedScene
var dir = 0
var direction = 0
var targetDeg = 0
var currentDeg = 0

var cooldown = 0

var turnCooldown = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	turnCooldown -= delta
	cooldown -= delta
	
	if Input.is_action_pressed("ui_right") and turnCooldown <= 0:
		dir += 1
		direction = dir%8
		turnCooldown = .15
	if Input.is_action_pressed("ui_left") and turnCooldown <= 0:
		dir -= 1
		direction = dir%8
		turnCooldown = .15
	if Input.is_action_just_released("ui_right") or Input.is_action_just_released("ui_left"):
		turnCooldown = 0
		
	if direction < 0:
		direction += 8
	targetDeg = 45 * dir
	if targetDeg != currentDeg:
		if currentDeg < targetDeg:
			currentDeg += 5
		if currentDeg > targetDeg:
			currentDeg -= 5
		$Sprite2D.rotation_degrees = currentDeg
	
	if Input.is_action_pressed("ui_accept") and cooldown <= 0 and get_parent().shots != 0:
		var b = laser.instantiate()
		get_parent().add_child(b)
		b.position = position
		b.nextDir = direction
		cooldown = .8
		get_parent().shots -= 1
		
