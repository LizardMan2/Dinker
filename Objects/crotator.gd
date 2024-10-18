extends Node2D

var active = false
var dir = 0

var collisions = 0

var trueDir = 0
var targetDeg = 0
var currentDeg = 0

var trigger = false
var input = false
var timer = 0

@export var laser: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if timer > 0:
		timer -= delta
		if timer <= 0:
			$"Colliders/Collector Collider".position.y = 0
	if active:
		$Sprite2D.play("active")
	else:
		$Sprite2D.play("default")
	
	targetDeg = 90 * dir
	if targetDeg != currentDeg:
		if currentDeg < targetDeg:
			currentDeg += 5
		if currentDeg > targetDeg:
			currentDeg -= 5
		$Sprite2D.rotation_degrees = currentDeg
		$Colliders.rotation_degrees = dir * 90
		trueDir = dir % 4
	
	if Input.is_action_just_pressed("ui_accept"):
		dir += 1
	if trigger and active:
		var b = laser.instantiate()
		get_parent().add_child(b)
		b.position = position
		b.defaultDir = trueDir
		active = false
func _on_collector_collider_area_entered(area: Area2D) -> void:
	if not active:
		active = true
		$"Colliders/Collector Collider".position.y = 3
		timer = .5
		
