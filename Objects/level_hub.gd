extends Node2D

var levels = []
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var root = $Tree.create_item()
	root.set_text(0, "Levels")
	
	
	levels = dir_contents("res://Levels/", root, levels)
	print(load(levels[0]))
	
	$Tree.get_root().uncollapse_tree()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $Tree.get_selected():
		var select = $Tree.get_selected().get_metadata(0)
		print(load(select))
		if select:
			var b = load(select)
			get_tree().change_scene_to_packed(b)

func dir_contents(path, tree, scene_loads = []):
	#var scene_loads = []	

	var dir = DirAccess.open(path)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			print(file_name)
			if dir.current_is_dir():
				print("Found directory: " + file_name)
				var item = $Tree.create_item(tree)
				item.set_text(0, file_name)
				item.set_metadata(0, false)
				
				var loaded = dir_contents(str(path + file_name + "/"), item, scene_loads)
				#scene_loads.append_array()
				
			else:
				if file_name.get_extension() == "tscn":
					var full_path = path.path_join(file_name)
					scene_loads.append(full_path)
					var item = $Tree.create_item(tree)
					item.set_text(0, file_name)
					item.set_metadata(0, full_path)
			file_name = dir.get_next()
			
	else:
		print("An error occurred when trying to access the path.")
	return scene_loads
