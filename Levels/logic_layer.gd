extends TileMapLayer

var canSpawn = false

@export var objects: Array[PackedScene]
var spawned = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if !spawned and canSpawn:
		var data = tile_map_data
		var mapPos = map_to_local(Vector2(0,0)) + Vector2(7 * 15, 15)
		for i in get_used_cells_by_id():
			var coords = get_cell_atlas_coords(i)
			if coords == Vector2i(0,0):
				var b = objects[0].instantiate()
				get_parent().add_child(b)
				b.position = (Vector2(i.x, i.y) * 15) + Vector2(7.5, 7.5)
		
		visible = false
		spawned = true
