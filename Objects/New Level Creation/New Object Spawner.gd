extends TileMapLayer

@export var objects: Array[ObjectSpawner]

var spawned = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !spawned:
		var data = tile_map_data
		var mapPos = map_to_local(Vector2(0,0)) + Vector2(7 * 15, 15)
		var rect = get_used_rect().size
		var x = 0
		var y = 0
		for i in get_used_cells_by_id():
			var coords = get_cell_atlas_coords(i)
			for j in objects:
				if coords.x in range(j.corner1.x, j.corner2.x + 1) and coords.y in range(j.corner1.y, j.corner2.y + 1):
					var b = j.object.instantiate()
					get_parent().add_child(b)
					b.position = (Vector2(i.x, i.y) * 15) + Vector2(7.5, 7.5)
					if j.startDirection:
						pass
					if j.endDirection:
						pass
					if j.speed:
						pass
					if j.length:
						pass
					if j.inverted:
						pass
					if j.instructions:
						pass
					if j.color:
						pass
		
		visible = false
		spawned = true
