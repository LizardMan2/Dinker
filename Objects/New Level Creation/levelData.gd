extends Node2D

var layers = [false, false]

@export var shots = -1

@onready var shotDisplay: Label = $Label

var entered = false

func _ready() -> void:
	$AnimationPlayer.play("Enter")

func _process(delta: float) -> void:
	if shots > -1:
		shotDisplay.text = str(shots)
	else:
		shotDisplay.text = "∞"
