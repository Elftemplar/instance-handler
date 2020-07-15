extends Node


var spawn_point = preload("res://SpawnPoint.tscn")

export (Array, PackedScene) var items
onready var item_container: Node = $ItemContainers

func _ready() -> void:
	$Items.hide()
	spawn_block()


func spawn_block() -> void:
	for cell in $Items.get_used_cells():
		var id = $Items.get_cellv(cell)
		var type = $Items.tile_set.tile_get_name(id)
		
		for item in items:
			var title = item._bundled['names'][0]
			if title == type:
				var sp = spawn_point.instance()
				sp.setup(item_container, item)
				sp.position = $Items.map_to_world(cell)
				item_container.add_child(sp)
