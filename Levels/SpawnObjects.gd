extends TileMapLayer
var canSpawn = false

@export var objects: Array[PackedScene]
var wallCoords = [Vector2i(0, 4), Vector2i(1, 4), Vector2i(2, 4), 
					Vector2i(3, 2), Vector2i(3, 3), Vector2i(3, 4)]
var spawned = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if !spawned and canSpawn:
		var data = tile_map_data
		var mapPos = map_to_local(Vector2(0,0)) + Vector2(7 * 15, 15)
		var rect = get_used_rect().size
		var x = 0
		var y = 0
		for i in get_used_cells_by_id():
			var coords = get_cell_atlas_coords(i)
			var wallType = wallCoords.find(coords)
			if coords.y in [0, 1] and coords.x < 4: #Bumpers
				var b = objects[0].instantiate()
				get_parent().add_child(b)
				b.position = (Vector2(i.x, i.y) * 15) + Vector2(7.5, 7.5)
				b.dir = coords.x
				b.col = coords.y
			elif coords == Vector2i(2, 3): #Player
				var b = objects[1].instantiate()
				get_parent().add_child(b)
				b.position = (Vector2(i.x, i.y) * 15) + Vector2(7.5, 7.5)
			elif wallType != -1: #Walls
				var b = objects[2].instantiate()
				get_parent().add_child(b)
				b.position = (Vector2(i.x, i.y) * 15) + Vector2(7.5, 7.5)
				b.state = wallType
			elif coords == Vector2i(0, 3):
				var b = objects[3].instantiate()
				get_parent().add_child(b)
				b.position = (Vector2(i.x, i.y) * 15) + Vector2(7.5, 7.5)
			elif coords in [Vector2i(0, 5),Vector2i(1, 5), Vector2i(2, 5)]:
				var b = objects[4].instantiate()
				get_parent().add_child(b)
				b.position = (Vector2(i.x, i.y) * 15) + Vector2(7.5, 7.5)
				b.type = coords.x
		visible = false
		spawned = true
		
