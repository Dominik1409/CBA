extends Node2D

var mouseposition
var currentposition = get_position()
var MoveSquare = load("res://Scenes/MoveSquare.tscn").instance()
var originalposition = currentposition
var piece
var held = false
var movearray
	
func _ready():
	piece = get_path()

func _process(delta):
	
#align mouse & piece to grid
#piece
	if not (Input.is_mouse_button_pressed(BUTTON_LEFT)):
		currentposition = get_position()
		currentposition.x = stepify(currentposition.x,32)
		currentposition.y = stepify(currentposition.y,32)
		if fmod(currentposition.x, 64) == 0:
			currentposition.x += 32
		if fmod(currentposition.y, 64) == 0:
			currentposition.y += 32
	if held == true:
		if (Input.is_mouse_button_pressed(BUTTON_LEFT)):
			set_position(mouseposition)
		else:
			if movearray != null:
				if (movearray.find(mouseposition) != -1):
					currentposition = mouseposition
					set_position(currentposition)
					print(movearray)
				else:
					set_position(originalposition)
				held = false
#mouse
	mouseposition = get_viewport().get_mouse_position()
	mouseposition.x = stepify(mouseposition.x,32)
	mouseposition.y = stepify(mouseposition.y,32)
	if (mouseposition == currentposition) and (held == false):
		pass
	elif fmod(currentposition.x, 64) == 0:
		currentposition.x += 32
	elif fmod(currentposition.y, 64) == 0:
		currentposition.y += 32


#detect click & show/hide squares
func _input(event):
	if(Input.is_mouse_button_pressed(BUTTON_LEFT)) and mouseposition == currentposition:
		held = true
		originalposition = currentposition
		if get_child_count() == 1:
			add_child(MoveSquare)
		movearray = get_child(1).movearray




#test prints
#	print("currentposition = ", currentposition)
#	print("mouseposition = ", mouseposition)
#	print(movearrayx)
#	print(movearrayy)