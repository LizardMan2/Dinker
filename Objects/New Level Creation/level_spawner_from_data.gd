extends Node2D
var spawned = false
var canSpawn = true
var data: Array[Node]
var j = null
@export var objects: Array[ObjectSpawner]
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !spawned and canSpawn:
		data = get_children()
		
		for i in data:
			print(i.type)
			j = objects[i.type]
			print(j.name)
			var b = j.object.instantiate()
			get_parent().add_child(b)
			b.position = (Vector2(i.pos.x, i.pos.y) * 15) + Vector2(7.5, 7.5)
			if j.startDirection:
				b.data.startDirection = i.startDirection
			if j.endDirection:
				b.data.endDirection = i.endDirection
			if j.speed:
				b.data.speed = i.speed
			if j.length:
				b.data.length = i.length
			if j.inverted:
				b.data.inverted = i.inverted
			if j.instructions:
				b.data.instructions = i.instructions
			if j.color:
				b.data.color = i.color
			
			b = null
			j = null
		
		for i in data:
			i.queue_free()
		
		spawned = true
