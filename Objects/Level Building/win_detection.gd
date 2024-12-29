extends Area2D
@export var goTo: PackedScene
@onready var level_layers: Node2D = $".."
@onready var win_detection: Area2D = $"."
@onready var maxShots = level_layers.shots
var winObjects: Array[Node2D]
var timer = 1
var won = false
var lost = false
var shotsUsed = 0
var activeLasers = 0

var done = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !done:
		timer -= delta
		won = true
		if timer < 0:
			for i in winObjects:
				if i.win == false:
					won = false
			if won:
				$Win.visible = true
			timer = .1
		if maxShots > 0:
			if shotsUsed == maxShots and !won:
				lost = true
				$Loss.visible = true

func deleteSelf():
	$"../..".queue_free()

func _on_area_entered(area: Area2D) -> void:
	winObjects.append(area.get_parent())


func _on_button_button_up() -> void:
	if goTo:
		var b = goTo.instantiate()
		$"../../..".add_child(b)
		$"../AnimationPlayer".play("Exit")
		$Win.visible = false
		done = true
	else:
		print("No Scene Set!")


func _on_button_2_button_up() -> void:
	get_tree().change_scene_to_packed(preload("res://Levels/Level Hub.tscn"))


func _on_laser_detection_area_entered(area: Area2D) -> void:
	activeLasers += 1


func _on_laser_detection_area_exited(area: Area2D) -> void:
	activeLasers -= 1
	shotsUsed += 1


func _on_retry_button_up() -> void:
	get_tree().reload_current_scene()
