extends Position2D

var type
var instance
var parent
var recreate:bool = true

func setup(parent, type) ->void:
	self.type = type
	self.parent = parent

func _on_VisibilityNotifier2D_screen_entered() -> void:
	if recreate:
		instance = type.instance()
		instance.global_position = self.global_position
		parent.add_child(instance)
		

func _on_VisibilityNotifier2D_screen_exited() -> void:
	instance.queue_free()
