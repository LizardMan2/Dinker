extends Node2D

var spawned = ""
var levelPosition = 0
var spawnedLevels = []

var camVelo = 0
var camAccel = 200

func _init():
	spawnLevel(Globals.level)
	spawned = Globals.level

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Camera2D.make_current()
	if spawned != Globals.level:
		spawned = Globals.level
		spawnLevel(Globals.level)
	if $Camera2D.position.y > levelPosition + 81:
		camVelo += delta * camAccel
		$Camera2D.position.y -= camVelo * delta
		print($Camera2D.position)
	if $Camera2D.position.y < levelPosition + 81:
		$Camera2D.position.y = levelPosition + 81
		camAccel = 0
		print("Here")
		if len(spawnedLevels) > 1:
			spawnedLevels.front().queue_free()
			spawnedLevels.pop_front()

func spawnLevel(level):
	var b = load(Globals.level).instantiate()
	add_child(b)
	spawnedLevels.append(b)
	levelPosition -= 170
	b.position.y = levelPosition
	
