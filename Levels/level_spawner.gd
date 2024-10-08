extends Node2D
var state = 0
var spawned = false
@export var layers: Array[TileMapLayer]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !spawned:
		print(layers[state].spawned)
		layers[state].canSpawn = true
		if layers[state].spawned:
			state += 1
		if state == len(layers):
			spawned = true
