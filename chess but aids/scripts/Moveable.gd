extends Node2D
var currentposition
var held

func _ready():
	currentposition = get_parent().currentposition
	set_position(currentposition)
	set_as_toplevel(true)
func _process(delta):
	held = get_parent().get_parent().held
	if held == false:
		get_parent().remove_child(self)