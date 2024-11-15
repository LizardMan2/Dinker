extends Resource
class_name Object_Data

@export var canBeRotated = true
@export var texture_0: CompressedTexture2D
@export var texture_1: CompressedTexture2D
@export var texture_2: CompressedTexture2D
@export var texture_3: CompressedTexture2D

func texture(i):
	match i:
		0:
			return texture_0
		1:
			return texture_1
		2:
			return texture_2
		3:
			return texture_3
