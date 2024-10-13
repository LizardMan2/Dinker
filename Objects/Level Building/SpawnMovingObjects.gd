extends TileMapLayer
var canSpawn = false
@export var objects: Array[PackedScene]
var spawned = false

var doorDir = 0
var length = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !spawned and canSpawn:
		var data = tile_map_data
		var mapPos = map_to_local(Vector2(0,0)) + Vector2(7 * 15, 15)
		var rect = get_used_rect().size
		for i in get_used_cells_by_id():
			var coords = get_cell_atlas_coords(i)
			if coords.y == 1 and coords.x < 6:
				var b = objects[0].instantiate()
				get_parent().add_child(b)
				b.position = (Vector2(i.x, i.y) * 15) + Vector2(7.5, 7.5)
				match coords.x:
					0:
						b.state = -1
					1:
						b.state = 1
					2:
						b.state = 2
					3:
						b.state = -1
						b.back = false
					4:
						b.state = 1
						b.back = false
					5:
						b.state = 2
						b.back = false
						
			if coords.y == 0 and coords.x in [0, 1, 2, 3]:
				var b = objects[1].instantiate()
				get_parent().add_child(b)
				b.position = (Vector2(i.x, i.y) * 15) + Vector2(7.5, 7.5)
				match coords.x:
					0:
						doorDir = -1
					1:
						b.rotation_degrees = 90
						doorDir = 1
					2:
						b.rotation_degrees = 180
						doorDir = 1
					3:
						b.rotation_degrees = -90
						doorDir = -1
				var doorPos = i
				length = 0
				var doorCoords = Vector2i(0,0)
				if coords.x%2 == 0: #Vertical Door
					doorPos.y += doorDir
					doorCoords = get_cell_atlas_coords(doorPos)
					while doorCoords == Vector2i(5, 0):
						length += 1
						doorPos.y += doorDir
						doorCoords = get_cell_atlas_coords(doorPos)
				else: #Horizontal Door
					doorPos.x += doorDir
					doorCoords = get_cell_atlas_coords(doorPos)
					while doorCoords == Vector2i(4, 0):
						length += 1
						doorPos.x += doorDir
						doorCoords = get_cell_atlas_coords(doorPos)
				if doorCoords.x == (coords.x + 2)%4:
					length /= 2.0
				b.length = length
		visible = false
		spawned = true
