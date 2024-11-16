extends Node2D

var data = PuzzleData.new()
var dir = 0
var trueDir = 0
var targetDeg = 0
var currentDeg = 0
var knockTime = 0
var activated = false



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if data.color in range(1, 3):
		activated = get_parent().layers[data.color - 1]
	if activated:
		dir = data.endDirection
	else:
		dir = data.startDirection
	$spr/sprite.frame = data.color
	#Properly rotate the bumper's sprite in accordance with dir
	targetDeg = 90 * dir
	if targetDeg != currentDeg:
		if currentDeg < targetDeg:
			currentDeg += 5
		if currentDeg > targetDeg:
			currentDeg -= 5
		$spr.rotation_degrees = currentDeg
		$Colliders.rotation_degrees = dir * 90
		trueDir = dir
		while trueDir < 0:
			trueDir += 4
		trueDir = trueDir % 4
	$Label.text = str(trueDir)
	
	knockTime -= delta
	if knockTime > 0:
		$spr/sprite.position = Vector2(1, 1)
	else:
		$spr/sprite.position = Vector2(0, 0)


func _on_angled_collider_area_entered(area: Area2D) -> void:
	knockTime = .07
	
