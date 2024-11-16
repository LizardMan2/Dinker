extends TileMapLayer

@export var objects: Array[ObjectSpawner]

@export var scanner: Area2D
var dataStorage = null

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
			scanner.position = (Vector2(i.x, i.y) * 15) + Vector2(7.5, 7.5)
			
			for j in objects:
				if coords.x in range(j.corner1.x, j.corner2.x + 1) and coords.y in range(j.corner1.y, j.corner2.y + 1):
					var b = j.object.instantiate()
					get_parent().add_child(b)
					b.position = (Vector2(i.x, i.y) * 15) + Vector2(7.5, 7.5)
					if dataStorage:
						print("should not print")
						if j.startDirection:
							b.data.startDirection = dataStorage.startDirection
						if j.endDirection:
							b.data.endDirection = dataStorage.endDirection
						if j.speed:
							b.data.speed = dataStorage.speed
						if j.length:
							b.data.length = dataStorage.length
						if j.inverted:
							b.data.inverted = dataStorage.inverted
						if j.instructions:
							b.data.instructions = dataStorage.instructions
						if j.color:
							b.data.color = dataStorage.color
							
					#Data for tile map only
					if coords.x in range(0, 4) and coords.y in range(0, 4): #Remove after level editor done
						b.data.color = coords.y
						b.data.startDirection = coords.x
						print("Data Edited")
					if coords.x in range(4, 8) and coords.y in range(0, 2):
						b.data.color = coords.y
						b.data.startDirection = coords.x - 4
				data = null
		visible = false
		spawned = true


func _on_data_scanner_area_entered(area: Area2D) -> void:
	dataStorage = area
	print("entered area")
