extends Node2D

var data = PuzzleData.new()
var input = true

var type = 0
var collisions = 0
@export var pressedColor: Color
var done = false
var types = ["default", "Red", "Blue"]
var state = false
var trigger = false
var triggered = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	
	if !done:
		$AnimatedSprite2D.animation = types[data.color + 1]
		done = true
	if collisions:
		$AnimatedSprite2D.scale = Vector2(.9, .9)
		$AnimatedSprite2D.modulate = pressedColor
		state = true
		if !triggered:
			trigger = true
			triggered = true
	else:
		$AnimatedSprite2D.scale = Vector2(1, 1)
		$AnimatedSprite2D.modulate = Color.WHITE
		state = false
		triggered = false
	if trigger:
		get_parent().layers[data.color] = !get_parent().layers[data.color]
		print(get_parent().layers[data.color])
		trigger = false


func _on_area_2d_area_entered(area: Area2D) -> void:
	collisions += 1


func _on_area_2d_area_exited(area: Area2D) -> void:
	collisions -= 1
